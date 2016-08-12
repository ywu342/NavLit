//
//  GuideTableViewController.swift
//  Navlit
//
//  Created by Viraj Shah on 5/28/16.
//  Copyright © 2016 Viraj Shah. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import ObjectMapper
import AlamofireObjectMapper
import AlamofireImage

class GuideTableViewController: UITableViewController {
    var objects = [Results]()
    
    override func viewDidLoad() {
        parseJSON()
        super.viewDidLoad()
        
        //appearance and layout customization
        self.tableView.backgroundView = UIImageView(image: UIImage(named: "background"))
        self.tableView.estimatedRowHeight = 202
        self.tableView.rowHeight =  UITableViewAutomaticDimension
        
    }
    override func viewDidAppear(animated: Bool) {
        tableView.reloadData()
    }
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objects.count
    }

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
     return 1
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! GuideCell
        
        
        let object = objects[indexPath.row]
        cell.guideName.text = object.Name
        cell.guideBio.text = object.Bio
//        if (object.Gender == 0){
//            cell.guideGender.text = "Male"
//        }
        let interestCount = object.CommonInterests.count
        let interestString = String(interestCount)
        cell.guideInterests.text = interestString
        
        
        
        
        //cell.textLabel?.text = object.Name
        
        return cell
    }
    
    func parseJSON() {
        let bearer = "Bearer "
        let accesstoken = NSUserDefaults.standardUserDefaults().objectForKey("accesstoken") as? String
        let authtoken = bearer + accesstoken!
        let url = "https://navlittest.azurewebsites.net/api/guidesearch/search?startDate=06/06/2016&endDate=06/06/2016&location=Atlanta,%20GA,%20United%20States"
        
        Alamofire.request(.GET, url, headers: ["Authorization": authtoken]).responseObject{ ( response: Response<Guide, NSError>) in
            
            //let jsonresult = response.result.value
            //let json = JSON(response.result.value!)
            let guideResponse = response.result.value
            
            print((guideResponse?.searchId)! as String)
            
            if let results = guideResponse?.results{
                for result in results{
                    print((result.Name)! as String)
                    self.objects.append(result)
                }
            }
            self.tableView.reloadData()
        }
    }
}