//
//  WeatherPresenter.swift
//  Clima-Viper
//
//  Created by Casa on 05/07/2019.
//  Copyright © 2019 Alan Casas. All rights reserved.
//

import Foundation

protocol WeatherPresenterProtocol {
    func viewDidLoad()
    func viewWillAppear()
    func setupUIView ()
}

class WeatherPresenter: WeatherPresenterProtocol {
    
    var view: WeatherViewControllerProtocol!
    var router: WeatherRouterProtocol!
    var interactor: MainInteractorProtocol!
    
    init (view: WeatherViewControllerProtocol, router: WeatherRouterProtocol, interactor: MainInteractorProtocol) {
        (self.view, self.router, self.interactor) = (view, router, interactor)
    }

    func viewDidLoad() {
        
    }
    
    func viewWillAppear() {
    }
    
    func setupUIView() {
    }
    
    
}
