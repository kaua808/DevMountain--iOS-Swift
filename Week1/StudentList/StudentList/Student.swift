//
//  Student.swift
//  StudentList
//
//  Created by Kaleo Kim on 2/4/16.
//  Copyright © 2016 Kaleo Kim. All rights reserved.
//

import UIKit

class Student: NSObject {

    let name: String
    let phoneNumber: String
    let hometown: String
    
    init(name: String, phoneNumber: String, homeTown: String) {
        self.name = name
        self.phoneNumber = phoneNumber
        self.hometown = homeTown
    }
    
    
}
