//
//  LoginViewController.swift
//  User Login and Registration
//
//  Created by Ghasem Tabatabaei on 22/06/15.
//  Copyright © 2015 Ghasem Tabatabaei. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var userEmailTextField: UITextField!
    @IBOutlet weak var userPasswordTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func loginButtonTapped(sender: AnyObject) {
        let userEmail = userEmailTextField.text
        let userPassword = userPasswordTextField.text
        
        // Check User & password of users that already stored
        let userEmailStored = NSUserDefaults.standardUserDefaults().stringForKey("userEmail")
        let userPasswordStored = NSUserDefaults.standardUserDefaults().stringForKey("userPassword")
        
        if(userEmail == "" || userPassword == ""){
            displayMyAlertMessage("All fields are required")
            return
        } else if(userEmailStored == userEmail && userPasswordStored == userPassword) {
            NSUserDefaults.standardUserDefaults().setBool(true, forKey: "isUserLoggedIn")
            NSUserDefaults.standardUserDefaults().synchronize()
                
            self.dismissViewControllerAnimated(true, completion: nil)  // Hide the login page
        } else {
            var uiAlert = UIAlertController(title: "Alert", message: "Email or Password is not correct", preferredStyle: UIAlertControllerStyle.Alert)
            self.presentViewController(uiAlert, animated: true, completion: nil)
            uiAlert.addAction(UIAlertAction(title: "Ok", style: .Default, handler: { action in
                self.dismissViewControllerAnimated(true, completion:nil)
            }))
        }
    }
    
    
    func displayMyAlertMessage(userMessage: String) {
        var myAlert = UIAlertController(title: "Alert", message: userMessage, preferredStyle: UIAlertControllerStyle.Alert)
        
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil)
        myAlert.addAction(okAction)
        self.presentViewController(myAlert, animated: true, completion: nil)
    }
}