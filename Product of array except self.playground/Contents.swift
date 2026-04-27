import UIKit

var greeting = "Hello, playground"
/*
 Given an integer array nums, return an array answer such that answer[i] is equal to the product of all the elements of nums except nums[i].

 The product of any prefix or suffix of nums is guaranteed to fit in a 32-bit integer.

 You must write an algorithm that runs in O(n) time and without using the division operation.

  

 Example 1:

 Input: nums = [1,2,3,4]
 Output: [24,12,8,6]
 Example 2:

 Input: nums = [-1,1,0,-3,3]
 Output: [0,0,9,0,0]
 
 */


func product(input: [Int]) -> [Int] {
    var product = [Int]()
    for i in 0..<input.count {
        product.append(1)
        for j in 0..<input.count {
            if i != j {
                product[i] = product[i] * input[j]
            }
        }
    }
    return product
}
product(input: [1,2,3,4])


func productExceptSelf(_ nums: [Int]) -> [Int] {
    let n = nums.count
    var result = Array(repeating: 1, count: n)
    
    var prefix = 1
    for i in 0..<n {
        result[i] = prefix
        prefix *= nums[i]
    }
    print(result)
    var suffix = 1
    for i in stride(from: n - 1, through: 0, by: -1) {
        result[i] *= suffix
        suffix *= nums[i]
    }
    
    return result
}
productExceptSelf([1,2,3,4])
