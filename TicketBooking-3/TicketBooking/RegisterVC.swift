

import UIKit

class RegisterVC: UIViewController {
    
    @IBOutlet weak var Username: UITextField!
    @IBOutlet weak var Password: UITextField!
    @IBOutlet weak var ErrorLabel: UILabel!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "success",
           let destination = segue.destination as? SuccessVC{
                destination.text = "Sign in successful"
            }
        
    }
    
    @IBAction func signButtonClick(_ sender: UIButton) {
        
            if Username.text == nil || Username.text == ""{
                ErrorLabel.text = "Please enter Username"
                return
            }
            
            if Password.text == nil || Password.text == ""{
                ErrorLabel.text = "Please enter Password"
                return
            }
      
        UserDefaults.standard.setValue(Username.text!, forKey: "USERNAME")
        
        
        let array:Set = UIApplication.shared.connectedScenes
        let windowScene:UIWindowScene = array.first as! UIWindowScene
        
    let mainWindow:UIWindow = windowScene.value(forKeyPath:"delegate.window") as! UIWindow

        let vc = UIStoryboard(name: "Home", bundle: nil).instantiateViewController(withIdentifier: "TabBarController")
        mainWindow.rootViewController = vc
        
        
        
    }
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        
        if identifier == "success" {
            if Username.text == nil || Username.text == ""{
                ErrorLabel.text = "Please enter Username"
                return false;
            }
            
            if Password.text == nil || Password.text == ""{
                ErrorLabel.text = "Please enter Password"
                return false;
            }
            
            ErrorLabel.text = nil
        }
        return true
    }

    

    @IBAction func ClickLoginButton(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }

}
