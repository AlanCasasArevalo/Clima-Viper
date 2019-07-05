//
//  WeatherIcon.swift
//  Clima-Viper
//
//  Created by Casa on 05/07/2019.
//  Copyright © 2019 Alan Casas. All rights reserved.
//

import Foundation

enum WeatherIcon: String {
    case icon01d = "01"
    case icon02d = "02"
    case icon03d = "03"
    case icon04d = "04"
    case icon09d = "09"
    case icon10d = "10"
    case icon11d = "11"
    case icon13d = "13"
    case icon50d = "50"
}

extension WeatherIcon {
    var icon : String {
        switch self{
        case .icon01d:
            return WeatherConstants.kClearSkyImage
        case .icon02d:
            return WeatherConstants.kFewCloudsImage
        case .icon03d:
            return WeatherConstants.kScatteredCloudsImage
        case .icon04d:
            return WeatherConstants.kBrokenCloudsImage
        case .icon09d:
            return WeatherConstants.kShowerRainImage
        case .icon10d:
            return WeatherConstants.kRainImage
        case .icon11d:
            return WeatherConstants.kThunderstormImage
        case .icon13d:
            return WeatherConstants.kSnowImage
        case .icon50d:
            return WeatherConstants.kMistImage
        }
    }
}
