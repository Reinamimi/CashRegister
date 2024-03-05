//
//  HistoryEntry.swift
//  CashRegister_1
//
//  Created by mac on 03/03/2024.
//

import Foundation

class HistoryEntry {
    var productName: String
    var quantity: Int
    var totalPrice: Double
    var purchaseDate: Date

    init(name: String, quantity: Int, totalPrice: Double, purchaseDate: Date) {
        self.productName = name
        self.quantity = quantity
        self.totalPrice = totalPrice
        self.purchaseDate = purchaseDate
    }
    
    init(){
        self.productName = ""
        self.quantity = 0
        self.totalPrice = 0
        self.purchaseDate = Date()
    }
}
