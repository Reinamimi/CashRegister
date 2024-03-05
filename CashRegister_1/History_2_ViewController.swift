//
//  History_2_ViewController.swift
//  CashRegister_1
//
//  Created by mac on 04/03/2024.
//

import UIKit

class History_2_ViewController: UIViewController {
    
    var product = HistoryEntry()

   
    @IBOutlet weak var productNameLbl: UILabel!
        
    @IBOutlet weak var quantityLbl: UILabel!
    
    @IBOutlet weak var timeStampLbl: UILabel!
    
    @IBOutlet weak var totalPriceLbl: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.title = product.productName
        
        productNameLbl.text = product.productName
        quantityLbl.text = String(product.quantity)
        timeStampLbl.text = "\(product.purchaseDate)"
        totalPriceLbl.text = "\(product.totalPrice)"
    
    }
 

}
