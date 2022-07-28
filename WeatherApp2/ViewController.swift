//
//  ViewController.swift
//  WeatherApp2
//
//  Created by Agnieszka Juraszek on 14/07/2022.
//

import UIKit

class ViewController: UIViewController {

    private let dataManager = DataManager(baseURL: API.basicForecastDejMnieTuTeraz)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //setupView()

        // Fetch Weather Data
        dataManager.weatherDataForLocation(latitude: Defaults.latitude, longitude: Defaults.longitude) { (response, error) in
            print(response ?? "default value")
        }
    }


}

