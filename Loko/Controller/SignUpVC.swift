//
//  SignUpVC.swift
//  Loko
//
//  Created by Ludo on 04/11/2017.
//  Copyright © 2017 Ludo. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class SignUpVC: UIViewController {
    
    @IBOutlet weak var usernameTxtField: customTextField!
    @IBOutlet weak var emailTxtField: customTextField!
    @IBOutlet weak var passwordTxtField: customTextField!
    @IBOutlet weak var confirmPasswordTxtField: customTextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func signUpBtnPressed(_ sender: Any) {
        
        if emailTxtField.text == "" || passwordTxtField.text == "" {
            let alertController = UIAlertController(title: "Error", message: "Please enter your email and password", preferredStyle: .alert)
            
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            
            present(alertController, animated: true, completion: nil)
        } else {
            Auth.auth().createUser(withEmail: emailTxtField.text!, password: passwordTxtField.text!, completion: { (user, error) in
                
                if error != nil {
                    print(error.debugDescription)
                } else {
                    print("User has been created")
                }
                
            })
        }
        
        
    }
    
    @IBAction func fbBtnPressed(_ sender: Any) {
    }
    
    @IBAction func twitterBtnPressed(_ sender: Any) {
    }
    
    @IBAction func loginBtnPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func backBtnPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    
    
    func setupViews() {
        usernameTxtField.attributedPlaceholder = NSAttributedString(string: "Username", attributes: [NSAttributedStringKey.foregroundColor: UIColor.white])
        
        emailTxtField.attributedPlaceholder = NSAttributedString(string: "Email Address", attributes: [NSAttributedStringKey.foregroundColor: UIColor.white])
        
        passwordTxtField.attributedPlaceholder = NSAttributedString(string: "Password", attributes: [NSAttributedStringKey.foregroundColor: UIColor.white])
        
        confirmPasswordTxtField.attributedPlaceholder = NSAttributedString(string: "Confirm Password", attributes: [NSAttributedStringKey.foregroundColor: UIColor.white])
    }

}
