//
//  DataManager.swift
//  WeatherApp2
//
//  Created by Agnieszka Juraszek on 14/07/2022.
//

import Foundation

enum DataManagerError: Error {

    case Unknown
    case FailedRequest
    case InvalidResponse
    case IncorectUrl

}

final class DataManager {
    
    typealias WeatherDataCompletion = (AnyObject?, DataManagerError?) -> ()
    
    let baseURL: URL //czeka czy w init nic nie wrzucę. czyli przy tworzeniu obiektu za pomocą inita jest to ustawiane i to jest ok. jakby nie było w inicie przypisania to by był error
    
    init(baseURL: URL) {
        self.baseURL = baseURL
    }
    
    //f(g(x))
    func weatherDataForLocation(latitude: Double, longitude: Double, completion: @escaping WeatherDataCompletion) {
        
        let latitudeString: String = String(format: "%.4f", latitude)
        let longitudeString: String = String(format: "%.4f", longitude)
        
        var components = URLComponents(url: baseURL, resolvingAgainstBaseURL: true)
        components?.queryItems?.append(URLQueryItem(name: "q", value: "\(latitudeString),\(longitudeString)"))
        
        guard let url = components?.url else {
            completion(nil, .IncorectUrl)
            return
        }
        
        // Create Data Task
        URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
            self.didFetchWeatherData(data: data, response: response, error: error, completion: completion)
        }).resume()
        }

    private func didFetchWeatherData(data: Data?, response: URLResponse?, error: Error?, completion: @escaping WeatherDataCompletion) {
        if let _ = error {
            completion(nil, .FailedRequest)
        } else if let data = data, let response = response as? HTTPURLResponse {
            if response.statusCode == 200 {
                processWeatherData(data: data, completion: completion)
            } else {
                completion(nil, .FailedRequest)
            }

        } else {
            completion(nil, .Unknown)
        }
    }
    
    private func processWeatherData(data: Data, completion: WeatherDataCompletion) {
        if let JSON = try? JSONSerialization.jsonObject(with: data, options: []) as AnyObject {
            completion(JSON, nil)
        } else {
            completion(nil, .InvalidResponse)
        }
    }
}
