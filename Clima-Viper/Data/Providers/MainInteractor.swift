//
//  MainInteractor.swift
//  Clima-Viper
//
//  Created by Casa on 05/07/2019.
//  Copyright © 2019 Alan Casas. All rights reserved.
//

import Foundation

protocol MainInteractorProtocol {
    func fetchWeatherFromInteractor (cityToQuery: String, success: @escaping (WeatherEntity) -> Void, failure: @escaping(Error?) -> Void)
    func defaultWeatherDTO () -> WeatherDTO
    func setupTemperatureToWeatherDTO(temperature: Double) -> String
    func setupImageNameToWeatherDTO(cloudsToCheck: String) -> String
    func setupDescriptionToWeatherDTO(cloudsToCheck: String) -> String
    func formatWeatherEntityIntoWeatherDTO(weatherEntity: WeatherEntity) -> WeatherDTO? 

}

final class MainInteractor: MainInteractorProtocol {

    let provider: Provider!
    
    init(provider: Provider) {
        self.provider = provider
    }
    
    func fetchWeatherFromInteractor(cityToQuery: String, success: @escaping (WeatherEntity) -> Void, failure: @escaping (Error?) -> Void) {        
        provider.fetchWeatherFromProvider(query: cityToQuery, success: { (weatherEntity) in
            success(weatherEntity)
        }) { (error) in
            failure(error)
        }
    }
    
    func defaultWeatherDTO () -> WeatherDTO {
        let weather = WeatherDTO(temperature: "", cloudsImageName: "", cloudConditions: "")
        return weather
    }
    
    func setupTemperatureToWeatherDTO(temperature: Double) -> String {
        // Api return value in Kelvin. Kelvin to celsius K − 273,15 =  °C
        let result = temperature - 273.15
        return String(format: "%.1f", result)
    }
    
    func setupImageNameToWeatherDTO(cloudsToCheck: String) -> String {

        switch cloudsToCheck {
        case WeatherIcon.icon01d.rawValue:
            return WeatherConstants.kClearSkyImage
        case WeatherIcon.icon02d.rawValue:
            return WeatherConstants.kFewCloudsImage
        case WeatherIcon.icon03d.rawValue:
            return WeatherConstants.kScatteredCloudsImage
        case WeatherIcon.icon04d.rawValue:
            return WeatherConstants.kBrokenCloudsImage
        case WeatherIcon.icon09d.rawValue:
            return WeatherConstants.kShowerRainImage
        case WeatherIcon.icon10d.rawValue:
            return WeatherConstants.kRainImage
        case WeatherIcon.icon11d.rawValue:
            return WeatherConstants.kThunderstormImage
        case WeatherIcon.icon13d.rawValue:
            return WeatherConstants.kSnowImage
        case WeatherIcon.icon50d.rawValue:
            return WeatherConstants.kMistImage
        default:
            return ""
        }

    }

    func setupDescriptionToWeatherDTO(cloudsToCheck: String) -> String {

        switch cloudsToCheck {
        case WeatherIcon.icon01d.rawValue:
            return WeatherConstants.kClearSkyDescription
        case WeatherIcon.icon02d.rawValue:
            return WeatherConstants.kFewCloudsDescription
        case WeatherIcon.icon03d.rawValue:
            return WeatherConstants.kScatteredCloudsDescription
        case WeatherIcon.icon04d.rawValue:
            return WeatherConstants.kBrokenCloudsDescription
        case WeatherIcon.icon09d.rawValue:
            return WeatherConstants.kShowerRainDescription
        case WeatherIcon.icon10d.rawValue:
            return WeatherConstants.kRainDescription
        case WeatherIcon.icon11d.rawValue:
            return WeatherConstants.kThunderstormDescription
        case WeatherIcon.icon13d.rawValue:
            return WeatherConstants.kSnowDescription
        case WeatherIcon.icon50d.rawValue:
            return WeatherConstants.kMistDescription
        default:
            return ""
        }

    }
    
    func formatWeatherEntityIntoWeatherDTO(weatherEntity: WeatherEntity) -> WeatherDTO? {
        guard let temperatureDes = weatherEntity.main?.temp else {
            return nil
        }
        guard let cloudsIconDes = weatherEntity.weather?[0].icon else {
            return nil
        }
        
        let temperature = self.setupTemperatureToWeatherDTO(temperature: temperatureDes)
        let cloudsDesImageNameDes = self.setupImageNameToWeatherDTO(cloudsToCheck: cloudsIconDes)
        let cloudDescription = self.setupDescriptionToWeatherDTO(cloudsToCheck: cloudsIconDes)
        
        let weatherDTO = WeatherDTO(temperature: temperature, cloudsImageName: cloudsDesImageNameDes, cloudConditions: cloudDescription)
        
        return weatherDTO
    }
    
}
