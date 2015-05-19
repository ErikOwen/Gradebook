//
//  ModelObjects.swift
//  Gradebook
//
//  Created by Erik Owen on 5/14/15.
//  Copyright (c) 2015 Erik Owen. All rights reserved.
//

import Foundation


class Section {
    var term: String?
    var termname: String?
    var dept: String?
    var course: String?
    var title: String?
}

class Sections {
    private var _sections: [Section] = []
    
    var sections: [Section] {
        get {
            return _sections
        }
    }
    
    func appendSection(section: Section) {
        _sections.append(section);
    }
    
    func removeAllSections() {
        _sections.removeAll(keepCapacity: true);
    }
    
    func getSize() -> Int {
        return _sections.count
    }
    
    func getSectionAtPos(index: Int) -> Section {
        return _sections[index]
    }
}

class Enrollment {
    var first_name: String?
    var middle_name: String?
    var last_name: String?
    var username: String?
    var major: String?
}

class Enrollments {
    private var _enrollments: [Enrollment] = []
    
    var enrollments: [Enrollment] {
        get {
            return _enrollments
        }
    }
    
    func appendEnrollment(enrollment: Enrollment) {
        _enrollments.append(enrollment);
    }
    
    func removeAllEnrollments() {
        _enrollments.removeAll(keepCapacity: true);
    }
    
    func getSize() -> Int {
        return _enrollments.count
    }
    
    func getEnrollmentnAtPos(index: Int) -> Enrollment {
        return _enrollments[index]
    }
}

class UserScore {
    var name: String?
    var max_points: Int?
    var scores: [Score]?
}

class UserScores {
    private var _userScores: [UserScore] = []
    
    var userScores: [UserScore] {
        get {
            return _userScores
        }
    }
    
    func appendUserScore(userScore: UserScore) {
        _userScores.append(userScore);
    }
    
    func removeAllEnrollments() {
        _userScores.removeAll(keepCapacity: true);
    }
}

class Score {
    var score: Int?
    var displayScore: String?
}
