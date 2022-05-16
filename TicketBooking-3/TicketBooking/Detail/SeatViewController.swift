
import UIKit

class SeatViewController: UIViewController {
    
    var ticket:TicketsModel!
    var seatArray:[Int] = [Int]()
    
    @IBOutlet weak var totalLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Select seat"
        // Do any additional setup after loading the view.
    }
    

    @IBAction func buyNowButtonClick(_ sender: UIButton) {
        
        showAlertWith(msg: "\(seatArray)")
        
    }
    
    @IBAction func seatButtonClick(_ sender: UIButton) {
        
       // let button = self.view.viewWithTag(sender.tag) as! UIButton
        sender.isSelected = !sender.isSelected
        if (sender.isSelected == true){
            
            sender.setImage(UIImage(named: "selected"), for: .normal)
            if (!seatArray.contains(sender.tag)){
                
                seatArray.append(sender.tag)
            }
            
            totalLabel.text = "Total fee \(Int(ticket.price)!  * seatArray.count)"
          
        }else{
            sender.setImage(UIImage(named: "choosable"), for: .normal)
            
            if (seatArray.contains(sender.tag)){
                
                for (index , item) in seatArray.enumerated(){
                    
                    if (item == sender.tag){
                        seatArray.remove(at: index)
                        
                        totalLabel.text = "Total fee\(Int(ticket.price)!  * seatArray.count)"
                        return
                    }
                }
            }
        }
        
       
        print(seatArray)
    }
    
    func showAlertWith(msg:String){
        
        let alet = UIAlertController(title: "You choose\(msg),order processing，please go to pay it", message: nil, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "YES", style: .default) { action in
            
            self.navigationController?.popViewController(animated: true)
            
        }
        
        alet.addAction(okAction)
        present(alet, animated: true)
    }
    
}
