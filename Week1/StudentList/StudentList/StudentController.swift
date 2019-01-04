//
//  StudentController.swift
//  StudentList
//
//  Created by Kaleo Kim on 2/4/16.
//  Copyright © 2016 Kaleo Kim. All rights reserved.
//

import UIKit

class StudentController: NSObject {
    
    static let sharedInstance = StudentController()
    
    private(set) var students: [Student]
    
    static var stagedStudents: [Student] {
        
        return [
            Student(name: "Kaleo", phoneNumber: "555-555-5555", homeTown: "Hawaii"),
            Student(name: "Adam", phoneNumber: "333-333-3333", homeTown: "Salt Lake"),
            Student(name: "Daniel", phoneNumber: "111-111-1111", homeTown: "Seattle")
        ]
    }
    
    override init() {
        students = StudentController.stagedStudents
    }

}

//static mean its a property on the class 
