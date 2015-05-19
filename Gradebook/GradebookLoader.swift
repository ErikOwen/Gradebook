//
//  GradebookLoader.swift
//  Gradebook
//
//  Created by Erik Owen on 5/19/15.
//  Copyright (c) 2015 Erik Owen. All rights reserved.
//

import Foundation

class GradebookLoader {
    
    private var _loader: GradebookURLLoader
    
    private var _curSection: Section?
    private var _curEnrollment: Enrollment?
    
    init() {
        _loader = GradebookURLLoader()
    }
    
    func setCurrentSection(curSection: Section) {
        _curSection = curSection
    }
    
    func getCurrentSection() -> Section {
        return _curSection!
    }
    
    func setCurrentEnrollment(curEnrollment: Enrollment) {
        _curEnrollment = curEnrollment
    }
    
    func getCurrentEnrollment() -> Enrollment {
        return _curEnrollment!
    }
    
    func loginWithUsername(name: String, password: String, baseURL: String) -> Bool {
        _loader.baseURL = baseURL
        
        if _loader.loginWithUsername(name, andPassword: password) {
            println("Auth worked!")
            return true;
        }
        else {
            println("Auth failed!")
            return false;
        }
    }
    
    func loadSections() -> Sections {
        let data = _loader.loadDataFromPath("?record=sections", error: nil)
        
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
        
        return tempSections
    }
    
    func loadEnrollments() -> Enrollments {
        let enrollmentsUrl: String = "?record=enrollments&term=" + getCurrentSection().term! + "&course=" + getCurrentSection().course!
        
        let data = _loader.loadDataFromPath(enrollmentsUrl, error: nil)
        
        let str = NSString(data: data, encoding: NSUTF8StringEncoding)
        
        println("Data: \(str)")
        
        let json = JSON(data: data)
        var tempEnrollments: Enrollments = Enrollments();
        
        for (index, enrollmentJSON) in json["enrollments"] {
            
            let tempEnrollment = Enrollment()
            
            tempEnrollment.first_name = enrollmentJSON["first_name"].stringValue
            tempEnrollment.middle_name = enrollmentJSON["middle_name"].stringValue
            tempEnrollment.last_name = enrollmentJSON["last_name"].stringValue
            tempEnrollment.username = enrollmentJSON["username"].stringValue
            
            tempEnrollments.appendEnrollment(tempEnrollment)
        }
        
        return tempEnrollments
    }
}
