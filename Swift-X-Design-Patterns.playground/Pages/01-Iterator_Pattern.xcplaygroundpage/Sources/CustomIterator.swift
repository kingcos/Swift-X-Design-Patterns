import Foundation

protocol Iterator {
    // 使用关联类型避免限定类型导致通用性不足
    associatedtype T
    
    func hasNext() -> Bool
    
    // next 中做两件事：
    // - 1. 返回下一个元素；
    // - 2. 迭代指向下一个元素（便于下次 next 调用）
    // 对于 2 需要改变内部变量，因此使用 mutating
    mutating func next() -> T?
}

protocol Aggregate {
    // 同样使用关联类型，但限定为遵守 Iterator 协议的类型
    associatedtype U: Iterator
    
    func iterator() -> U
}

fileprivate struct Book {
    var name: String
}

fileprivate struct CustomBookShelfIterator: Iterator {
    typealias T = Book
    
    var bookShelf: CustomBookShelf
    var idx = 0
    
    init(_ bookShelf: CustomBookShelf) {
        self.bookShelf = bookShelf
    }
    
    func hasNext() -> Bool {
        return idx < bookShelf.length
    }
    
    mutating func next() -> Book? {
        defer { idx += 1 } // 先返回，再执行

        return bookShelf.get(idx)
    }
}

fileprivate struct CustomBookShelf : Aggregate {
    typealias U = CustomBookShelfIterator
    
    private var books: [Book]
    
    var length: Int {
        books.count // 使用计算属性简化 API
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
    
    // 自定义 Iterator
    func iterator() -> CustomBookShelfIterator {
        return CustomBookShelfIterator(self)
    }
}

public func testCustomIterator() {
    var bs = CustomBookShelf([Book(name: "A")])
    bs.append(.init(name: "B"))
    bs.append(.init(name: "C"))
    bs.append(.init(name: "D"))
    
    var iterator = bs.iterator()
    while iterator.hasNext() {
        print(iterator.next()?.name ?? "")
    }
}
