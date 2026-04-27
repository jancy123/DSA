import XCTest
@testable import Stack

final class StackTests: XCTestCase {
    var sut = Stack<Int>()
    
    override func setUp() {
        sut.push(value: 1)
        sut.push(value: 2)
        sut.push(value: 3)
    }
    
    func testPush() throws {
        XCTAssertEqual(sut.description, "1 2 3")
    }
    
    func testPop() {
        XCTAssertEqual(sut.pop(), 3)
    }
    
    func testPeek() {
        XCTAssertEqual(sut.peek(), 3)
    }
    
    func testInit() {
        let array: Stack = [1,2,3]
        XCTAssertEqual(array, sut)
    }
}
