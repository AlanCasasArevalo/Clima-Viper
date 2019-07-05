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
    
    init (webServiceAssembly: WebServiceAssembly) {
        self.webServiceAssembly = webServiceAssembly
    }
    
    func viewController() -> MainViewController {
        let viewController = MainViewController(nibName: NibName.mainViewController, bundle: nil)
        viewController.presenter = presenter(view: viewController)
        return viewController
    }
    
    func presenter (view: MainViewController) -> MainPresenterProtocol {
        let presenter = MainPresenter(view: view, router: router(), interactor: interactor())
        return presenter
    }
    
    func interactor () -> MainInteractorProtocol {
        let interactor = MainInteractor(provider: provider())
        return interactor
    }
    
    func router () -> MainRouterProtocol {
        let router = MainRouter()
        return router
    }
    
    func provider () -> Provider {
        let provider = Provider(webService: webServiceAssembly.webService)
        return provider
    }
}
