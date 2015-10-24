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

class ViewController: UIViewController, PFLogInViewControllerDelegate, PFSignUpViewControllerDelegate  {


    @IBOutlet weak var interestsTableView: UITableView!
    @IBOutlet weak var ideaStatus: UISwitch!
    @IBOutlet weak var activeStatus: UISwitch!
    @IBOutlet weak var profileImage: UIImageView!
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
    
    @IBAction func didToggleIdeaSwitch(sender: UISwitch) {
        if sender.on == true {
            PFUser.currentUser()?.setObject(true, forKey: "hasIdea")
        } else {
            PFUser.currentUser()?.setObject(false, forKey: "hasIdea")
        }
        PFUser.currentUser()?.saveEventually()
    }
    
    @IBAction func didPressLogout(sender: UIButton) {
        PFUser.logOut()
        let logInController = PFLogInViewController()
        logInController.delegate = self
        logInController.signUpController?.delegate = self
        self.presentViewController(logInController, animated:true, completion: nil)
    }
    
    @IBAction func didToggleStatusSwitch(sender: UISwitch) {
        if sender.on == true {
            PFUser.currentUser()?.setObject(true, forKey: "activeStatus")
            print("turn on")
        }
        else {
            PFUser.currentUser()?.setObject(false, forKey: "activeStatus")
        }
        PFUser.currentUser()?.saveEventually()
    }
    
    
    override func viewDidAppear(animated: Bool) {
        if (PFUser.currentUser() == nil) {
            let logInController = PFLogInViewController()
            logInController.delegate = self
            logInController.signUpController?.delegate = self
            self.presentViewController(logInController, animated:true, completion: nil)
        }
        
        var currentActiveStatus: Bool? = PFUser.currentUser()?.objectForKey("activeStatus") as? Bool
        if currentActiveStatus == nil {
            PFUser.currentUser()?.setObject(true, forKey: "activeStatus")
//            print("set nil to true")
            currentActiveStatus = true
            PFUser.currentUser()?.saveEventually()
        }
        activeStatus.setOn(currentActiveStatus!, animated: false)
        
        var currentIdeaStatus: Bool? = PFUser.currentUser()?.objectForKey("hasIdea") as? Bool
        if currentIdeaStatus == nil {
            PFUser.currentUser()?.setObject(true, forKey: "hasIdea")
            currentIdeaStatus = true
            PFUser.currentUser()?.saveEventually()
        }
        ideaStatus.setOn(currentIdeaStatus!, animated: false)

    }
    
    func logInViewController(controller: PFLogInViewController, didLogInUser user: PFUser) -> Void {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func logInViewControllerDidCancelLogIn(controller: PFLogInViewController) -> Void {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func signUpViewController(signUpController: PFSignUpViewController, didSignUpUser user: PFUser) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func signUpViewControllerDidCancelSignUp(signUpController: PFSignUpViewController) {
        self.dismissViewControllerAnimated(true, completion: nil)
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
        return aCell
    }


}

