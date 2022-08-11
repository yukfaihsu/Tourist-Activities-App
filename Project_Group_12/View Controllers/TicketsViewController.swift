//
//  TicketsViewController.swift
//  Project_Group_12
//
//  Created by Yuk Fai Hsu on 2022-04-03.
//

import UIKit

class TicketsViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tvPurchasedTickets: UITableView!
    @IBOutlet weak var lblTotalCost: UILabel!
    
    var currUserPurchaseList:[Purchase] = []
    var user:String = ""
    var totalAmount:Double = 0.00
    
    var defaults:UserDefaults = UserDefaults.standard
    let db = Database.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tvPurchasedTickets.delegate = self
        tvPurchasedTickets.dataSource = self
        
        tvPurchasedTickets.rowHeight = 95
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        user = self.defaults.string(forKey: "Key_UserEmail")!
        if let purchaseListFromDefaults = self.defaults.value(forKey: "\(self.user)_Purchase") as? Data{
            let decoder = JSONDecoder()
            if let purchaseList = try? decoder.decode(Array.self, from: purchaseListFromDefaults) as [Purchase]{
                currUserPurchaseList = purchaseList
            }
        }
        
        totalAmount = 0
        for purchase in currUserPurchaseList{
            totalAmount += purchase.totalPrice
        }
        
        lblTotalCost.text = "Total is: $\(String(format: "%.2f", totalAmount))"
        
        tvPurchasedTickets.reloadData()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currUserPurchaseList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath) as! TicketTableViewCell
        let currPurchase = currUserPurchaseList[indexPath.row]
        
        let currentActivity = db.getActivityByName(name: currPurchase.activityName)
        
        cell.lblActivityName.text = currentActivity?.nameOfActivity
        cell.lblDate.text = "Date: \(currPurchase.date)"
        cell.lblNumTickets.text = "Number of tickets: \(currPurchase.numTickets)"
        cell.lblAmount.text = "Amount: $\(String(format: "%.2f", currPurchase.totalPrice))"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            currUserPurchaseList.remove(at: indexPath.row)
            tvPurchasedTickets.deleteRows(at: [indexPath], with: .fade)
            
            let encoder = JSONEncoder()
            if let encoded = try? encoder.encode(self.currUserPurchaseList) {
                self.defaults.set(encoded, forKey: "\(self.user)_Purchase")
            }
            else{
                print("Cannot save the purchase")
            }
            
            totalAmount = 0
            for purchase in currUserPurchaseList{
                totalAmount += purchase.totalPrice
            }
            
            lblTotalCost.text = "Total is: $\(String(format: "%.2f", totalAmount))"
        }
    }
}
