//
//  WeatherData.swift
//  Clima
//
//  Created by Bramdont José García Aponte on 31/1/21.
//  Copyright © 2021 App Brewery. All rights reserved.
//

import Foundation
struct WeatherData: Decodable {
    var location: Location
    var current: Current
}

struct Location: Decodable {
    var name: String
    var region: String
    var country: String
}

struct Current: Decodable {
    var last_updated: String
    var temp_c: Float
    var temp_f: Float
    var condition: Condition
}

struct Condition: Decodable {
    var text: String
    var code: Int
}
