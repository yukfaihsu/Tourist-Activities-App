//
//  ActivityDetailsViewController.swift
//  Project_Group_12
//
//  Created by Yuk Fai Hsu on 2022-04-03.
//

import UIKit

class ActivityDetailsViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var nameOfActivity: UILabel!
    @IBOutlet weak var imageOfActivity: UIImageView!
    @IBOutlet weak var descriptionOfActivity: UILabel!
    @IBOutlet weak var hostOfActivity: UILabel!
    @IBOutlet weak var priceOfActivity: UILabel!
    @IBOutlet weak var btnWebsite: UIButton!
    @IBOutlet weak var pvNumTickets: UIPickerView!
    @IBOutlet weak var dpDate: UIDatePicker!
    @IBOutlet weak var btnPurchaseTickets: UIButton!
    
    
    var currentActivityName:String? = nil
    var user:String = ""
    var currUserPurchaseList:[Purchase] = []
    var dataForPickerView:[Int] = [1, 2, 3, 4, 5]
    var defaults:UserDefaults = UserDefaults.standard
    let db = Database.shared
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let currentActivity = db.getActivityByName(name: currentActivityName!)
        
        nameOfActivity.text = currentActivity?.nameOfActivity
        imageOfActivity.image = currentActivity?.imageOfActivity
        descriptionOfActivity.text = currentActivity?.descriptionOfActivity
        priceOfActivity.text = "Price: $\(currentActivity!.priceOfActivity) / person"
        hostOfActivity.text = "Host: \(currentActivity!.hostOfActivity)"
        
        let currentDate = Date()
        dpDate.minimumDate = currentDate
        
        pvNumTickets.delegate = self
        pvNumTickets.dataSource = self
        
        user = self.defaults.string(forKey: "Key_UserEmail")!
        if let purchaseListFromDefaults = self.defaults.value(forKey: "\(self.user)_Purchase") as? Data{
            let decoder = JSONDecoder()
            if let purchaseList = try? decoder.decode(Array.self, from: purchaseListFromDefaults) as [Purchase]{
                currUserPurchaseList = purchaseList
            }
        }
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Log out", style: .plain, target: self, action: #selector(logoutPressed))
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return dataForPickerView.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(dataForPickerView[row])"
    }
    

    @IBAction func btnWebsitePressed(_ sender: Any) {
        
        guard let nextScreen = storyboard?.instantiateViewController(withIdentifier: "websiteScreen") as? WebViewViewController else{
            print("Cannot go to the website")
            return
        }
        let currentActivity = db.getActivityByName(name: currentActivityName!)
        nextScreen.website = currentActivity!.websiteOfActivity
        
        self.navigationController?.pushViewController(nextScreen, animated: true)
    }
    

    @IBAction func btnPurcahsePressed(_ sender: Any) {
        let index = pvNumTickets.selectedRow(inComponent: 0)
        let numTickets:Int = dataForPickerView[index]
        let datePicked = dpDate.date.formatted(date: .abbreviated, time: .omitted)
        
        let currentActivity = db.getActivityByName(name: currentActivityName!)
        let purchase = Purchase(activityName: currentActivity!.nameOfActivity, activityPrice: currentActivity!.priceOfActivity, date: datePicked, numTickets: numTickets)
        
        let box = UIAlertController(title: "Purchase Confirmation", message: "\(currentActivity!.nameOfActivity)\nDate: \(datePicked)\nNumber of tickets: \(numTickets)\nAmount: $\(String(format:"%.2f", purchase.totalPrice))", preferredStyle: .alert)
        
        box.addAction(UIAlertAction(title: "Confirm", style: .default, handler: {
            action in
            
            self.currUserPurchaseList.append(purchase)
            
            let encoder = JSONEncoder()
            if let encoded = try? encoder.encode(self.currUserPurchaseList) {
                self.defaults.set(encoded, forKey: "\(self.user)_Purchase")
            }
            else{
                print("Cannot save the purchase")
            }
            
            let purchaseCompleted_Box = UIAlertController(title: "Purchase Completed", message: "Amount: $\(String(format:"%.2f", purchase.totalPrice))", preferredStyle: .alert)
            purchaseCompleted_Box.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self.present(purchaseCompleted_Box, animated: true)
        }))
        box.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        self.present(box, animated: true)
    }
    
    @objc func logoutPressed(){
        self.defaults.set(false, forKey: "IsLoggedIn")
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let LoginNavigationController = storyboard.instantiateViewController(identifier: "LoginNavigationController")

        // This is to get the SceneDelegate object from your view controller
        // then call the change root view controller function to change to main tab bar
        (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(LoginNavigationController)
        
    }
}
