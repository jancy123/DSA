//checkfor anagram
// input: ["abc", "abb", "bba"]
//output: true

func checkForAnagram(input: [String]) -> Bool {
    var anagramCount = [String: Int]()
    for val in input {
        let sortedVal = String(val.sorted())
        if anagramCount[sortedVal] != nil {
            return true
        }
        anagramCount[sortedVal] = 1
    }
    return false
}

checkForAnagram(input: ["abc", "abb", "bba"])


//edge cases to ask

/*
 Ask or clarify:
 Are "Abc" and "bca" anagrams? (case-sensitive?)
 Should spaces count? ("listen" vs "silent "?)
 Unicode? (é vs e + accent)
 
 let normalized = val.lowercased().filter { $0.isLetter }
 
 
 “I sort each string so that all anagrams map to the same canonical form. I store these in a dictionary. If I ever see the same sorted string twice, I know two strings are anagrams and return true. This runs in O(n * k log k) time.”
 ask chatgpt what the O(n * k log k) is?
 */

// Fang style

func containsAnagramPair(_ words: [String]) -> Bool {
    var seen = Set<String>()

    for word in words {
        let key = String(word.sorted())
        if seen.contains(key) {
            return true
        }
        seen.insert(key)
    }

    return false
}
