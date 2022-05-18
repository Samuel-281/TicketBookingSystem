//
//  HomeViewController.swift
//  TicketBooking
//
//  Created by Yang on 2022/5/15.
//

import UIKit

class HomeViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    var currentSelectIndex = 0
    var buttonArray = [UIButton]()
    
    var allData = [MovieDataModel]()
    var datasource = [MovieDataModel]()
    @IBOutlet weak var comingSoonButton: UIButton!
    @IBOutlet weak var nowShowingButton: UIButton!
     
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    override func viewWillDisappear(_ animated: Bool) {
        
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        //本地json数据可以修改
        allData  =  loadJson("MovieData.json")
        datasource = allData.filter{$0.movieType == "0"}
        
       buttonArray = [nowShowingButton,comingSoonButton]
    }
    
    
    @IBAction func titleButtonClick(_ sender: UIButton) {
        
        currentSelectIndex = sender.tag
        
        datasource = allData.filter{$0.movieType == "\(sender.tag)"}
        
        buttonArray.forEach { buttton in
            
            if buttton == sender{
               
                buttton.setTitleColor(.darkText, for: .normal)
            }else{
                buttton.setTitleColor(.lightGray, for: .normal)
            }
        }
        
        tableView.reloadData()
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return datasource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        if currentSelectIndex == 0{
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "NowShowTableViewCell", for: indexPath) as! NowShowTableViewCell
            
            let model = datasource[indexPath.row]
            cell.nameLabel.text = model.name
            cell.headImageView.image = UIImage(named: "\(model.img)")
            
            return cell
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CommingSoonTableViewCell", for: indexPath) as! CommingSoonTableViewCell
        let model = datasource[indexPath.row]
        cell.nameLabel.text = model.name
        cell.headImageView.image = UIImage(named: "\(model.img)")
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let vc = UIStoryboard(name: "Home", bundle: nil).instantiateViewController(withIdentifier: "MovieDetailViewController") as! MovieDetailViewController
        
        vc.detailModel = self.datasource[indexPath.row]
        vc.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(vc, animated: true)
    }
    

}
