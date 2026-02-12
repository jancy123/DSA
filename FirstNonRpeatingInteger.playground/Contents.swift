
//LeetCode 387 – First Unique Character in a String

// Write a function that takes an array of integers as input and returns the first non repeating integer from that array. // Example: Input: [ 2, 5, 1, 3, 1, 2, 3, 1, 2 ] Output: 5 // Example: Input: [ 2, 7, 5, 1, 3, 1, 2, 3, 1, 2 ] Output: 7

func findFirstNonRepeatingInteger(_ inputArray: [Int]) -> Int {
    var countDictionary: [Int: Int] = [:]
    for value in inputArray {
        if let existingCount = countDictionary[value] {
            countDictionary[value] = existingCount + 1
        } else {
            countDictionary[value] = 1
        }
    }
    for value in inputArray {
        if countDictionary[value] == 1 {
            return value
        }
    }
    return 0
}
findFirstNonRepeatingInteger([ 2, 5, 1, 3, 1, 2, 3, 1, 2 ])
findFirstNonRepeatingInteger([ 2, 7, 5, 1, 3, 1, 2, 3, 1, 2 ])
