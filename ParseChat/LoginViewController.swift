//
//  LoginViewController.swift
//  ParseChat
//
//  Created by Allison Reiss on 12/13/17.
//  Copyright © 2017 Allison Reiss. All rights reserved.
//

import UIKit
import Parse

class LoginViewController: UIViewController {

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func onSignUp(_ sender: Any) {
        // initialize a user object
        let newUser = PFUser()
        
        // set user properties
        newUser.username = usernameTextField.text
        newUser.password = passwordTextField.text
            
        // call sign up function on the object
        newUser.signUpInBackground { (success: Bool, error: Error?) in
            if let error = error {
                let errorString = error.localizedDescription as NSString
                if self.usernameTextField.text!.isEmpty {
                    let alertController = UIAlertController(title: "Username Required", message: "Please enter a username", preferredStyle: .alert)
                    // create an OK action
                    let OKAction = UIAlertAction(title: "OK", style: .default) { (action) in
                        // handle response here.
                    }
                    // add the OK action to the alert controller
                    alertController.addAction(OKAction)
                    
                    self.present(alertController, animated: true) {
                        // optional code for what happens after the alert controller has finished presenting
                    }
                } else if self.passwordTextField.text!.isEmpty {
                    let alertController = UIAlertController(title: "Password Required", message: "Please enter a password", preferredStyle: .alert)
                    // create an OK action
                    let OKAction = UIAlertAction(title: "OK", style: .default) { (action) in
                        // handle response here.
                    }
                    // add the OK action to the alert controller
                    alertController.addAction(OKAction)
                    
                    self.present(alertController, animated: true) {
                        // optional code for what happens after the alert controller has finished presenting
                    }
                } else {
                    print("User sign up failed: \(error.localizedDescription)")
                    let alertController = UIAlertController(title: "Error", message: errorString as String!, preferredStyle: .alert)
                    // create an OK action
                    let OKAction = UIAlertAction(title: "OK", style: .default) { (action) in
                        // handle response here.
                    }
                    // add the OK action to the alert controller
                    alertController.addAction(OKAction)
                    
                    self.present(alertController, animated: true) {
                        // optional code for what happens after the alert controller has finished presenting
                    }
                }
            } else {
                print("User Registered successfully")
                // manually segue to logged in view
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
            }
        }
    }
    
    @IBAction func onLogin(_ sender: Any) {
        let username = usernameTextField.text ?? ""
        let password = passwordTextField.text ?? ""
        
        PFUser.logInWithUsername(inBackground: username, password: password) { (user: PFUser?, error: Error?) in
            if let error = error {
                let errorString = error.localizedDescription as NSString
                
                if self.usernameTextField.text!.isEmpty {
                    let alertController = UIAlertController(title: "Username Required", message: "Please enter a username", preferredStyle: .alert)
                    // create an OK action
                    let OKAction = UIAlertAction(title: "OK", style: .default) { (action) in
                        // handle response here.
                    }
                    // add the OK action to the alert controller
                    alertController.addAction(OKAction)
                    
                    self.present(alertController, animated: true) {
                        // optional code for what happens after the alert controller has finished presenting
                    }
                } else if self.passwordTextField.text!.isEmpty {
                    let alertController = UIAlertController(title: "Password Required", message: "Please enter a password", preferredStyle: .alert)
                    // create an OK action
                    let OKAction = UIAlertAction(title: "OK", style: .default) { (action) in
                        // handle response here.
                    }
                    // add the OK action to the alert controller
                    alertController.addAction(OKAction)
                    
                    self.present(alertController, animated: true) {
                        // optional code for what happens after the alert controller has finished presenting
                    }
                } else {
                    print("User log in failed: \(error.localizedDescription)")
                    let alertController = UIAlertController(title: "Error", message: errorString as String!, preferredStyle: .alert)
                    // create an OK action
                    let OKAction = UIAlertAction(title: "OK", style: .default) { (action) in
                        // handle response here.
                    }
                    // add the OK action to the alert controller
                    alertController.addAction(OKAction)
                    
                    self.present(alertController, animated: true) {
                        // optional code for what happens after the alert controller has finished presenting
                    }
                }
            } else {
                print("User logged in successfully")
                
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
