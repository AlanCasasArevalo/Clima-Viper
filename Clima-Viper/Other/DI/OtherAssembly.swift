//
//  OtherAssembly.swift
//  Clima-Viper
//
//  Created by Casa on 05/07/2019.
//  Copyright © 2019 Alan Casas. All rights reserved.
//

import Foundation

class OtherAssembly {
    
    let webServiceAssembly: WebServiceAssembly

    init (webServiceAssembly: WebServiceAssembly) {
        (self.webServiceAssembly) = (webServiceAssembly)
    }
    
    func view () -> OtherViewController {
        let view = OtherViewController(nibName: NibName.otherViewController, bundle: nil)
        view.presenter = presenter(view: view)
        return view
    }
    
    
    func presenter(view: OtherViewControllerProtocol) -> OtherPresenterProtocol {
        let presenter = OtherPresenter(view: view, router: router(), interactor: interactor())
        return presenter
    }
    
    func router() -> OtherRouterProtocol {
        let router = OtherRouter()
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






