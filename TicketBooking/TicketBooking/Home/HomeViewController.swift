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
    @IBOutlet weak var comingSoonButton: UIButton!
    @IBOutlet weak var nowShowingButton: UIButton!
      
    var nowShowArray = [(name:"Doctor Strange in the Multiverse of Madness",img:1),
                        (name:"Operation Mincemeat",img:2),
                        (name:"Downtown Abbey: A New Era",img:3),
                        (name:"The Lost City",img:4),
                        (name:"Father Stu",img:5),
                        (name:"Sonic the Hedgehog 2",img:6),
    ]
    
    var comingSoonArray = [(name:"Top Gun: Maverick",startTime:"2022-05-26",img:7),
                           (name:"The Bob’s Burgers Movie",startTime:"2022-05-26",img:8),
                           (name:"Hatching",startTime:"2022-05-26",img:9),
                           (name:"Detective Conan: The bride of Halloween",startTime:"2022-06-02",img:10),
                           (name:"Man of God",startTime:"2022-06-02",img:11),
                           (name:"Mothering Sunday",startTime:"2022-06-02",img:12),
    ]
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

       buttonArray = [nowShowingButton,comingSoonButton]
    }
    
    
    @IBAction func titleButtonClick(_ sender: UIButton) {
        
        currentSelectIndex = sender.tag
        
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
        
        return currentSelectIndex == 0 ? nowShowArray.count : comingSoonArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        if currentSelectIndex == 0{
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "NowShowTableViewCell", for: indexPath) as! NowShowTableViewCell
            
            cell.nameLabel.text = nowShowArray[indexPath.row].name
            cell.headImageView.image = UIImage(named: "\(nowShowArray[indexPath.row].img)")
            
            return cell
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CommingSoonTableViewCell", for: indexPath) as! CommingSoonTableViewCell
        cell.nameLabel.text = comingSoonArray[indexPath.row].name
        cell.headImageView.image = UIImage(named: "\(comingSoonArray[indexPath.row].img)")
        
        return cell
    }
    

}
