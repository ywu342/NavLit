//
//  RegisterViewController.swift
//  Navlit
//
//  Created by Viraj Shah on 5/22/16.
//  Copyright © 2016 Viraj Shah. All rights reserved.
//

import UIKit
import Alamofire

class RegisterViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailAddressTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(RegisterViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        // Do any additional setup after loading the view.
    }

    
    @IBAction func cancelButtonTapped(sender: AnyObject) {
        
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    @IBAction func signUpButtonTapped(sender: AnyObject) {
        
        let userFirstName = firstNameTextField.text;
        let userLastName = lastNameTextField.text;
        let userEmailAddress = emailAddressTextField.text;
        let userPassword = passwordTextField.text;
        let userConfirmPassword = confirmPasswordTextField.text;
        
        //Check for empty fields
        if(userFirstName!.isEmpty || userLastName!.isEmpty || userEmailAddress!.isEmpty || userPassword!.isEmpty || userConfirmPassword!.isEmpty)
        {
            //Display an alert message
            displayMyAlertMessage("All fields are required");
            return;
        }
        //Check if passwords match
        if(userPassword != userConfirmPassword){
            //Display an alert message
            displayMyAlertMessage("Passwords do not match");
            return;
        }
        //Store data
        
        Alamofire.request(.POST, "https://navlittest.azurewebsites.net/api/auth/register", parameters: ["confirmpassword": userConfirmPassword!,"email":userEmailAddress!, "firstname": userFirstName!, "lastname": userLastName!, "password": userPassword!]).validate()
            .responseJSON { response in
                print(response.request)  // original URL request
                print(response.response) // URL response
                print(response.data)     // server data
                print(response.result)   // result of response serialization
                
                if let JSON = response.result.value {
                    print("JSON: \(JSON)")
                }
        }
        
        //Display alert message with confirmation
        let myAlert = UIAlertController(title: "Success", message: "A confirmation email has been sent to your email. Please Log In!", preferredStyle: UIAlertControllerStyle.Alert)
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default){
            action in self.dismissViewControllerAnimated(true, completion: nil)
        }
        myAlert.addAction(okAction)
        self.presentViewController(myAlert, animated: true, completion: nil)
        
        
    }
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    func displayMyAlertMessage(userMessage:String){
        
        let myAlert = UIAlertController(title: "Alert", message: userMessage, preferredStyle: UIAlertControllerStyle.Alert)
        
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil)
        
        myAlert.addAction(okAction)
        
        self.presentViewController(myAlert, animated: true, completion: nil)
    }
    

}
