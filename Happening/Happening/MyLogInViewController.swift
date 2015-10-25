//
//  MyLogInViewController.swift
//  Happening
//
//  Created by Douglas Hewitt on 10/24/15.
//  Copyright © 2015 TeamAwesomeHackingEDU. All rights reserved.
//

import Parse
import ParseUI

class MyLogInViewController : PFLogInViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.darkGrayColor()
        
//        self.logInView.usernameField.placeholder = "email"

        
//        let logoView = UIImageView(image: UIImage(named:"logo.png"))
//        self.logInView.logo = logoView
    }
    
//    override func viewDidLayoutSubviews() {
//        super.viewDidLayoutSubviews()
//        
//        self.logInView.logInButton.frame = CGRectMake(...) // Set a different frame.
//    }
    
}