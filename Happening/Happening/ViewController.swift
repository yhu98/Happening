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

    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        user.setObject(<#T##object: AnyObject##AnyObject#>, forKey: <#T##String#>)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

