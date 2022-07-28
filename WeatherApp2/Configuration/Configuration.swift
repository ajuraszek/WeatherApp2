//
//  Configuration.swift
//  WeatherApp2
//
//  Created by Agnieszka Juraszek on 14/07/2022.
//

import Foundation

struct API {
    static let apiKey = "1159e4a3d147452483e164137221407"
    
//    static var authenticatedBaseURL: URL {
//            return baseUrl.appendingPathComponent(apiKey)
//        }
// ta zmienna jest jak funkcja, tylko nie można do niej przekazać argumentu
    
    static var basicForecastDejMnieTuTeraz: URL {
       
        var components = URLComponents()
            components.scheme = "https"
            components.host = "api.weatherapi.com"
            components.path = "/v1/current.json"
            components.queryItems = [
                URLQueryItem(name: "aqi", value: "no"),
                URLQueryItem(name: "key", value: apiKey)
            ]
        
        return components.url!
    }
}

struct Defaults {

    static let latitude: Double = 37.8267
    static let longitude: Double = -122.423

}
