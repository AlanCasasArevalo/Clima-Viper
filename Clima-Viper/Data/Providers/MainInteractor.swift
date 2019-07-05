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
}

class MainInteractor: MainInteractorProtocol {

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
}
