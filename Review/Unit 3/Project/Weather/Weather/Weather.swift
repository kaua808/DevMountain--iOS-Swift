//
//  Weather.swift
//  Weather
//
//  Created by Kaleo Kim on 4/18/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation

class Weather {
    
    private let kWeather = "weather"
    private let kCity = "name"
    private let kMain = "main"
    private let kDescription = "description"
    private let kTemp = "temp"
    private let kIconString = "icon"
    
    
    //let main: String
    let description: String
    let temp: Float
    let city: String
    let iconString: String
    
    init?(dictionary: [String: AnyObject]) {
        
        guard let weatherArray = dictionary[kWeather] as? [[String: AnyObject]],
            weatherDictionary = weatherArray.first,
            description = weatherDictionary[kDescription] as? String,
            iconString = weatherDictionary[kIconString] as? String,
            main = dictionary[kMain] as? [String: AnyObject],
            temp = main[kTemp] as? Float,
            city = dictionary[kCity] as? String else { return nil }
        
        self.description = description
        self.temp = temp
        self.city = city
        self.iconString = iconString
        
    }
    
    
}