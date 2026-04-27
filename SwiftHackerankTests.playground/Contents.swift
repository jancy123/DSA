import UIKit


//1
var greeting = "Hello, playground"
func process(_ input: [String?]) -> [String] {
    // fix this
    
    return input.compactMap({$0})
}


process(["this", nil, "follow"])



// Output prediction
var a = [1,2,3]
var b = a
b.append(4)
print(a)
//output: "[1,2,3]"\n

/*
✅ C. Protocols / extensions
protocol Drawable {
    func draw()
}
Then:
Add default implementation
Use protocol properly
*/

protocol Drawable {
    func draw()
}
class Circle: Drawable {
    func draw() {
        print("Add draw implementation here")
    }
}
let circle1 = Circle()
circle1.draw()

/*
✅ D. Closures
func perform(_ action: () -> Void) {
    action()
}
They might test:
Escaping closures
Capture lists
*/

func perform(_ action: @escaping () -> Void) {
    action()
}

//✅ E. Transaction Analytics API
/*
You’re given a JSON response from an API:
[
  { "userId": 1, "amount": 120.5, "category": "food" },
  { "userId": 2, "amount": 80.0, "category": "travel" },
  { "userId": 1, "amount": 40.0, "category": "food" },
  { "userId": 3, "amount": 200.0, "category": "shopping" },
  { "userId": 2, "amount": 20.0, "category": "food" }
]
✅ Task
Write a Swift function:
func topSpenders(from jsonData: Data, top n: Int) throws -> [Int]
Requirements:
Decode the JSON into Swift models
Compute total spending per user
Return top N userIds sorted by:
Highest total amount (descending)
If tie → smaller userId first
Handle invalid JSON using throws
💡 What this tests
Codable
Dictionary aggregation
Sorting with custom logic
Clean Swift code
Error handling
*/



let jsonString = """
[
  { "userId": 1, "amount": 120.5, "category": "food" },
  { "userId": 2, "amount": 80.0, "category": "travel" },
  { "userId": 1, "amount": 40.0, "category": "food" },
  { "userId": 3, "amount": 200.0, "category": "shopping" },
  { "userId": 2, "amount": 20.0, "category": "food" }
]
"""

let jsonData = Data(jsonString.utf8)

struct Transaction: Decodable {
    let userId: Int
    let amount: Double
    let category: String
}

func topSpenders(from jsonData: Data, top n: Int) throws -> [Int] {
    let transactions = try JSONDecoder().decode([Transaction].self, from: jsonData)
    var totals = [Int: Double]()
    
    for txn in transactions {
        totals[txn.userId, default: 0] += txn.amount
    }
    
    let sortedUsers = totals.sorted {
        if $0.value == $1.value {
            
            return $0.key < $1.key
        }
        return $0.value > $1.value
    }
    
    let groupedByCategory = Dictionary(grouping: transactions, by: {$0.category})
    return sortedUsers.prefix(n).map { $0.key }
}

let result = try topSpenders(from: jsonData, top: 2)
