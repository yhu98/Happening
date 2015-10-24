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
        let logInController = PFLogInViewController()
        logInController.delegate = self
        self.presentViewController(logInController, animated:true, completion: nil)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

