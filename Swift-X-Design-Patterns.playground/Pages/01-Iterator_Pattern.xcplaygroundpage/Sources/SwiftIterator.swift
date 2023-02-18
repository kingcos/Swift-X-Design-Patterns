import Foundation

fileprivate struct Book {
    var name: String
}

fileprivate struct SwiftBookShelf {
    var books: [Book]
    
    func get(_ idx: Int) -> Book? {
        if idx >= books.count || idx < 0 {
            return nil
        }
        
        return books[idx]
    }
}

// public protocol IteratorProtocol {
//     associatedtype Element
//
//     mutating func next() -> Self.Element?
// }
fileprivate struct SwiftBookShelfIterator : IteratorProtocol {
    typealias Element = Book
    
    var bookShelf: SwiftBookShelf
    var idx = 0
    
    init(_ bookShelf: SwiftBookShelf) {
        self.bookShelf = bookShelf
    }
    
    mutating func next() -> Book? {
        defer { idx += 1 }
        
        return bookShelf.get(idx)
    }
}

// public protocol Sequence {
//     // ...
//
//     associatedtype Iterator : IteratorProtocol
//
//     func makeIterator() -> Self.Iterator
//
//     // ...
// }
extension SwiftBookShelf : Sequence {
    func makeIterator() -> SwiftBookShelfIterator {
        return SwiftBookShelfIterator(self)
    }
}

public func testSwiftIterator() {
    var bs = SwiftBookShelf(books: [Book(name: "A")])
    bs.books.append(.init(name: "B"))
    bs.books.append(.init(name: "C"))
    bs.books.append(.init(name: "D"))
    
    var iterator = bs.makeIterator()
    while let next = iterator.next() {
        print(next.name)
    }
    
    // 遵守 Sequence 协议后，for-in 将会隐式调用 makeIterator() 并通过 next 遍历
    for i in bs {
        print(i.name)
    }
}
