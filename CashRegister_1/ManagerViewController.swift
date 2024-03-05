//
//  ManagerViewController.swift
//  CashRegister_1
//
//  Created by mac on 03/03/2024.
//

import UIKit

class ManagerViewController: UIViewController {
    
    var history: [HistoryEntry] = []
    

    override func viewDidLoad() {
        super.viewDidLoad()

        
      
       
    
        // Do any additional setup after loading the view.
    }

    
   
    @IBAction func historyClicked(_ sender: Any) {
        
        print("passed History array length: \(history.count)")
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    //    pass purchase data to the history VC
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "historySegue" {
                if let historyVC = segue.destination as? HistoryViewController {
                    historyVC.history = history
                    print("from ManagerVC-Prepare: \(historyVC.history)")
                }
            }
        }


}
