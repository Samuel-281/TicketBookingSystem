

import UIKit

class LoginVC: UIViewController {
    
    @IBOutlet weak var Username: UITextField!
    @IBOutlet weak var Password: UITextField!
    @IBOutlet weak var ErrorLabel: UILabel!
    
  
    @IBAction func logInButtonClick(_ sender: UIButton) {
        
        if Username.text == nil || Username.text == ""{
            ErrorLabel.text = "Please Enter Username"
            return
        }

        if Password.text == nil || Password.text == ""{
            ErrorLabel.text = "Please Enter Password"
            return
        }

        UserDefaults.standard.setValue(Username.text!, forKey: "USERNAME")
        
        let array:Set = UIApplication.shared.connectedScenes
        let windowScene:UIWindowScene = array.first as! UIWindowScene
        
    let mainWindow:UIWindow = windowScene.value(forKeyPath:"delegate.window") as! UIWindow

        let vc = UIStoryboard(name: "Home", bundle: nil).instantiateViewController(withIdentifier: "TabBarController")
        mainWindow.rootViewController = vc

    }


}

