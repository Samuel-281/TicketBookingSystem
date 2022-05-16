//
//  PersonalViewController.swift
//  TicketBooking
//
//  Created by Yang on 2022/5/15.
//

import UIKit

class PersonalViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return section == 0 ? 1: 1
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        if indexPath.section == 0{
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "PersonalHeaderTableViewCell", for: indexPath) as! PersonalHeaderTableViewCell
            
            return cell
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "PersonalTiketsCell", for: indexPath) as! PersonalTiketsCell
       
        
        return cell
    }
    
    @IBAction func logOutButtonClick(_ sender: UIButton) {
        
        let alet = UIAlertController(title: "Are You Sure to Log Out？", message: nil, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "YES", style: .default) { action in
            
            
            let array:Set = UIApplication.shared.connectedScenes
            let windowScene:UIWindowScene = array.first as! UIWindowScene
            
        let mainWindow:UIWindow = windowScene.value(forKeyPath:"delegate.window") as! UIWindow

            let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LoginVC")
            mainWindow.rootViewController = vc
            
        }
        let cancelAction = UIAlertAction(title: "CANCEL", style: .cancel)
        
        alet.addAction(okAction)
        alet.addAction(cancelAction)
        present(alet, animated: true)
    }
    

}
