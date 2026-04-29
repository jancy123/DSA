import UIKit

var greeting = "Hello, playground"

//class Solution {
    func isPalindrome(_ s: String) -> Bool {
  
        /*
        for char in chars {
            print("char: \(char)")
            if char.isNumber || char.isLetter {
                print("adding")
                sWithalphanumeric.append(char)
            }
        }
        */
        var sWithalphanumeric = s.filter { $0.isLetter || $0.isNumber }
        
        print("sWithalphanumeric: \(sWithalphanumeric)")
        guard sWithalphanumeric.count > 1 else { return true }
        let sWithalphanumerics = Array(sWithalphanumeric.lowercased())
        var left = 0
        var right = sWithalphanumerics.count - 1
        while left < right {
            if sWithalphanumerics[left] != sWithalphanumerics[right] {
                return false
            }
            left += 1
            right -= 1
        }
        return true
    }


isPalindrome("A man, a plan, a canal: Panama")
//}


func betterIsPalindrome(_ s: String) -> Bool  {
    let chars = Array(s.lowercased())
    var left = 0
    var right = 0
    while left < right {
        if !chars[left].isNumber || !chars[left].isLetter {
            left += 1
            continue
        }
        if !chars[right].isNumber || !chars[right].isLetter {
            right += 1
            continue
        }
        if chars[left] != chars[right] {
            return false
        }
        left += 1
        right += 1
    }
    return true
}
betterIsPalindrome("A man, a plan, a canal: Panama")
