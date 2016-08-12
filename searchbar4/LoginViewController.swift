//
//  loginViewController.swift
//  prooj
//
//  Created by GEGWC22 on 8/8/16.
//  Copyright © 2016 Hayoun. All rights reserved.
//

import UIKit


class LoginViewController: UIViewController {
    
    
    @IBOutlet var userEmailTextField: UITextField!
    @IBOutlet var userPasswordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

            
            //Looks for single or multiple taps.
            let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
            view.addGestureRecognizer(tap)
        }
        
        //Calls this function when the tap is recognized.
        func dismissKeyboard() {
            //Causes the view (or one of its embedded text fields) to resign the first responder status.
            view.endEditing(true)
        }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    @IBAction func loginButtonTapped(sender: AnyObject)
    {
        
        let userEmail = userEmailTextField.text;
        let userPassword = userPasswordTextField.text;
        
        let userEmailStored = NSUserDefaults.standardUserDefaults().stringForKey("userEmail");
        
        let userPasswordStored = NSUserDefaults.standardUserDefaults().stringForKey("userPassword");
        
        // Check for empty fields
        if(userEmail!.isEmpty || userPassword!.isEmpty)
        {
            displayMyAlertMessage("All fields are required");
            
            return;
        }
        if (userEmailStored != userEmail)
        {
            displayMyAlertMessage("username or password is incorrect")
            
            return;
        }
        if(userEmailStored == userEmail)
        {
            if (userPasswordStored != userPassword)
            {
                displayMyAlertMessage("username or password is incorrect")
                
                return;
            }
            
            if(userPasswordStored == userPassword)
            {
                // Login is successfull
                NSUserDefaults.standardUserDefaults().setBool(true,forKey:"isUserLoggedIn");
                NSUserDefaults.standardUserDefaults().synchronize();
                
                self.dismissViewControllerAnimated(true, completion:nil);
//                self.performSegueWithIdentifier("toHome", sender: self);
            }
        }
        
        
    }
    func displayMyAlertMessage(userMessage:String)
    {
        
        let myAlert = UIAlertController(title:"Alert", message: userMessage, preferredStyle: UIAlertControllerStyle.Alert)
        
        let okAction = UIAlertAction(title:"Ok", style: UIAlertActionStyle.Default, handler: nil);
        
        myAlert.addAction(okAction);
        
        self.presentViewController(myAlert, animated: true, completion: nil);
        
    }
}