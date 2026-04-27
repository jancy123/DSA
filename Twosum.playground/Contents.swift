import UIKit

var greeting = "Hello, playground"
// Given an array of integers nums and an integer target, return indices of the two numbers such that they add up to target.
/*
 Example 1:

 Input: nums = [2,7,11,15], target = 9
 Output: [0,1]
 Explanation: Because nums[0] + nums[1] == 9, we return [0, 1].
 Example 2:

 Input: nums = [3,2,4], target = 6
 Output: [1,2]
 Example 3:

 Input: nums = [3,3], target = 6
 Output: [0,1]

 */


func twoSum(input: [Int], target: Int) -> [Int] {
    var indexMap = [Int: Int]()
    // doing input.enumerated gives
    for (i, num) in input.enumerated() {
        let complement = target - input[i]
        
        
        if let complementIndice = indexMap[complement] {
            return [complementIndice, i]
        } else {
            indexMap[input[i]] = i
        }
    }
    return []
}
twoSum(input: [2,7,11,15],target: 9)


//O(n)


//Better solution to avoid two lookups(contain + insert)


