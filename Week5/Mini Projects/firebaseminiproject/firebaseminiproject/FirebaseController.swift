//
//  File.swift
//  firebaseminiproject
//
//  Created by Kaleo Kim on 2/29/16.
//  Copyright © 2016 Kaleo Kim. All rights reserved.
//

import Foundation
import Firebase

class FireBaseController {
    
    static let base = Firebase(url: "https://miniiosproject.firebaseIO.com/")
    static let entryBase = base.childByAppendingPath("entries")
    
}