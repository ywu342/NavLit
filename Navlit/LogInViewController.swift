//
//  ViewController.swift
//  Navlit
//
//  Created by Viraj Shah on 5/22/16.
//  Copyright © 2016 Viraj Shah. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class LogInViewController: UIViewController {

    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(LogInViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func logInButton(sender: AnyObject) {
        let userEmail = emailTextField.text;
        let userPassword = passwordTextField.text;
        
        if ( userEmail!.isEmpty || userPassword!.isEmpty){
            //Display an alert message
            displayMyAlertMessage("All fields are required");
            return;
        }
        //Login via backend
        Alamofire.request(.POST, "https://navlittest.azurewebsites.net/api/auth/login", parameters: ["username": userEmail!,"password":userPassword!, "grant_type": "password"]).validate().responseJSON { response in
            switch response.result{
            case .Success:
                let json = JSON(response.result.value!)
                //print(json);
                let authtoken = json["access_token"].string!
                let username  = json["userName"].string!
                //print(username)
                NSUserDefaults.standardUserDefaults().setValue(authtoken, forKey: "accesstoken")
                NSUserDefaults.standardUserDefaults().setValue(username, forKey: "username")
                NSUserDefaults.standardUserDefaults().synchronize()
                self.performSegueWithIdentifier("dismissLogin", sender: nil)
            case .Failure:
                self.displayMyAlertMessage("Login Failed");
            }
        }
        
        
        
    }
    func displayMyAlertMessage(userMessage:String){
        
        let myAlert = UIAlertController(title: "Alert", message: userMessage, preferredStyle: UIAlertControllerStyle.Alert)
        
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil)
        
        myAlert.addAction(okAction)
        
        self.presentViewController(myAlert, animated: true, completion: nil)
    }
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
}

