//
//  StudentController.swift
//  MiniLesson - Model and Controller
//
//  Created by Kaleo Kim on 2/4/16.
//  Copyright © 2016 Kaleo Kim. All rights reserved.
//

import Foundation

class StudentController {
    
    private let studentKey = "students"
    
    static let sharedInstance = StudentController()
    
    var studentArray : [Student]
    
    init() {
        
        studentArray = []
        self.loadFromPersistantStore()
        
    }
    
    func loadFromPersistantStore() {
        
        let unarchivedStudents = NSKeyedUnarchiver.unarchiveObjectWithFile(self.filePath(studentKey))
        
        if let students = unarchivedStudents as? [Student]{
            self.studentArray = students
        }
    
        
//        let studentDictionaryFromDefaults = NSUserDefaults.standardUserDefaults().objectForKey(studentKey) as?  [Dictionary<String, AnyObject>]
//        
//        if let studentDictionary = studentDictionaryFromDefaults {
//            self.studentArray = studentDictionary.map({Student(dictionary: $0)!})
//        }
        
    }
    
    func saveToPersistantStorage() {

    NSKeyedArchiver.archiveRootObject(self.studentArray, toFile: self.filePath(studentKey))
        
//        let studentDictionaries = self.studentArray.map({$0.dictionaryCopy()})
//        
//        NSUserDefaults.standardUserDefaults().setObject(studentDictionaries, forKey: studentKey)
        
        
        
    }
    
    func addStudent(student: Student) {
        
        studentArray.append(student)
        self.saveToPersistantStorage()
        
        
    }
    
    func removeStudent(indexPath: NSIndexPath) {
        studentArray.removeAtIndex(indexPath.row)
    }
    
    // NSCoder stuff
    
    func filePath(key: String) -> String {
        
        let directorySearchResults = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.AllDomainsMask, true)
        
        let documentPath: AnyObject = directorySearchResults[0]
        
        let studentsPath = documentPath.stringByAppendingString("/\(key).plist")
        return studentsPath
        
    }
    
}

