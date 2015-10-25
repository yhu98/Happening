//
//  ViewController.swift
//  Happening
//
//  Created by Douglas Hewitt on 10/24/15.
//  Copyright © 2015 TeamAwesomeHackingEDU. All rights reserved.
//

import UIKit
import Parse
import ParseUI

class ViewController: UIViewController, PFLogInViewControllerDelegate  {


    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var interestsTableView: UITableView!
    @IBOutlet weak var ideaStatus: UISwitch!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var activeStatus: UISwitch!
    @IBOutlet weak var doneButton: UIButton!
    
    var objects = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view, typically from a nib.
        objects.append("iOS")
        objects.append("Android")
        objects.append("Web Development")
        objects.append("Hardware")
        objects.append("Gaming")
        

        
    }
    
    override func viewDidAppear(animated: Bool) {
        if (PFUser.currentUser() == nil) {
            let logInController = PFLogInViewController()
            logInController.delegate = self
            self.presentViewController(logInController, animated:true, completion: nil)
        }
        

    }
    
    func logInViewController(controller: PFLogInViewController, didLogInUser user: PFUser) -> Void {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func logInViewControllerDidCancelLogIn(controller: PFLogInViewController) -> Void {
        self.dismissViewControllerAnimated(true, completion: nil)
    }


    func datamodel() {
        let user = PFUser()
        user.setObject(false, forKey: "activeStatus")
        user.setObject(false, forKey: "hasIdea")
        //user.setObject(<#T##object: AnyObject##AnyObject#>, forKey: <#T##String#>)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int
    {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return self.objects.count
    }

    func tableView( tableView : UITableView,  titleForHeaderInSection section: Int)->String
    {
        switch(section)
        {
        case 0:return "Interests"
            break
        default :return ""
            break
        }
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let aCell = self.interestsTableView.dequeueReusableCellWithIdentifier("interestsCell", forIndexPath: indexPath) as! TableViewCell
        
        aCell.interestsLabel.text = self.objects[indexPath.row]
        
        let redimage : UIImage = UIImage(named:"Interest_Red.png")!
        let aquaimage : UIImage = UIImage(named:"Interest_Aqua.png")!
        let greenimage : UIImage = UIImage(named:"Interest_Green.png")!        
        let orangeimage : UIImage = UIImage(named:"Interest_Orange.png")!
        let purpleimage : UIImage = UIImage(named:"Interest_purple.png")!
        
        print("row: \(indexPath.row) ")
        print("The loaded image: \(redimage)")
        
        switch(indexPath.row) {
            case 0:
                
                aCell.iconView.image = redimage
                break
            case 1:
                aCell.iconView.image = aquaimage
                break
            case 2:
                aCell.iconView.image = greenimage
                break
            case 3:
                aCell.iconView.image = orangeimage
                break
            case 4:
                aCell.iconView.image = purpleimage
                break
        default: aCell.iconView.image = redimage
                break
            
        }
        
        return aCell
    }


}

