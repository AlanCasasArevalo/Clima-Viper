//
//  WeatherAssembly.swift
//  Clima-Viper
//
//  Created by Casa on 05/07/2019.
//  Copyright © 2019 Alan Casas. All rights reserved.
//

import UIKit

public final class WeatherAssembly {
    
    let webServiceAssembly: WebServiceAssembly
    
    init (webServiceAssembly: WebServiceAssembly) {
        (self.webServiceAssembly) = (webServiceAssembly)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func viewController (weatherDTO: WeatherDTO) -> UIViewController {
        let view = WeatherViewController(weatherDTO: weatherDTO)
        view.presenter = presenter(view: view, weatherDTO: weatherDTO)
        return view
    }
    
    private func presenter(view: WeatherViewControllerProtocol, weatherDTO: WeatherDTO) -> WeatherPresenterProtocol {
        let presenter = WeatherPresenter(view: view, router: router(), interactor: interactor(), weatherDTO: weatherDTO)
        return presenter
    }
    
    private func router() -> WeatherRouterProtocol {
        let router = WeatherRouter()
        return router
    }
    
    private func interactor () -> MainInteractorProtocol {
        let interactor = MainInteractor(provider: provider())
        return interactor
    }
    
    private func provider () -> Provider {
        let provider = Provider(webService: webServiceAssembly.webService)
        return provider
    }

}
