

import UIKit

class MovieHeaderTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var startTimeLabel: UILabel!
    @IBOutlet weak var totalTimeLabel: UILabel!
    
    @IBOutlet weak var fristDayButton: UIButton!
    @IBOutlet weak var seconDayButton: UIButton!
    @IBOutlet weak var thirdDayButton: UIButton!
    @IBOutlet weak var fourDayButton: UIButton!
    
    @IBOutlet weak var line1View: UIView!
    @IBOutlet weak var line2View: UIView!
    @IBOutlet weak var line3View: UIView!
    @IBOutlet weak var line4View: UIView!
    
    
    var segementButtonClick:((_ index:Int)->(Void))?
    
    var buttonArray:[UIButton]{
        
        return [fristDayButton,seconDayButton,thirdDayButton,fourDayButton]
    }
    
    var lineViewArray:[UIView]{
        
        return [line1View,line2View,line3View,line4View]
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
    }
    
    func showModelWith(_ model:MovieDataModel){
        
        movieImageView.image = UIImage(named: "\(model.img)")
        nameLabel.text = model.name
        startTimeLabel.text = "Release time：\(model.startTime)"
        totalTimeLabel.text = "Time：\(model.playTime) min"
        
    }
    
    @IBAction func segementButtonClick(_ sender: UIButton) {
        
        for button in buttonArray{
            
            if button == sender{
                button.setTitleColor(.black, for: .normal)
                lineViewArray[sender.tag-10].isHidden = false
                
                segementButtonClick!(sender.tag-10)
            }else{
                button.setTitleColor(.lightGray, for: .normal)
                lineViewArray[sender.tag-10].isHidden = true
            }
        }
        for lineV in lineViewArray{
            
            if lineV.tag == sender.tag + 10{
               
                lineV.isHidden = false
            }else{
                lineV.isHidden = true
            }
        }
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
