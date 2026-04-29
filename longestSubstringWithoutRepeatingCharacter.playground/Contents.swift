import UIKit

var greeting = "Hello, playground"
/*
class Solution:
    def lengthOfLongestSubstring(self, s: str) -> int:
        if not s:
            return 0
        if len(s) == 1:
            return 1
        left = 0
        visited = set()
        maxcount = 0
        visited.add(s[left])
        for right in range(1, len(s)): #"pwwkew" visited = "wk" maxcount = 2
            while s[right] in visited: # left = 1 right = 4
                visited.remove(s[left])
                left += 1
            
            visited.add(s[right])
            maxcount = max(maxcount, right-left+1)
            
        return maxcount
 
 
 ---------------
 Given a string s, find the length of the longest substring without duplicate characters.

  

 Example 1:

 Input: s = "abcabcbb"
 Output: 3
 Explanation: The answer is "abc", with the length of 3. Note that "bca" and "cab" are also correct answers.
 Example 2:

 Input: s = "bbbbb"
 Output: 1
 Explanation: The answer is "b", with the length of 1.
 Example 3:

 Input: s = "pwwkew"
 Output: 3
 Explanation: The answer is "wke", with the length of 3.
 Notice that the answer must be a substring, "pwke" is a subsequence and not a substring.

*/


    func lengthOfLongestSubstring(_ s: String) -> Int { //"abcabcbb"
        let chars = Array(s)
        var lastSeen = [Character: Int]()  // char -> last index   //
        var left = 0
        var maxLength = 0
        
        for right in 0..<chars.count {
            let char = chars[right]
            print("char: \(char)")
            print("right: \(right)")
            print("left: \(left)")
            // If we've seen this character and it's inside the current window right = 5 c prev = 3
            if let prevIndex = lastSeen[char], prevIndex >= left {
                print("prevIndex: \(prevIndex)")
                left = prevIndex + 1 //left = 2                 print("new left: \(left)")
            }
            
            lastSeen[char] = right
            print("inserting to dictionary lastSeen[\(char)]: \(right) ")
            print("Assigning max length, max(\(maxLength), \(right) - \(left) + 1")

            maxLength = max(maxLength, right - left + 1)
            
            print("maxlangth: \(maxLength)")
        }
        
        return maxLength
    }

lengthOfLongestSubstring("abcabcbb")



