//
//  HistoryViewController.swift
//  CashRegister_1
//
//  Created by mac on 03/03/2024.
//

import UIKit

class HistoryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var history: [HistoryEntry] = []
    
    var selectedEntry = HistoryEntry()
    
// Declaring a var to store the selected index path:
    var selectedIndexPath: IndexPath?
    
    
    @IBOutlet weak var historyTable: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "History Items"
        print("\(history)")
        
                
//                // Reload table view data after populating products
//                historyTable.reloadData()
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return history.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        
        let purchase = history[indexPath.row]
        cell?.textLabel!.text = purchase.productName
        cell?.detailTextLabel!.text = " \(purchase.quantity)"
        
        return cell!
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // Perform segue when a row is selected
               performSegue(withIdentifier: "history2_Segue", sender: indexPath)

        
    }
    
    
    //    pass purchase data to the history2 VC
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "history2_Segue" {
                       if let indexPath = sender as? IndexPath {
                           let selectedEntry = history[indexPath.row]
                           if let history2VC = segue.destination as? History_2_ViewController {
                               history2VC.product = selectedEntry
                               print("from historyVC-Prepare: \(selectedEntry.productName)")
                           }
                       }
                   }
               }
    

}
