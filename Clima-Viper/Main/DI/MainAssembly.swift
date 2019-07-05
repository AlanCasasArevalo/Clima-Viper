//
//  MainAssembly.swift
//  Clima-Viper
//
//  Created by Casa on 05/07/2019.
//  Copyright © 2019 Alan Casas. All rights reserved.
//

import Foundation

final public class MainAssembly {
    
    let webServiceAssembly: WebServiceAssembly
    let weatherAssembly: WeatherAssembly
    
    init (webServiceAssembly: WebServiceAssembly, weatherAssembly: WeatherAssembly) {
        (self.webServiceAssembly, self.weatherAssembly) = (webServiceAssembly, weatherAssembly)
    }
    
    func viewController() -> MainViewController {
        let viewController = MainViewController(nibName: NibName.mainViewController, bundle: nil)
        viewController.presenter = presenter(view: viewController)
        return viewController
    }
    
    func presenter (view: MainViewController) -> MainPresenterProtocol {
        let presenter = MainPresenter(view: view, router: router(view: view), interactor: interactor())
        return presenter
    }
    
    func interactor () -> MainInteractorProtocol {
        let interactor = MainInteractor(provider: provider())
        return interactor
    }
    
    func router (view: MainViewController) -> MainRouterProtocol {
        let router = MainRouter(weatherAssembly: weatherAssembly, view: view)
        return router
    }
    
    func provider () -> Provider {
        let provider = Provider(webService: webServiceAssembly.webService)
        return provider
    }
}
