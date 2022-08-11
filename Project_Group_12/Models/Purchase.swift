//
//  Purchase.swift
//  Project_Group_12
//
//  Created by Yuk Fai Hsu on 2022-04-03.
//

import Foundation

class Purchase:Codable{
    let activityName:String
    let activityPrice:Double
    let date:String
    let numTickets:Int
    
    var totalPrice:Double{
        get{
            return Double(numTickets) * activityPrice
        }
    }
    
    init(activityName:String, activityPrice:Double, date:String, numTickets:Int){
        self.activityName = activityName
        self.activityPrice = activityPrice
        self.date = date
        self.numTickets = numTickets
    }
}
