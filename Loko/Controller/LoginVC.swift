//
//  ViewController.swift
//  Loko
//
//  Created by Ludo on 04/11/2017.
//  Copyright © 2017 Ludo. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import SwiftKeychainWrapper

class LoginVC: UIViewController {
    
    @IBOutlet weak var emailTxtField: customTextField!
    @IBOutlet weak var passwordTxtField: customTextField!
    
    let transitionManager = TransitionManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()

        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        /* if let _ = KeychainWrapper.standard.string(forKey: KEY_UID) {
            performSegue(withIdentifier: TO_BOOKMARKS_LIST_FROM_LOG_IN, sender: self)
        }*/
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func loginBtnTapped(_ sender: Any) {
        
        if emailTxtField.text == "" || passwordTxtField.text == "" {
            let alertController = UIAlertController(title: "Error", message: "Please enter your email and password", preferredStyle: .alert)
            
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            
            present(alertController, animated: true, completion: nil)
        } else {

            Auth.auth().signIn(withEmail: emailTxtField.text!, password: passwordTxtField.text!, completion: { (user, error) in
                
                if error != nil {
                    print(error.debugDescription)
                } else {
                    print("User has logged in!")
                    KeychainWrapper.standard.set(user!.uid, forKey: KEY_UID)
                    self.performSegue(withIdentifier: TO_BOOKMARKS_LIST_FROM_LOG_IN, sender: self)
                }
                
            })
            
        }
        
    }
    
    @IBAction func signUpBtnTapped(_ sender: Any) {
        
        performSegue(withIdentifier: TO_SIGN_UP, sender: self)
    }
    
    @IBAction func fbBtnTapped(_ sender: Any) {
    }
    
    @IBAction func twitterBtnTapped(_ sender: Any) {
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // this gets a reference to the screen that we're about to transition to
        let toViewController = segue.destination as UIViewController
        
        // instead of using the default transition animation, we'll ask
        // the segue to use our custom TransitionManager object to manage the transition animation
        toViewController.transitioningDelegate = self.transitionManager
        
    }
    
    func setupViews(){
        emailTxtField.attributedPlaceholder = NSAttributedString(string: "Email Address", attributes: [NSAttributedStringKey.foregroundColor: UIColor.white])
        
        passwordTxtField.attributedPlaceholder = NSAttributedString(string: "Password", attributes: [NSAttributedStringKey.foregroundColor: UIColor.white])
    }


}

