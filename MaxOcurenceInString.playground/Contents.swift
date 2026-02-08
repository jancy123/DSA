import UIKit

//spelling of character
//Dictionary can be defined = [:]
//dict.max { $0.value < $1.value }.key -> element a comes before element b if a is less than b... this is normal ordering . so the max value comes in the end.
//dict.max { $0.value > $1.value }.key -> element a comes before element b if a is greater than b... this is reverse ordering . so the smallest value comes in the end. and the smallest value will be the max
func findCharWithMaxOccurrence(input: String) -> Character? {
    guard !input.isEmpty else { return nil }
    var counts: [Character: Int] = [:]
    
    for char in input {
        counts[char, default: 0] += 1
    }
    
    //return counts.max{ $0.value < $1.value }?.key
    var max = 0
    var result: Character?
    for (key, value) in counts {
        if value > max {
            max = value
            result = key
        }
    }
    return result
}

findCharWithMaxOccurrence(input: "eebccece ")
