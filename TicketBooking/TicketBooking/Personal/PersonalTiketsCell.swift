

import UIKit

class PersonalTiketsCell: UITableViewCell {

    @IBOutlet weak var playTimeLabel: UILabel!
    @IBOutlet weak var seatNumberLable: UILabel!
    @IBOutlet weak var priceLable: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
