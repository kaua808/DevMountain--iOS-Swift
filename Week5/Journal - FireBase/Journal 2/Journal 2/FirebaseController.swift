//
//  FirebaseController.swift
//  Journal 2
//
//  Created by Kaleo Kim on 2/29/16.
//  Copyright © 2016 Kaleo Kim. All rights reserved.
//

import Foundation
import Firebase

class FirebaseController {
    static let base = Firebase(url: "https://journal-2763.firebaseio.com/")
    static let entryBase = base.childByAppendingPath("entries")
}

//https://journal-2763.firebaseio.com/
//https://kaleojournal.firebaseIO.com/