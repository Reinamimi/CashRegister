//
//  ViewController.swift
//  CashRegister_1
//
//  Created by mac on 02/03/2024.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var selectedProductLabel: UILabel!
    
    @IBOutlet weak var quantityLabel: UILabel!
    
    @IBOutlet weak var totalAmountLabel: UILabel!
    
    @IBOutlet weak var productsTable: UITableView!
    
    // Array to hold products
    var products: [Product] = []
    
    // Array to hold purchases
    var history: [HistoryEntry] = []
    
    var newPurchase = HistoryEntry()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Cash Register App"
        // Populate the products array with random data
                products = [
                    Product(name: "Hat", quantity: 20, price: 10.0),
                    Product(name: "Shirt", quantity: 15, price: 20.0),
                    Product(name: "Pants", quantity: 10, price: 30.0),
                    Product(name: "Shoes", quantity: 25, price: 40.0),
                    Product(name: "Socks", quantity: 30, price: 5.0)
                ]
                
                // Reload table view data after populating products
                productsTable.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? productTableViewCell
        
        let product = products[indexPath.row]
        cell?.productNameLabel.text = product.name
        cell?.productQuantityLabel.text = "\(product.quantity)"
        cell?.productPriceLabel.text = "\(product.price)"
        return cell!
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        selectedProductLabel.text = products[indexPath.row].name
        
    }
    
    
    @IBAction func digitClicked(_ sender: UIButton) {
        
        print("test line 65")
        guard let currentSelection = sender.titleLabel?.text,
               let selectedProduct = selectedProductLabel.text,
               let product = products.first(where: { $0.name == selectedProduct }) else {
             return
         }
       
        print("test line 72")
            if quantityLabel.text == "Quantity" {
                quantityLabel.text = currentSelection
            } else {
                // If it's not, append the selected digit to the current text
                if let currentText = quantityLabel.text, let currentValue = Int(currentText) {
                    quantityLabel.text = "\(currentValue)\(currentSelection)"
                }
            }
        

        if let quantity = Int(quantityLabel.text!) {
            // Calculate and update the totalAmountLabel
            let totalPrice = Double(quantity) * product.price
            totalAmountLabel.text = "\(totalPrice)"
        }
        
    }
    
    @IBAction func buyClicked(_ sender: Any) {
        
        guard let selectedProduct = selectedProductLabel.text,
              let selectedQuantity = Int(quantityLabel.text!),
              let totalAmount = Double(totalAmountLabel.text!),
               let product = products.first(where: { $0.name == selectedProduct }) else {
            print("test guard at buy clicked")
             return
         }

        
        
        if selectedQuantity > product.quantity {
            let alert = UIAlertController(title: "Invalid entry", message: "Kindly enter a valid product quantity", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel))
            present(alert, animated: true)
        
            quantityLabel.text = "Quantity"
            totalAmountLabel.text = "Total"
        } else {
            // Initialize newPurchase object with default values
                newPurchase = HistoryEntry()
            // After purchase is made...
            newPurchase.productName = selectedProduct
            newPurchase.quantity = selectedQuantity
            newPurchase.totalPrice = totalAmount
            newPurchase.purchaseDate = Date()
            
            history.append(newPurchase)
            print("from Buy: \(history)")
      
            let initialQuantity = product.quantity
            product.quantity = initialQuantity - selectedQuantity
            productsTable.reloadData()
            selectedProductLabel.text = "Type"
            quantityLabel.text = "Quantity"
            totalAmountLabel.text = "Total"
            
        }
        
        
    }
  
//    pass purchase data to the manager VC
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "managerSegue" {
            if let managerVC = segue.destination as? ManagerViewController {
                managerVC.history = history
                print("from VC-Prepare: \(managerVC.history)")
            }
        }
    }

    
    


}

