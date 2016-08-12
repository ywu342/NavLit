//
//  UserProfileViewController.swift
//  Navlit
//
//  Created by Viraj Shah on 5/23/16.
//  Copyright © 2016 Viraj Shah. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class UserProfileViewController: UIViewController {
    @IBOutlet weak var label: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = NSUserDefaults.standardUserDefaults().objectForKey("username") as? String
        // Do any additional setup after loading the view.
        let bearer = "Bearer "
        let accesstoken = NSUserDefaults.standardUserDefaults().objectForKey("accesstoken") as? String
        let authtoken = bearer + accesstoken!
        
        Alamofire.request(.GET, "https://navlittest.azurewebsites.net/api/guidesearch/search?startDate=06/06/2016&endDate=06/06/2016&location=Atlanta,%20GA,%20United%20States", headers: ["Authorization": authtoken]).responseJSON { response in
            
            //let jsonresult = response.result.value
            //let json = JSON(response.result.value!)
            //print(jsonresult)
            //let name = json["Results"][0]["Name"].string!
//            for result in json["Results"].arrayValue {
//                let name  = result["Name"].string!
//                let userid = result["UserId"].string!
//                let profilepicture = result["ProfilePicture"].string!
//                let bio = result["Bio"].string!
//                let gender = result["Gender"].int!
//
//                print(name)
//                print(userid)
//                print(profilepicture)
//                print(bio)
//                print(gender)
//            }

            //print(name)
        }
        
    }

    @IBAction func logoutButtonTapped(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}
