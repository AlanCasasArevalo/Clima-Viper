//
//  MainPresenter.swift
//  Clima-Viper
//
//  Created by Casa on 05/07/2019.
//  Copyright © 2019 Alan Casas. All rights reserved.
//

import Foundation

protocol MainPresenterProtocol {
    
}

class MainPresenter: MainPresenterProtocol {
    
    var view: MainViewControllerProtocol!
    var router: MainRouterProtocol!
    var interactor: MainInteractorProtocol!
    
    init (view: MainViewControllerProtocol, router: MainRouterProtocol, interactor: MainInteractorProtocol) {
        (self.view, self.router, self.interactor) = (view, router, interactor)
    }

}
