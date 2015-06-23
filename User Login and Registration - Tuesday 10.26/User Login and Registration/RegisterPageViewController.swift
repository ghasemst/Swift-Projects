//
//  RegisterPageViewController.swift
//  User Login and Registration
//
//  Created by Ghasem Tabatabaei on 22/06/15.
//  Copyright © 2015 Ghasem Tabatabaei. All rights reserved.
//

import UIKit

class RegisterPageViewController: UIViewController {

    @IBOutlet weak var userEmailTextField: UITextField!
    
    @IBOutlet weak var userPasswordTextField: UITextField!
    
    @IBOutlet weak var repeatPasswordTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func registerButtonTapped(sender: AnyObject) {
        let userEmail = userEmailTextField.text
        let userPassword = userPasswordTextField.text
        let userRepeatPassword = repeatPasswordTextField.text
        
        if(userEmail == "" || userPassword == "" || userRepeatPassword == ""){
            displayMyAlertMessage("All fields are required")
            print("Fail to login not all fields where fill")
            return
        } else if(userPassword != userRepeatPassword){
            displayMyAlertMessage("Passwords do not match.")
            print("Fail to login password does not match")
        } else {
            
            // OPTION A : Registration was successful
            var uiAlert = UIAlertController(title: "Alert", message: "Registration was successful", preferredStyle: UIAlertControllerStyle.Alert)
            self.presentViewController(uiAlert, animated: true, completion: nil)
            uiAlert.addAction(UIAlertAction(title: "Ok", style: .Default, handler: { action in
                self.dismissViewControllerAnimated(true, completion:nil)
            }))
            
            /*
            // OPTION B : Registration was successful
            var uiAlert = UIAlertController(title: "Alert", message: "Registration was successful", preferredStyle: UIAlertControllerStyle.Alert)
            let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default) { action in
                self.dismissViewControllerAnimated(true, completion:nil)
            }
            uiAlert.addAction(okAction)
            self.presentViewController(uiAlert, animated: true, completion: nil)*/
        }
        
        // Store data
        NSUserDefaults.standardUserDefaults().setObject(userEmail, forKey: "userEmail")
        NSUserDefaults.standardUserDefaults().setObject(userPassword, forKey: "userPassword")
        NSUserDefaults.standardUserDefaults().synchronize()
        
    }
    
    
    func displayMyAlertMessage(userMessage: String) {
        var myAlert = UIAlertController(title: "Alert", message: userMessage, preferredStyle: UIAlertControllerStyle.Alert)
        
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil)
        myAlert.addAction(okAction)
        self.presentViewController(myAlert, animated: true, completion: nil)
    }

}
