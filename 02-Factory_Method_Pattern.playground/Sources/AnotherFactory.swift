import Foundation

protocol Product {
    func use()
}

class Factory {
    final func create(_ owner: String) -> Product {
        let p = createProduct(owner)
        registerProduct(p)
        return p
    }
    
    func createProduct(_ owner: String) -> Product {
        fatalError()
    }
    
    func registerProduct(_ p: Product) {
        fatalError()
    }
}

struct IDCard: Product {
    var owner: String
    
    func use() {
        print("使用 " + owner + " 的 ID 卡。")
    }
    
    func getOwner() -> String {
        owner
    }
}

class IDCardFactory: Factory {
    var owners: [String] = []
    
    override func createProduct(_ owner: String) -> Product {
        IDCard(owner: owner)
    }
    
    override func registerProduct(_ p: Product) {
        owners.append((p as! IDCard).getOwner())
    }
}

public func testAnotherFactory() {
    let fct = IDCardFactory()
    let c1 = fct.create("A")
    let c2 = fct.create("B")
    let c3 = fct.create("C")
    
    c1.use()
    c2.use()
    c3.use()
}
