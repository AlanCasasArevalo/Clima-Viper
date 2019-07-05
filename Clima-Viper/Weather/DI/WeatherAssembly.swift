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
    let otherAssembly: OtherAssembly
    
    init (webServiceAssembly: WebServiceAssembly, otherAssembly: OtherAssembly) {
        (self.webServiceAssembly, self.otherAssembly) = (webServiceAssembly, otherAssembly)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func viewController (weatherDTO: WeatherDTO) -> WeatherViewController {
        let view = WeatherViewController(weatherDTO: weatherDTO)
        view.presenter = presenter(view: view, weatherDTO: weatherDTO)
        return view
    }
    
    private func presenter(view: WeatherViewController, weatherDTO: WeatherDTO) -> WeatherPresenterProtocol {
        let presenter = WeatherPresenter(view: view, router: router(view: view), interactor: interactor(), weatherDTO: weatherDTO)
        return presenter
    }
    
    private func router(view: WeatherViewController) -> WeatherRouterProtocol {
        let router = WeatherRouter(otherAssembly: otherAssembly, view: view )
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
