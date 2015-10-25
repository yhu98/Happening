//
//  InterestsTableView.swift
//  Happening
//
//  Created by Prasanthi Relangi on 10/24/15.
//  Copyright © 2015 TeamAwesomeHackingEDU. All rights reserved.
//

import UIKit

class InterestsTableView: UITableView {

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    var objects = [String]()
    
    override func numberOfRowsInSection(section: Int) -> Int {
        return 5
    }
    
    override func cellForRowAtIndexPath(indexPath: NSIndexPath) -> UITableViewCell? {
        let aCell = self.tableView.dequeueReusableCellWithIdentifier("InterestsCell",
            forIndexPath: indexPath) as! TableViewCell
        // Sets the text of the Label in the Table View Cell
        aCell.titleLabel.text = self.objects[indexPath.row]
        return aCell
        
    }
    
    
    

}
