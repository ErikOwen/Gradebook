//
//  SectionTableViewController.swift
//  Gradebook
//
//  Created by Erik Owen on 5/14/15.
//  Copyright (c) 2015 Erik Owen. All rights reserved.
//

import Foundation
import UIKit

class SectionTableViewCell: UITableViewCell {
    //    var quake: Earthquake?
}

class SectionTableViewController: UITableViewController {
    
    //    var quakes: Earthquakes? {
    //        didSet {
    //            tableView.reloadData()
    //            quakes?.count.addCallback {
    //                [unowned self] (oldValue: Int?, newValue: Int) -> Void in
    //                self.tableView.reloadData()
    //            }
    //        }
    //    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // println("view did load")
        tableView.reloadData()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        // println("count for section \(section)")
        
        //        if let count =  quakes?.quakes.count {
        //            return count
        //        }
        
        return 0
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("subtitleCell", forIndexPath: indexPath) as! SectionTableViewCell
        
        // Configure the cell...
        //        let quake = quakes?.quakes[indexPath.row]
        //        cell.quake = quake
        if indexPath.row < 5 {
            cell.textLabel?.textColor = UIColor.redColor()
        }
        else {
            cell.textLabel?.textColor = UIColor.blackColor()
        }
        
        //        cell.textLabel?.text = quake?.place
        //        cell.detailTextLabel?.text = quake?.mag
        
        return cell
    }
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
        if segue.identifier == "quakeDetails" {
            if let dest = segue.destinationViewController as? EnrollmentTableViewController, let cell = sender as? SectionTableViewCell {
                //                dest.quake = cell.quake
            }
        }
    }
    
}
