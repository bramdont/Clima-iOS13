//
//  LocationData.swift
//  Clima
//
//  Created by Bramdont José García Aponte on 18/2/21.
//  Copyright © 2021 App Brewery. All rights reserved.
//

import Foundation
struct LocationData: Decodable {
    var data: [DataInfo]
}

struct DataInfo: Decodable {
    var region: String
    var county: String
    var country: String
}
