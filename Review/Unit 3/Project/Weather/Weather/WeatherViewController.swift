//
//  WeatherViewController.swift
//  Weather
//
//  Created by Kaleo Kim on 4/18/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController, UISearchBarDelegate {

    @IBOutlet var cityNameLabel: UILabel!
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var tempLabel: UILabel!
    @IBOutlet var mainLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        guard let searchText = searchBar.text else {return}
        
        WeatherController.searchForWeather(searchText) { (weather) in
            guard let weather = weather else {return}
            self.cityNameLabel.text = weather.city
            self.tempLabel.text = "Temperature is \(weather.temp)"
            self.descriptionLabel.text = weather.description
            ImageController.imageAtURL("http://openweathermap.org/img/w/\(weather.iconString).png", completion: { (image) in
                self.imageView.image = image
            })
        }
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
