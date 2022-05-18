

import UIKit

class PersonalViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    
    var datasource = [TicketsModel]()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let locationData =  NSKeyedUnarchiver.unarchiveObject(withFile: ticketsPath) as? [TicketsModel]
        datasource = locationData ?? []
        self.tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

      
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return section == 0 ? 1: datasource.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        if indexPath.section == 0{
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "PersonalHeaderTableViewCell", for: indexPath) as! PersonalHeaderTableViewCell
            
            return cell
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "PersonalTiketsCell", for: indexPath) as! PersonalTiketsCell
        
        let model = datasource[indexPath.row]
        
        cell.playTimeLabel.text = "\(model.saleDate) \(model.startTime)"
        cell.seatNumberLable.text = model.seatNumbers
        cell.priceLable.text = "$\(model.totlePrice ?? "0")" 
        
        return cell
    }
    
    @IBAction func logOutButtonClick(_ sender: UIButton) {
        
        let alet = UIAlertController(title: "Are You Sure to Log Out？", message: nil, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "YES", style: .default) { action in
            
            
            let array:Set = UIApplication.shared.connectedScenes
            let windowScene:UIWindowScene = array.first as! UIWindowScene
            
        let mainWindow:UIWindow = windowScene.value(forKeyPath:"delegate.window") as! UIWindow

            let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LoginVCNVC")
            mainWindow.rootViewController = vc
            
        }
        let cancelAction = UIAlertAction(title: "CANCEL", style: .cancel)
        
        alet.addAction(okAction)
        alet.addAction(cancelAction)
        present(alet, animated: true)
    }
    

}
