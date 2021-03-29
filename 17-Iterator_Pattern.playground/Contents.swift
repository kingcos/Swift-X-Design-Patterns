//: Playground - noun: a place where people can play
// Powered by https://kingcos.me from https://github.com/kingcos/Swift-X-Design-Patterns

import UIKit

// Crowd 序列
struct Crowd: Sequence {
    let end: Int
    
    func makeIterator() -> CrowdIterator {
        return CrowdIterator(self)
    }
}

// Crowd 迭代器
struct CrowdIterator: IteratorProtocol {
    var crowd: Crowd
    var times: Int
    
    init(_ crowd: Crowd) {
        self.crowd = crowd
        times = crowd.end - 1
    }
    
    mutating func next() -> Int? {
        let nextNumber = crowd.end - times
        guard nextNumber <= crowd.end else { return nil }
        
        times -= 1
        return nextNumber
    }
}

// 迭代
for i in Crowd(end: 10) {
    print(i)
}

// -·-·-·-·-

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
        defer {
            idx += 1
        }

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
        if idx > books.count && idx < 0 {
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
