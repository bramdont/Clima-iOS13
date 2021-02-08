//
//  WeatherManager.swift
//  Clima
//
//  Created by Bramdont José García Aponte on 30/1/21.
//  Copyright © 2021 App Brewery. All rights reserved.
//

import Foundation

protocol WeatherManagerDelegate {
    func didUpdateWeather(weather: WeatherModel)
    func didFailWithError(_ error: Error)
}

struct WeatherManager {
    let keyAPI = "6a1666e0985842328fe15930213101"
    let mainURL = "https://api.weatherapi.com/v1/current.json"
    
    //var weatherData:WeatherData?
    
    var delegate: WeatherManagerDelegate?
    
    //This method create the entire URL so we can call the API and do the Networking process
    func fetchWeather(cityName: String) {
        let safeCity = cityName.replacingOccurrences(of: " ", with: "%20")
        let url = "\(mainURL)?key=\(keyAPI)&q=\(safeCity)"
        performRequest(with: url)
        print(url)
    }
    
    //Networking
    func performRequest(with urlString: String) {
        //Create an URL
        if let url = URL(string: urlString){
            
            //Create an url session
            let session = URLSession(configuration: .default)
            
            //Create a task
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    //print(error!)
                    delegate?.didFailWithError(error!)
                    return //A return keyword in a VOID method mean when the code runs this line, it'll break(take out of) the method
                }
                
                if let safeData = data {
                    if let weatherInfo = parseJSON(safeData){
                        delegate?.didUpdateWeather(weather: weatherInfo)
                    }
                }
            }
            //Start(make) the request throw internet
            task.resume()
        }
    }

    func parseJSON(_ weatherData: Data) -> WeatherModel?{
        //Create a JSON Decoder, so we can decode the data from the weatherData argument (variable)
        let decoder = JSONDecoder()
        do{
            //The method we use to decode the data from the weatherData variable is called decode()
            //we call this method from the variable we've created before called decoder
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            print("There is \(decodedData.current.temp_c)°C in \(decodedData.location.name), \(decodedData.location.region)")
            let id = decodedData.current.condition.code
            let city = decodedData.location.name
            let region = decodedData.location.region
            let temp_c = decodedData.current.temp_c
            let temp_f = decodedData.current.temp_f
            
            let weather = WeatherModel(conditionID: id, cityName: city, region: region, temp_c: temp_c, temp_f: temp_f)
            //print(weather.conditionName)
            return weather
        } catch {
            //print(error)
            delegate?.didFailWithError(error)
            return nil
        }
    }
    
}
