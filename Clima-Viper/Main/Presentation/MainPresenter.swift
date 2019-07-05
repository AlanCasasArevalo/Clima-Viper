//
//  MainPresenter.swift
//  Clima-Viper
//
//  Created by Casa on 05/07/2019.
//  Copyright © 2019 Alan Casas. All rights reserved.
//

import Foundation

protocol MainPresenterProtocol {
    func viewDidLoad()
    func viewWillAppear()
    func fetchWeatherFromPresenter(cityToQuery: String)
    func setupUIView ()
}

class MainPresenter: MainPresenterProtocol {
    
    var view: MainViewControllerProtocol!
    var router: MainRouterProtocol!
    var interactor: MainInteractorProtocol!
    
    init (view: MainViewControllerProtocol, router: MainRouterProtocol, interactor: MainInteractorProtocol) {
        (self.view, self.router, self.interactor) = (view, router, interactor)
    }
    
    func viewDidLoad() {
        
    }
    
    func viewWillAppear() {
        setupUIView()
    }

    
    func setupUIView() {
        let titleWelcomeLabelText = MainConstants.kTitleWelcomeLabelText
        let startWelcomeButtonText = MainConstants.kTartWelcomeButtonText
        self.view.setupUIFromPresenter(titleWelcomeLabelText: titleWelcomeLabelText, startWelcomeButtonText: startWelcomeButtonText)
    }

    func fetchWeatherFromPresenter(cityToQuery: String){
        interactor.fetchWeatherFromInteractor(cityToQuery: cityToQuery, success: { (weatherEntity) in
            
            let defaultDTO = self.interactor.defaultWeatherDTO()
            let weatherDTO = self.interactor.formatWeatherEntityIntoWeatherDTO(weatherEntity: weatherEntity)
            
            DispatchQueue.main.async {
                self.router.navigationToWeatherScene(weatherDTO: weatherDTO ?? defaultDTO)
            }
        }) { (error) in
            print(error)
        }
    }
}
