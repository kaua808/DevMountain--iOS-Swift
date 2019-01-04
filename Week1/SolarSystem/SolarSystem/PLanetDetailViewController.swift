//
//  PLanetDetailViewController.swift
//  SolarSystem
//
//  Created by Kaleo Kim on 2/3/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

class PLanetDetailViewController: UIViewController {
    
    var planet: Planet?
    
    @IBOutlet weak var planetImageView: UIImageView!

    @IBOutlet weak var diamterLabel: UILabel!
    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var dayLengthLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let planet = planet {
            updateWithPlanet(planet)
        }
        

    }
    
    func updateWithPlanet(planet: Planet) {
        
        title = planet.name
        
        planetImageView.image = UIImage(named: planet.imageName)
        
        diamterLabel.text = "\(planet.diameter)"
        distanceLabel.text = "\(planet.millionKMsFromSun)"
        dayLengthLabel.text = "\(planet.dayLength)"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
