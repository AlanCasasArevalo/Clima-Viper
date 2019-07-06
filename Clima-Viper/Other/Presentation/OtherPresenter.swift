//
//  OtherPresenter.swift
//  Clima-Viper
//
//  Created by Casa on 05/07/2019.
//  Copyright © 2019 Alan Casas. All rights reserved.
//

import Foundation

protocol OtherPresenterProtocol {
    func viewDidLoad()
    func viewWillAppear()
    func selectNewPlaceToKnow(cityToCheck: String)
}

protocol SelectedNewPlaceToKnowDelegate {
    func updateWeatherDTO (weatherDTO: WeatherDTO?)
}

class OtherPresenter: NSObject, OtherPresenterProtocol {
    
    var view: OtherViewControllerProtocol!
    var router: OtherRouterProtocol!
    var interactor: MainInteractorProtocol!

    var delegate: SelectedNewPlaceToKnowDelegate?

    init (view: OtherViewControllerProtocol, router: OtherRouterProtocol, interactor: MainInteractorProtocol) {
        (self.view, self.router, self.interactor) = (view, router, interactor)
    }
    
    func viewDidLoad() {
    }
    
    func viewWillAppear() {
        self.setupUIView()
    }

    func setupUIView() {
        self.view.setupUI(getNewCityButtonText: OtherPlaceConstants.kGetNewCityButtonText, getNewCityTextFieldPlaceholderText: OtherPlaceConstants.kTextFieldPlaceholderText)
    }

    func selectNewPlaceToKnow(cityToCheck: String) {
        interactor.fetchWeatherFromInteractor(cityToQuery: cityToCheck, success: { weatherEntity in

            let defaultDTO = self.interactor.defaultWeatherDTO()
            let weatherDTO = self.interactor.formatWeatherEntityIntoWeatherDTO(weatherEntity: weatherEntity)

            DispatchQueue.main.async {
                self.delegate?.updateWeatherDTO(weatherDTO: weatherDTO ?? defaultDTO)
                self.view.popViewController()
            }

        }, failure: { error in
            print(error)

        })
    }
}
