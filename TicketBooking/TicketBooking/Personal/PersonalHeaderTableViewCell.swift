//
//  PersonalHeaderTableViewCell.swift
//  TicketBooking
//
//  Created by Yang on 2022/5/16.
//

import UIKit

class PersonalHeaderTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var headImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()

        
      let name =   UserDefaults.standard.value(forKey: "USERNAME") ?? ""
        
        nameLabel.text = name as? String
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
