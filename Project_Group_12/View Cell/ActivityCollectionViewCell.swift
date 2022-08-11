//
//  ActivityCollectionViewCell.swift
//  Project_Group_12
//
//  Created by Samarth Joshi on 2022-04-01.
//

import UIKit

class ActivityCollectionViewCell: UICollectionViewCell
{
    
    @IBOutlet weak var activityImageView: UIImageView!
    @IBOutlet weak var activityDetails: UILabel!
    
    func populateCell(activity:Activity)
    {
        activityImageView.image = activity.imageOfActivity
        activityDetails.text = "\(activity.nameOfActivity) \nPrice: $\(activity.priceOfActivity) / person"
    }
}
