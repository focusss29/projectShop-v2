//
//  Cart.swift
//  projectShop-v2
//
//  Created by Ilya Pogozhev on 10.08.2023.
//

import Foundation

class Cart {
    static let shared = Cart()
    var products = [Products]()
    private init() {
    }
    
    func totalAmount() -> Int {
        let total = products.reduce(0) { $0 + $1.price }
        return total
    }
}




