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
        var section: Section?
}

class SectionTableViewController: UITableViewController {
    
    var loader: GradebookURLLoader? {
        didSet {
            loadSections()
            refreshSections()
        }
    }
    var sections: Sections? {
        didSet {
            tableView.reloadData()
        }
    }

    func loadSections() {
        let data = loader!.loadDataFromPath("?record=sections", error: nil)
        
        let str = NSString(data: data, encoding: NSUTF8StringEncoding)
        
        println("Data: \(str)")
        
        let json = JSON(data: data)
        var tempSections: Sections = Sections();
        
        for (index, sectionJSON) in json["sections"] {
            
            let tempSection = Section()
            
            tempSection.course = sectionJSON["course"].stringValue
            tempSection.dept = sectionJSON["dept"].stringValue
            tempSection.term = sectionJSON["term"].stringValue
            tempSection.termname = sectionJSON["termname"].stringValue
            tempSection.title = sectionJSON["title"].stringValue
            
            tempSections.appendSection(tempSection)
        }
        
        sections = tempSections
    }
    
    func refreshSections() {
        
    }
    
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
        
        if let count =  sections?.getSize() {
            return count
        }
        
        return 0
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("sectionSubtitleCell", forIndexPath: indexPath) as! SectionTableViewCell
        
        // Configure the cell...
        let section = sections?.getSectionAtPos(indexPath.row)
        cell.section = section
        
        cell.textLabel?.text = section?.title
        cell.detailTextLabel?.text = section?.course
        
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
