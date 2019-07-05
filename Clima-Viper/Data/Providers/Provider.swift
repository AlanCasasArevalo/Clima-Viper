//
//  Provider.swift
//  Clima-Viper
//
//  Created by Casa on 05/07/2019.
//  Copyright © 2019 Alan Casas. All rights reserved.
//

import Foundation

class Provider {
    
    let webService: WebService!
    
    init(webService: WebService) {
        self.webService = webService
    }
    
    func loadClimaFromAPI (query: String, success: @escaping (WeatherEntity) -> Void, failure: @escaping(Error?) -> Void) {
        webService.fetchResultFromAPI(type: WeatherEntity.self, endpoint: Endpoint.weather(query: query)) { result in
            switch result {
            case .success(let clima):
                success(clima)
            case .failure(let error):
                failure(error)
            }
        }
    }
}
