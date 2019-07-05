//
//  WeatherIcon.swift
//  Clima-Viper
//
//  Created by Casa on 05/07/2019.
//  Copyright © 2019 Alan Casas. All rights reserved.
//

import Foundation

enum WeatherIcon: String {
    case icon01d = "01d"
    case icon02d = "02d"
    case icon03d = "03d"
    case icon04d = "04d"
    case icon09d = "09d"
    case icon10d = "10d"
    case icon11d = "11d"
    case icon13d = "13d"
    case icon50d = "50d"
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
