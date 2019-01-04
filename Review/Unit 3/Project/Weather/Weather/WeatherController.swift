//
//  WeatherController.swift
//  Weather
//
//  Created by Kaleo Kim on 4/18/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation

class WeatherController {
    
//    static func getCityByName(city: String, completion: (weather: Weather?) -> Void) {
//        
//        let key = "9d104c5933680afb5ff8cce57aeec998"
//        let base = "http://api.openweathermap.org/data/2.5/weather"
//        
//        let url = base + "?q=\(city.lowercaseString)" + "&appid=\(key)"
//        
//        NetworkController.dataAtURL(url) { (success, data) in
//            
//            guard let data = data,
//                json = NetworkController.serializeData(data),
//                weatherArray =
//            
//        }
//        
//        NetworkController.dataAtURL(url) { (success, data) in
//            
//            guard let data = data,
//                json = NetworkController.serializeData(data),
//                cardArray = json["cards"] as? [[String: AnyObject]],
//                cardDictionary = cardArray.first where success else{
//                    
//                    completion(card: nil)
//                    return
//                    
//            }
//            
//            let card = Card(dictionary: cardDictionary)
//            completion(card: card)
//        }
//        
//    }
    
    
    static func searchForWeather(searchString: String, completion: (weather: Weather?) -> Void) {
        
        let key = "9d104c5933680afb5ff8cce57aeec998"
        let base = "http://api.openweathermap.org/data/2.5/weather"
        let imperial = "&units=imperial"
        
        let url = base + "?q=\(searchString)" + "\(imperial)" + "&appid=\(key)"
        
        NetworkController.dataAtURL(url) { (success, data) in
            guard let data = data,
                json = NetworkController.serializeDataWithReturn(data) else {completion(weather: nil); return}
            
            let weather = Weather(dictionary: json)
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                completion(weather: weather)
            })
            
            
        }
    }
    
    static func iconURLForString(weather: Weather) -> String {
        return "http://openweathermap.org/img/w/\(weather.iconString).png"
    }
    
}