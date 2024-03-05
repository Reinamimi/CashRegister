//
//  ProductManager.swift
//  CashRegister_1
//
//  Created by mac on 04/03/2024.
//

import Foundation

class ProductManager {
    static let shared = ProductManager()
    
    private var products: [Product] = [
        Product(name: "Hat", quantity: 20, price: 10.0),
        Product(name: "Shirt", quantity: 15, price: 20.0),
        Product(name: "Pants", quantity: 10, price: 30.0),
        Product(name: "Shoes", quantity: 25, price: 40.0),
        Product(name: "Socks", quantity: 30, price: 5.0)
    ]
    
    func getAllProducts() -> [Product] {
        return products
    }
    
    func updateProduct(product: Product, newQuantity: Int) {
        if let index = products.firstIndex(where: { $0.name == product.name }) {
            products[index].quantity = newQuantity
        }
    }
}
