//
//  Representatives.swift
//  Representatives
//
//  Created by Kaleo Kim on 2/20/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation

class Representative {
    
    static let kNameKey = "name"
    static let kPartyKey = "party"
    static let kStateKey = "state"
    static let kDistrictKey = "district"
    static let kPhoneKey = "phone"
    static let kOfficeKey = "office"
    static let kLinkKey = "link"
    static let kResultsKey = "results"
    
    var name: String?
    var party: String?
    var state: String?
    var district: String?
    var phone: String?
    var office: String?
    var link: String?
    
    init(jsonDictionary: [String: String]) {
        self.name = jsonDictionary[Representative.kNameKey]
        self.party = jsonDictionary[Representative.kPartyKey]
        self.state = jsonDictionary[Representative.kStateKey]
        self.district = jsonDictionary[Representative.kDistrictKey]
        self.phone = jsonDictionary[Representative.kPhoneKey]
        self.office = jsonDictionary[Representative.kOfficeKey]
        self.link = jsonDictionary[Representative.kLinkKey]
    }
    
}