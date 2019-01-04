//
//  WeatherController.swift
//  Weather
//
//  Created by Kaleo Kim on 3/15/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation
import UIKit

class WeatherController {
    
    static func weatherBySearchCity(city: String, completion:(results: Weather?) -> Void) {
        
        let url = NetworkController.searchURLByCity(city)
        
        NetworkController.dataAtURL(url) { (resultData) -> Void in
            guard let resultData = resultData else {
                
                print("No Data at Endpoint")
                completion(results: nil)
                return
                
            }
            
            do {
                
                let weatherAnyObject = try NSJSONSerialization.JSONObjectWithData(resultData, options: NSJSONReadingOptions.AllowFragments)
                
                var weatherModelObject: Weather?
                
                if let weatherDictionary = weatherAnyObject as? [String: AnyObject] {
                    weatherModelObject = Weather(jsonDictionary: weatherDictionary)
                }
                completion(results: weatherModelObject)
            } catch {
                completion(results: nil)
            }
            
        }
    }
    
    static func weatherIconForIconCode(iconCode: String, completion:(image: UIImage?) -> Void) {
        let url = NetworkController.urlDorIcon(iconCode)
        
        NetworkController.dataAtURL(url) { (resultData) -> Void in
            guard let resultData = resultData
                else {
                    print("NO DATA RETURNED")
                    completion(image: nil)
                    return
            }
            completion(image: UIImage(data: resultData))
        }
        
    }
    
}