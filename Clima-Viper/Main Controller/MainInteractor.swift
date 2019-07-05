//
//  MainInteractor.swift
//  Clima-Viper
//
//  Created by Casa on 05/07/2019.
//  Copyright © 2019 Alan Casas. All rights reserved.
//

import Foundation

protocol MainInteractorProtocol {
    
}

class MainInteractor: MainInteractorProtocol {

    let provider: Provider!
    
    init(provider: Provider) {
        self.provider = provider
    }
    
    
    
}
