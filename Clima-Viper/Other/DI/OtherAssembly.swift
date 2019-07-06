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
    
    func view (delegate: SelectedNewPlaceToKnowDelegate) -> OtherViewController {
        let view = OtherViewController(nibName: NibName.otherViewController, bundle: nil)
        view.presenter = presenter(view: view, delegate: delegate)
        return view
    }

    func presenter(view: OtherViewController, delegate: SelectedNewPlaceToKnowDelegate) -> OtherPresenterProtocol {
        let presenter = OtherPresenter(view: view, router: router(), interactor: interactor())
        presenter.delegate = delegate
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






