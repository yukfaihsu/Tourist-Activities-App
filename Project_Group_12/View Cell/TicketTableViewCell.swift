//
//  Ticket_TableViewCell.swift
//  Project_Group_12
//
//  Created by Yuk Fai Hsu on 2022-04-03.
//

import UIKit

class TicketTableViewCell: UITableViewCell {

    @IBOutlet weak var lblActivityName: UILabel!
    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var lblNumTickets: UILabel!
    @IBOutlet weak var lblAmount: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
