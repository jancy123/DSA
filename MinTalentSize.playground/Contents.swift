import UIKit

/*
 🧠 Problem (reconstructed)
 You have n students sitting in a line.
 Each student has a talent type (values from 1 to talentCount).
 For each index i, you need to find the minimum size of a contiguous team starting at i such that the team contains all talents from 1 to talentCount at least once.
 If it’s not possible, return -1.
 📥 Example
 talentCount = 3
 students = [1,2,3,2,1]
 📤 Output
 [3,4,3,-1,-1]
 🤔 Why?
 Let’s walk it:
 i = 0 → [1,2,3] → ✅ all talents → length = 3
 i = 1 → [2,3,2,1] → ✅ → length = 4
 i = 2 → [3,2,1] → ✅ → length = 3
 i = 3 → [2,1] → ❌ missing 3 → -1
 i = 4 → [1] → ❌ → -1
 */


var greeting = "Hello, playground"
func minTeamSizes(talentCount: Int, students: [Int]) -> [Int] {
    let n = students.count
    var result = Array(repeating: -1, count: n)
    
    var freq: [Int: Int] = [:]
    var distinct = 0
    var right = 0
    
    for left in 0..<n {
        while right < n && distinct < talentCount {
            let val = students[right]
            freq[val, default: 0] += 1
            if freq[val] == 1 {
                distinct += 1
            }
            right += 1
        }
        
        if distinct == talentCount {
            result[left] = right - left
        }
        
        let leftVal = students[left]
        freq[leftVal]! -= 1
        if freq[leftVal]! == 0 {
            distinct -= 1
        }
    }
    
    return result
}


minTeamSizes(talentCount: 3, students: [1,2,3,2,1])
