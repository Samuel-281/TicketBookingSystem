

import UIKit

class SaleMovieListCell: UITableViewCell {

    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var discountPriceLabel: UILabel!
    
    @IBOutlet weak var buyButton: UIButton!
    @IBOutlet weak var startTimeLabel: UILabel!
    @IBOutlet weak var endTimeLabel: UILabel!
    @IBOutlet weak var tipsLabel: UILabel!
    
    
    
    func showModel(model:TicketsModel){
        
        priceLabel.text = "$\(model.price)"
        discountPriceLabel.text = "Discount price $\(model.discontPrice)"
        startTimeLabel.text = model.startTime
        endTimeLabel.text = "\(model.endTime)"
        tipsLabel.text = model.tips
        
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        buyButton.layer.borderColor = UIColor.systemPink.cgColor
        buyButton.layer.borderWidth = 1
        buyButton.layer.cornerRadius = 4
        buyButton.layer.masksToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
