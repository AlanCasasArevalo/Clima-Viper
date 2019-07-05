//
//  WebServiceConfiguration.swift
//  Clima-Viper
//
//  Created by Casa on 05/07/2019.
//  Copyright © 2019 Alan Casas. All rights reserved.
//

import Foundation

internal struct WebServiceConfiguration {
    
    let apiKey: String
    
    private class Dummy {}
    
    static let `default` = WebServiceConfiguration(apiKey: Bundle(for: WebServiceConfiguration.Dummy.self) .infoDictionary?[WebConstants.kInfoDictionaryAPI] as? String ?? "")
    
    var parameters: [String : String] {
        return [
            WebConstants.kApiIdParameter : apiKey
        ]
    }
}
