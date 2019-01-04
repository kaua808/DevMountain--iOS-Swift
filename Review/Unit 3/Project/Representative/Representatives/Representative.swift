//
//  Representative.swift
//  Representatives
//
//  Created by Kaleo Kim on 4/19/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation

class Representative {
    
    private let kName = "name"
    private let kParty = "party"
    private let kState = "state"
    private let kDistrict = "district"
    private let kPhone = "phone"
    private let kOffice = "office"
    private let kLink = "link"
    static let kResultsKey = "results"
    
    var name: String?
    var party: String?
    var state: String?
    var district: String?
    var phone: String?
    var office: String?
    var link: String?
    
    init?(dictionary: [String: AnyObject]) {
        
        guard let name = dictionary[kName] as? String,
            let party = dictionary[kParty] as? String,
            let state = dictionary[kState] as? String,
            let district = dictionary[kDistrict] as? String,
            let phone = dictionary[kPhone] as? String,
            let office = dictionary[kOffice] as? String,
            let link = dictionary[kLink] as? String else { return }
        
        self.name = name
        self.party = party
        self.state = state
        self.district = district
        self.phone = phone
        self.office = office
        self.link = link
        
    }
    
}