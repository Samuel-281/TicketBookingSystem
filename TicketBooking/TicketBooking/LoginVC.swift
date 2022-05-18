//
//  LoginVC.swift
//  TicketBooking
//
//  Created by Samuel Tan on 2022/5/9.
//

import UIKit

class LoginVC: UIViewController {
    
    @IBOutlet weak var Username: UITextField!
    @IBOutlet weak var Password: UITextField!
    @IBOutlet weak var ErrorLabel: UILabel!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "success",
           let destination = segue.destination as? SuccessVC{
                destination.text = "Login successful"
            }
        
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        
        let userName = Username.text;
        let password = Password.text;
        
        let userNameStored = UserDefaults.standard.string(forKey: "userName");
        let userPasswordStored = UserDefaults.standard.string(forKey: "userPassword");
        
        if identifier == "success" {
            if Username.text == nil || Username.text == ""{
                ErrorLabel.text = "Please enter Username"
                return false;
            }
            
            if Password.text == nil || Password.text == ""{
                ErrorLabel.text = "Please enter Password"
                return false;
            }
            
            if userNameStored != userName || userPasswordStored != password{
                ErrorLabel.text = "Incorrect"
                return false;
            }
            
            if(userNameStored == userName){
                if(userPasswordStored == password){
                    //login successfull
                    return true;
                }
            }
            ErrorLabel.text = nil
            return false
        }
        return true
    }
    
    @IBAction func loginButtonTapped(_ sender: AnyObject) {
        
        let userName = Username.text;
        let password = Password.text;
        
        let userNameStored = UserDefaults.standard.string(forKey: "userName");
        let userPasswordStored = UserDefaults.standard.string(forKey: "userPassword");
        
        if(userNameStored == userName){
            if(userPasswordStored == password){
                //login successfull
                
                
            }
        }
        
    }
    

}

