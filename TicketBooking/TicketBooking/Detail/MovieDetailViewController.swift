

import UIKit

class MovieDetailViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    
    var detailModel:MovieDataModel!
    
    var allData = [TicketsModel]()
    var datasource = [TicketsModel]()
    var dateArray = ["Today","Tomorrow","5-28","5-29"]
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Film detail"
      
        allData  =  loadJson("TicketsData.json")
        datasource = allData.filter{$0.saleDate == "Today"}
        
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return section == 0 ?  1 : datasource.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0{
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "MovieHeaderTableViewCell", for: indexPath) as!  MovieHeaderTableViewCell
            
            cell.segementButtonClick = { [self] (index) in
                
                self.datasource = self.allData.filter{$0.saleDate == self.dateArray[index]}
                
                self.tableView.reloadData()
            }
            cell.showModelWith(detailModel)
            
            return cell
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: "SaleMovieListCell", for: indexPath) as! SaleMovieListCell
        
        cell.showModel(model: datasource[indexPath.row])
        cell.buyButton.tag = indexPath.row
        cell.buyButton.addTarget( self, action: #selector(buyButtonClick(button:)), for: .touchUpInside)
        return cell
    }
    
    @objc func buyButtonClick(button:UIButton){
        
        let vc = UIStoryboard(name: "Home", bundle: nil).instantiateViewController(withIdentifier: "SeatViewController") as! SeatViewController
        vc.ticket = datasource[button.tag]
        self.navigationController?.pushViewController(vc, animated: true)
    }

   

}
