//
//  Lesson.swift
//  CourseTracker
//
//  Created by Taylor Mott on 2/12/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation

class Lesson: Equatable {
    
    
    var name = ""
    var lessonID = Int()
    var description = ""
    var studentNotes = ""
    var objectives = [Objective]()
    
    func updateWithDictionary(dictionary: [String : AnyObject]) {
        name = dictionary["name"] as? String ?? ""
        lessonID = dictionary["lessonID"] as? Int ?? 0
        description = dictionary["description"] as? String ?? ""
        studentNotes = dictionary["studentNotes"] as? String ?? ""
        if let newObjectives = dictionary["objectives"] as? [[String : AnyObject]] {
            for newObjectiveDictionary in newObjectives {
                let newObjective = Objective()
                newObjective.updateWithDictionary(newObjectiveDictionary)
                objectives.append(newObjective)
            }
        }
    }
}

func ==(lhs: Lesson, rhs: Lesson) -> Bool {
    return lhs.lessonID == rhs.lessonID && lhs.name == rhs.name
}