//
//  EnrollmentTableViewController.swift
//  Gradebook
//
//  Created by Erik Owen on 5/14/15.
//  Copyright (c) 2015 Erik Owen. All rights reserved.
//

import Foundation
import UIKit

class EnrollmentTableViewCell: UITableViewCell {
//    var quake: Earthquake?
}

class EnrollmentTableViewController: UITableViewController {
    
    var loader: GradebookLoader? {
        didSet {
            enrollments = loader!.loadEnrollments()
        }
    }
    
    var enrollments: Enrollments? {
        didSet {
            tableView.reloadData()
        }
    }
    
//    func loadEnrollments() {
//        if(loader != nil && section != nil) {
//            let enrollmentsUrl: String = "?record=enrollments&term=" + section!.term! + "&course=" + section!.course!
//            
//            let data = loader!.loadDataFromPath(enrollmentsUrl, error: nil)
//            
//            let str = NSString(data: data, encoding: NSUTF8StringEncoding)
//            
//            println("Data: \(str)")
//            
//            let json = JSON(data: data)
//            var tempEnrollments: Enrollments = Enrollments();
//            
//            for (index, enrollmentJSON) in json["enrollments"] {
//                
//                let tempEnrollment = Enrollment()
//                
//                tempEnrollment.first_name = enrollmentJSON["first_name"].stringValue
//                tempEnrollment.middle_name = enrollmentJSON["middle_name"].stringValue
//                tempEnrollment.last_name = enrollmentJSON["last_name"].stringValue
//                tempEnrollment.username = enrollmentJSON["usernmae"].stringValue
//                
//                tempEnrollments.appendEnrollment(tempEnrollment)
//            }
//            
//            enrollments = tempEnrollments
//
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
            if let dest = segue.destinationViewController as? AssignmentTableViewController, let cell = sender as? SectionTableViewCell {
//                dest.quake = cell.quake
            }
        }
    }
    
}
