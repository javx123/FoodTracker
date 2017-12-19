
//
//  AuthenticationViewController.swift
//  FoodTracker
//
//  Created by Javier Xing on 2017-12-04.
//  Copyright © 2017 Javier Xing. All rights reserved.
//

import UIKit

protocol FoodTrackerProtocol {
    func populateTableView()
}

class AuthenticationViewController: UIViewController, UITextFieldDelegate {
    enum Authentication {
        case signup
        case login
        func labelText() -> String {
            switch self {
            case .login:
                return "Login"
            case .signup:
                return "Sign Up"
            }
        }
        
    }
    
    
    //Mark: Properties
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var button: UIButton!
    
    var userName: String?
    var password: String?
    var authentication: Authentication?
    var delegate:FoodTrackerProtocol?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.titleLabel.text = self.authentication?.labelText()
        self.button.titleLabel?.text = self.authentication?.labelText()
        // Do any additional setup after loading the view.
        self.button.setTitle(self.authentication?.labelText(), for: .normal)
        passwordTextField.isSecureTextEntry = true
    }


    @IBAction func signUp(_ sender: Any) {
        switch self.authentication! {
        case .signup :
            CloudTrackAPI.signupCall(username: self.usernameTextField.text!, password: self.passwordTextField.text!)
            delegate?.populateTableView()
            self.dismiss(animated: true, completion: nil)
        case .login:
            let userDefault = UserDefaults.standard
            if (passwordTextField.text == userDefault.object(forKey: "password") as? String)
            && (usernameTextField.text == userDefault.object(forKey: "username") as? String)
            {
                delegate?.populateTableView()
                self.dismiss(animated: true, completion: nil)
            }
            else{
                print("Incorrect username or password")
                return
            }
        }
        
    }
    
    
    
//     func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        let numChar: Int = passwordTextField.text!.count
//        if numChar < 2 {
//            return false
//        }
//        else{
//            return true
//        }
//
//    }
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
