
import UIKit

class SeatViewController: UIViewController {
    
    var ticket:TicketsModel!
    var seatArray:[Int] = [Int]()
    var dataSource = [TicketsModel]()
    
    @IBOutlet weak var totalLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Select seat"
        
        ///获取已经选择过的座位
        let locationData =  NSKeyedUnarchiver.unarchiveObject(withFile: ticketsPath) as? [TicketsModel]
        if locationData != nil{
            
            var locationSeatArray = [String]()
            for (index,item) in locationData!.enumerated(){
                
                let strinArray = (item.seatNumbers ?? "" ).components(separatedBy: ",")
                locationSeatArray += strinArray
            }
            
            for i in 1...78{
                
                let button = self.view.viewWithTag(i) as! UIButton
                
                for seatNum in locationSeatArray{
                    
                    if "\(i)" == seatNum{
                        
                        button.setImage(UIImage(named: "sold") , for: .normal)
                        button.isEnabled = false
                    }
                }
            }
        }
        
    }
    
    
    @IBAction func buyNowButtonClick(_ sender: UIButton) {
        
        if seatArray.count > 0{
            
            showAlertWith(msg:"You choose\(seatArray),order processing，please go to pay it")
        }else{
            
            showAlertWith(msg: "Select at least one seat please!")
        }
    }
    
    @IBAction func seatButtonClick(_ sender: UIButton) {
        
        sender.isSelected = !sender.isSelected
        if (sender.isSelected == true){
            
            sender.setImage(UIImage(named: "selected"), for: .normal)
            if (!seatArray.contains(sender.tag)){
                
                seatArray.append(sender.tag)
            }
            
            totalLabel.text = "Total fee \(Int(ticket.discontPrice)!  * seatArray.count)"
            
        }else{
            sender.setImage(UIImage(named: "choosable"), for: .normal)
            
            if (seatArray.contains(sender.tag)){
                
                for (index , item) in seatArray.enumerated(){
                    
                    if (item == sender.tag){
                        seatArray.remove(at: index)
                        
                        totalLabel.text = "Total fee\(Int(ticket.discontPrice)!  * seatArray.count)"
                        return
                    }
                }
            }
        }
        print(seatArray)
    }
    
    func showAlertWith(msg:String){
        
        let alet = UIAlertController(title: msg, message: nil, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "YES", style: .default) { action in
            
            if self.seatArray.count > 0{
                
                ///获取本地数据
                var locationData =  NSKeyedUnarchiver.unarchiveObject(withFile: ticketsPath) as? [TicketsModel]
                if locationData != nil{
                    
                    ///往已经存在的本地数组中新增数据
                    let dataStr = self.seatArray.map(String.init)
                    self.ticket.seatNumbers =  dataStr.joined(separator: ",")
                    self.ticket.totlePrice = "\(Int(self.ticket.discontPrice)!  * self.seatArray.count)"
                    locationData!.append(self.ticket)
                    
                    NSKeyedArchiver.archiveRootObject(locationData!, toFile: ticketsPath)
                }else{
                    ///第一次加入
                    var array = [TicketsModel]()
                    let dataStr = self.seatArray.map(String.init)
                    self.ticket.seatNumbers =  dataStr.joined(separator: ",")
                    self.ticket.totlePrice = "\(Int(self.ticket.discontPrice)!  * self.seatArray.count)"
                    array.append(self.ticket)
                    NSKeyedArchiver.archiveRootObject(array, toFile: ticketsPath)
                }
                
                self.tabBarController?.selectedIndex = 1
                self.navigationController?.popToRootViewController(animated: true)
            }else{
                
                self.dismiss(animated: true)
            }
        }
        
        alet.addAction(okAction)
        present(alet, animated: true)
    }
    
}
