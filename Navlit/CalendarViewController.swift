//
//  CalendarViewController.swift
//  Navlit
//
//  Created by Viraj Shah on 5/22/16.
//  Copyright © 2016 Viraj Shah. All rights reserved.
//

import UIKit

class CalendarViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let orangecolor = UIColor(red: 243/255.0, green: 80/255.0, blue: 72/255.0, alpha: 1.0)
        navigationController!.navigationBar.barTintColor = UIColor.darkGrayColor()
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: orangecolor]
        navigationController?.navigationBar.tintColor = orangecolor
        tabBarController!.tabBar.barTintColor = UIColor.darkGrayColor()
        tabBarController?.tabBar.tintColor = orangecolor
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func guideButton(sender: AnyObject) {
        //self.dismissViewControllerAnimated(true, completion: nil)
        //self.performSegueWithIdentifier("showGuide", sender: nil)
    }
   
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
