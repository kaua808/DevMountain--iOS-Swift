//
//  RepresentativeController.swift
//  Representatives
//
//  Created by Kaleo Kim on 4/19/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation

class RepresentativeController {
    
    static func getReps(state: String, completion: (representatives: [Representative]) -> Void) {
        
        let url = "http://whoismyrepresentative.com/getall_reps_bystate.php?state=\(state)&output=json"
        
        NetworkController.dataAtURL(url) { (success, data) in
            
            guard let data = data,
            let json = NetworkController.jsonSerialization(data) else {
                    completion(representatives: [])
                    return
            }
            
            let repDictionary = json[Representative.kResultsKey] as? [[String: AnyObject]]
            
            var representatives: [Representative] = []
            
            for reps in repDictionary! {
                let newRep = Representative(dictionary: reps)
                representatives.append(newRep!)
            }
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                completion(representatives: representatives)
            })
        }
    }
}