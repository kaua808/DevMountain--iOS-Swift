//
//  Patient.swift
//  SP3 - EquatableTableView
//
//  Created by Kaleo Kim on 2/4/16.
//  Copyright © 2016 Kaleo Kim. All rights reserved.
//

import Foundation

class Patient: Equatable {
    var name: String
    var fingerAvulsion: Bool
    
    init(name: String, fingerAvulsion: Bool) {
        self.name = name
        self.fingerAvulsion = fingerAvulsion
    }
}

func ==(lhs: Patient, rhs: Patient) -> Bool {
    return lhs.name == rhs.name && lhs.fingerAvulsion == rhs.fingerAvulsion
}

let parker = Patient(name: "Parker", fingerAvulsion: true)
let kaleo = Patient(name: "Kaleo", fingerAvulsion: false)