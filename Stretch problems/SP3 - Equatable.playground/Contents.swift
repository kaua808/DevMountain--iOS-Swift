//: Playground - noun: a place where people can play

import Cocoa

class Patient: Equatable {
    var name: String
    var fingerAvulsion: Bool
    
    init(name: String, fingerAvulsion: Bool) {
        self.name = name
        self.fingerAvulsion = fingerAvulsion
    }
}

func ==(lhs: Patient, rhs: Patient) -> Bool {
    return lhs.fingerAvulsion == rhs.fingerAvulsion
}


let patientArray = [Patient(name: "Kaleo", fingerAvulsion: false),
                    Patient(name: "Parker", fingerAvulsion: true)]

func newPatient () {
    let jimmyFallon = Patient(name: "Jimmy", fingerAvulsion: true)
    
    for person in patientArray {
        if person == jimmyFallon {
            print("Ew they both got an avulsion")
        } else {
            print("glad that didnt happen to me")
        }
    }
}

//newPatient()

