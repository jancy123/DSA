// The Swift Programming Language
// https://docs.swift.org/swift-book
import Foundation

struct Stack<Element: Equatable>: Equatable {
    fileprivate var stackArray: [Element] = []
    
    mutating func push(value: Element) {
        stackArray.append(value)
    }
    
    mutating func pop() -> Element? {
        stackArray.popLast()
    }
    
    func peek() -> Element? {
        stackArray.last
    }
}


extension Stack: CustomStringConvertible {
    var description: String {
        stackArray.map { "\($0)" }.joined(separator: " ")
    }
}

extension Stack: ExpressibleByArrayLiteral {
    init(arrayLiteral elements: Element...) {
        stackArray = elements
    }
    
}
