//
//  WeatherModel.swift
//  Clima
//
//  Created by Bramdont José García Aponte on 31/1/21.
//  Copyright © 2021 App Brewery. All rights reserved.
//

import Foundation
struct WeatherModel {
    var conditionID: Int
    var cityName: String
    var region: String
    var temp_c: Float
    var temp_f: Float
    var currentTime:  Int {
        let date = Date()
        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: date)
        return hour
    }
    
    var conditionName: String {
        switch conditionID {
        
        case 1000:
            return (currentTime >= 7 && currentTime <= 18) ? "sun.max" : "moon.stars"
        case 1003:
            return (currentTime >= 7 && currentTime <= 18) ? "cloud.sun" : "cloud.moon"
        case 1006:
            return "cloud"
        case 1009:
            return "smoke"
        case 1030:
            return "cloud.fog"
        case 1063:
            return (currentTime >= 7 && currentTime <= 18) ? "cloud.sun.rain" : "cloud.moon.rain"
        case 1066:
            return "cloud.snow"
        case 1069:
            return "cloud.sleet"
        case 1072:
            return "cloud.hail"
        case 1087:
            return (currentTime >= 7 && currentTime <= 18) ? "cloud.sun.bolt" : "cloud.moon.bolt"
        case 1114:
            return "cloud.hail"
        case 1117:
            return "cloud.hail"
        case 1135:
            return "cloud.fog.fill"
        case 1147:
            return "cloud.fog.fill"
        case 1150:
            return "cloud.dizzle"
        case 1153:
            return "cloud.dizzle"
        case 1168:
            return "cloud.hail.fill"
        case 1171:
            return "cloud.hail.fill"
        case 1180:
            return "cloud.sun.rain"
        case 1183:
            return "cloud.rain"
        case 1186:
            return (currentTime >= 7 && currentTime <= 18) ? "cloud.sun.rain" : "cloud.moon.rain"
        case 1189:
            return "cloud.rain"
        case 1192:
            return "cloud.heavyrain"
        case 1195:
            return "cloud.heavyrain"
        case 1198:
            return "cloud.dizzle"
        case 1201:
            return (currentTime >= 7 && currentTime <= 18) ? "cloud.sun.rain" : "cloud.moon.rain"
        case 1204:
            return "cloud.sleet"
        case 1207:
            return "cloud.sleet.fill"
        case 1210:
            return "cloud.snow"
        case 1213:
            return "cloud.snow"
        case 1216:
            return "cloud.snow.fill"
        case 1219:
            return "cloud.snow.fill"
        case 1222:
            return "cloud.snow.fill"
        case 1225:
            return "cloud.snow.fill"
        case 1237:
            return "snow"
        case 1240:
            return "cloud.snow"
        case 1243:
            return "cloud.rain"
        case 1246:
            return "cloud.heavyrain"
        case 1249:
            return "cloud.sleet"
        case 1252:
            return "cloud.sleet"
        case 1255:
            return "cloud.snow"
        case 1258:
            return "cloud.snow"
        case 1261:
            return "snow"
        case 1264:
            return "snow"
        case 1273:
            return "cloud.sun.bolt"
        case 1276:
            return "cloud.sun.bolt"
        case 1279:
            return "cloud.snow"
        case 1282:
            return "cloud.snow"
        default:
            return (currentTime >= 7 || currentTime <= 18) ? "sun.max" : "moon.stars"
        }
    }
}
