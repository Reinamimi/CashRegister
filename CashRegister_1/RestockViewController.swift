//
//  RestockViewController.swift
//  CashRegister_1
//
//  Created by mac on 04/03/2024.
//

import UIKit

class RestockViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
 
    // Array to hold products
    var products: [Product] = []
    
    @IBOutlet weak var quantityInputField: UITextField!
    
    @IBOutlet weak var stockTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Restock"

// Fetch product array from singleton and populate table view
        products = ProductManager.shared.getAllProducts()
        stockTable.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        products.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "stockTableCell")
        
        let product = products[indexPath.row]
        cell?.textLabel?.text = product.name
        cell?.detailTextLabel?.text = "\(product.quantity)"
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
          // Update input field with current quantity of selected product
          let selectedProduct = products[indexPath.row]
          quantityInputField.text = "\(selectedProduct.quantity)"
      }
    
    
    @IBAction func restockClicked(_ sender: Any) {
        guard let quantityStr = quantityInputField.text,
                 let quantity = Int(quantityStr),
                 let selectedIndexPath = stockTable.indexPathForSelectedRow else {
               // Show alert for invalid input
               showAlert(message: "Invalid input!  Please select a product and enter a valid quantity to restock.")
               return
           }
           
           let selectedProduct = products[selectedIndexPath.row]
           
           // Update product quantity
           let newQuantity = selectedProduct.quantity + quantity
           ProductManager.shared.updateProduct(product: selectedProduct, newQuantity: newQuantity)
           
           // Reload table view to reflect changes
           stockTable.reloadData()
           
           // Clear input field
           quantityInputField.text = ""
    }
    
    
    @IBAction func cancelClicked(_ sender: Any) {
        // Dismiss the Restock view controller
                self.dismiss(animated: true, completion: nil)
    }
    
    func showAlert(message: String) {
        let alert = UIAlertController(title: "Invalid Input", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true, completion: nil)
    }
    
}
