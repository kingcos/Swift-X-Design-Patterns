//: Playground - noun: a place where people can play
// Powered by https://kingcos.me from https://github.com/kingcos/Swift-X-Design-Patterns

import UIKit

protocol Iterator {
    associatedtype T
    
    func hasNext() -> Bool
    func next() -> T?
}

protocol Aggregate {
    associatedtype U: Iterator
    
    func iterator() -> U
}

// ---

struct Book {
    var name: String
}

class BookShelfIterator: Iterator {
    typealias T = Book
    
    var bookShelf: BookShelf
    var idx = 0
    
    init(_ bookShelf: BookShelf) {
        self.bookShelf = bookShelf
    }
    
    func hasNext() -> Bool {
        return idx < bookShelf.length
    }
    
    func next() -> Book? {
        defer { idx += 1 } // 先返回，再执行

        return bookShelf.get(idx)
    }
}

struct BookShelf : Aggregate {
    typealias U = BookShelfIterator
    
    private var books: [Book]
    
    var length: Int {
        books.count
    }
    
    init(_ books: [Book]) {
        self.books = books
    }
    
    func get(_ idx: Int) -> Book? {
        if idx >= books.count || idx < 0 {
            return nil
        }
        
        return books[idx]
    }
    
    mutating func append(_ book: Book) {
        books.append(book)
    }
    
    func iterator() -> BookShelfIterator {
        return BookShelfIterator(self)
    }
    
    func iterator2() -> BookShelfIterator2 {
        return makeIterator()
    }
}

// ---

var bs = BookShelf([Book(name: "A")])
bs.append(.init(name: "B"))
bs.append(.init(name: "C"))
bs.append(.init(name: "D"))

let iterator = bs.iterator()
while iterator.hasNext() {
    print(iterator.next()?.name ?? "")
}

// ---

// public protocol Sequence {
//     // ...
//
//     associatedtype Iterator : IteratorProtocol
//
//     func makeIterator() -> Self.Iterator
//
//     // ...
// }
extension BookShelf : Sequence {
    func makeIterator() -> BookShelfIterator2 {
        return BookShelfIterator2(self)
    }
}

// public protocol IteratorProtocol {
//     associatedtype Element
//
//     mutating func next() -> Self.Element?
// }
struct BookShelfIterator2 : IteratorProtocol {
    typealias Element = Book
    
    var bookShelf: BookShelf
    var idx = 0
    
    init(_ bookShelf: BookShelf) {
        self.bookShelf = bookShelf
    }
    
    mutating func next() -> Book? {
        defer { idx += 1 }
        
        return bookShelf.get(idx)
    }
}

var iterator2 = bs.iterator2()
while let next = iterator2.next() {
    print(next.name)
}

// 遵守 Sequence 协议后，for-in 将通过 Iterator 的 next 遍历
for i in bs {
    print(i.name)
}
