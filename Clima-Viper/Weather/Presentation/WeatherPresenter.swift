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
    func navigationToCheckOtherCityFromPresenter()
    func updateUIWithWeatherDTO (weatherDTO: WeatherDTO?)
}

class WeatherPresenter: WeatherPresenterProtocol {
    
    var view: WeatherViewControllerProtocol!
    var router: WeatherRouterProtocol!
    var interactor: MainInteractorProtocol!
    let weatherDTO: WeatherDTO!

    init (view: WeatherViewControllerProtocol, router: WeatherRouterProtocol, interactor: MainInteractorProtocol, weatherDTO: WeatherDTO) {
        (self.view, self.router, self.interactor, self.weatherDTO) = (view, router, interactor, weatherDTO)
    }

    func viewDidLoad() {
        self.setupUIView()
    }

    func viewWillAppear() {
    }
    
    func setupUIView() {
        self.view.setupUIFromPresenter(temperatureLabelText: weatherDTO.temperature ?? "", weatherImageViewImageName: weatherDTO.cloudsImageName ?? "", descriptionLabelText: weatherDTO.cloudConditions ?? "")
    }
    
    func navigationToCheckOtherCityFromPresenter() {
        DispatchQueue.main.async {
            self.router.navigationToCheckOtherCityFromRouter()
        }
    }

    func updateUIWithWeatherDTO (weatherDTO: WeatherDTO?) {
        self.view.setupUIFromPresenter(temperatureLabelText: weatherDTO?.temperature ?? "", weatherImageViewImageName: weatherDTO?.cloudsImageName ?? "", descriptionLabelText: weatherDTO?.cloudConditions ?? "")
    }

}

