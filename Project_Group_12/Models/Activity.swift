//
//  Activity.swift
//  Project_Group_12
//
//  Created by Samarth Joshi on 2022-04-01.
//

import Foundation
import UIKit
class Activity
{
    let nameOfActivity:String;
    let priceOfActivity:Double;
    let imageOfActivity:UIImage;
    let descriptionOfActivity:String
    let hostOfActivity:String
    let popularActivity:Bool
    let websiteOfActivity:String
    
    init(nameOfActivity:String , priceOfActivity:Double , imageOfActivity: UIImage , descriptionOfActivity: String , hostOfActivity: String, popularActivity: Bool, websiteOfActivity:String)
    {
        self.nameOfActivity = nameOfActivity;
        self.imageOfActivity = imageOfActivity
        self.priceOfActivity = priceOfActivity
        self.descriptionOfActivity = descriptionOfActivity
        self.hostOfActivity = hostOfActivity
        self.popularActivity = popularActivity
        self.websiteOfActivity = websiteOfActivity
    }
}
