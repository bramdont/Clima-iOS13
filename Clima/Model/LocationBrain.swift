//
//  LocationBrain.swift
//  Clima
//
//  Created by Bramdont José García Aponte on 18/2/21.
//  Copyright © 2021 App Brewery. All rights reserved.
//

import Foundation

protocol LocationBrainDelagate{
    func didLocationUpdate(location: LocationModel)
    func didFailWithError(_ error: Error)
}

struct LocationBrain {
    let apiKey = "c0799b9e8079555e139e51d0901bf6e8"
    let basePathURL = "http://api.positionstack.com/v1/"
    
    var delegate: LocationBrainDelagate?
    
    let example = "http://api.positionstack.com/v1/reverse?access_key=c0799b9e8079555e139e51d0901bf6e8&query=40.7638435,-73.9729691"
    
    func fetchLocation(lat: String, long: String){
        let finalUrl = "\(basePathURL)reverse?access_key=\(apiKey)&query=\(lat),\(long)"
        //print(finalUrl)
        performLocationRequest(with: finalUrl)
    }
    
    func performLocationRequest(with urlString: String) {
        if let url = URL(string: urlString){
            
            let session = URLSession(configuration: .default)
            
            let task = session.dataTask(with: url) { (data, response, error) in
                
                if error != nil {
                    delegate?.didFailWithError(error!)
                    return
                }
                
                if let safeData = data{
                    if let location = parseJSON(responseData: safeData){
                        delegate?.didLocationUpdate(location: location)
                    }
                }
            }
            
            task.resume()
        }
        
    }
    
    func parseJSON(responseData: Data) -> LocationModel? {
        let decoder = JSONDecoder()
        do{
            let decodedData = try decoder.decode(LocationData.self, from: responseData)
            
            let region = decodedData.data[0].region
            let city = decodedData.data[0].county
            let country = decodedData.data[0].country
            
            let location = LocationModel(region: region, city: city, country: country)
            return location
            
        }catch{
            delegate?.didFailWithError(error)
            return nil
        }
    }
    
}
