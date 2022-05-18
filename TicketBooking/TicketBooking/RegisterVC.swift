//
//  RegisterVC.swift
//  TicketBooking
//
//  Created by Samuel Tan on 2022/5/9.
//

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
    
    @IBAction func SignInButtonTapped(_ sender: AnyObject) {
        let userName = Username.text;
        let userPassword = Password.text;
        
        //store data
        UserDefaults.standard.set(userName,forKey:"userName");
        
        UserDefaults.standard.set(userPassword,forKey:"userPassword");
        
        UserDefaults.standard.synchronize();
        
        
        
        
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
