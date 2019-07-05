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
        if cloudsToCheck.lowercased().contains(WeatherIcon.icon01d.rawValue.lowercased()) {
            return WeatherConstants.kClearSkyImage
        } else if cloudsToCheck.lowercased().contains(WeatherIcon.icon02d.rawValue.lowercased()) {
            return WeatherConstants.kFewCloudsImage
        } else if cloudsToCheck.lowercased().contains(WeatherIcon.icon03d.rawValue.lowercased()) {
            return WeatherConstants.kScatteredCloudsImage
        } else if cloudsToCheck.lowercased().contains(WeatherIcon.icon04d.rawValue.lowercased()) {
            return WeatherConstants.kBrokenCloudsImage
        } else if cloudsToCheck.lowercased().contains(WeatherIcon.icon09d.rawValue.lowercased()) {
            return WeatherConstants.kShowerRainImage
        } else if cloudsToCheck.lowercased().contains(WeatherIcon.icon10d.rawValue.lowercased()) {
            return WeatherConstants.kRainImage
        } else if cloudsToCheck.lowercased().contains(WeatherIcon.icon11d.rawValue.lowercased()) {
            return WeatherConstants.kThunderstormImage
        } else if cloudsToCheck.lowercased().contains(WeatherIcon.icon13d.rawValue.lowercased()) {
            return WeatherConstants.kSnowImage
        } else if cloudsToCheck.lowercased().contains(WeatherIcon.icon50d.rawValue.lowercased()) {
            return WeatherConstants.kMistImage
        }else {
            return ""
        }
    }
    
    func setupDescriptionToWeatherDTO(cloudsToCheck: String) -> String {
        
        if cloudsToCheck.lowercased().contains(WeatherIcon.icon01d.rawValue.lowercased()) {
            return WeatherConstants.kClearSkyDescription
        } else if cloudsToCheck.lowercased().contains(WeatherIcon.icon02d.rawValue.lowercased()) {
            return WeatherConstants.kFewCloudsDescription
        } else if cloudsToCheck.lowercased().contains(WeatherIcon.icon03d.rawValue.lowercased()) {
            return WeatherConstants.kScatteredCloudsDescription
        } else if cloudsToCheck.lowercased().contains(WeatherIcon.icon04d.rawValue.lowercased()) {
            return WeatherConstants.kBrokenCloudsDescription
        } else if cloudsToCheck.lowercased().contains(WeatherIcon.icon09d.rawValue.lowercased()) {
            return WeatherConstants.kShowerRainDescription
        } else if cloudsToCheck.lowercased().contains(WeatherIcon.icon10d.rawValue.lowercased()) {
            return WeatherConstants.kRainDescription
        } else if cloudsToCheck.lowercased().contains(WeatherIcon.icon11d.rawValue.lowercased()) {
            return WeatherConstants.kThunderstormDescription
        } else if cloudsToCheck.lowercased().contains(WeatherIcon.icon13d.rawValue.lowercased()) {
            return WeatherConstants.kSnowDescription
        } else if cloudsToCheck.lowercased().contains(WeatherIcon.icon50d.rawValue.lowercased()) {
            return WeatherConstants.kMistDescription
        }else {
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
