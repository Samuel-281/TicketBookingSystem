

import UIKit

class SuccessVC: UIViewController {
    
    var text: String = ""
    
    @IBOutlet weak var textLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textLabel.text = text
    }
    
    @IBAction func ClickExit(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    


}
