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

}

class OtherPresenter: OtherPresenterProtocol {
    
    var view: OtherViewControllerProtocol!
    var router: OtherRouterProtocol!
    var interactor: MainInteractorProtocol!

    init (view: OtherViewControllerProtocol, router: OtherRouterProtocol, interactor: MainInteractorProtocol) {
        (self.view, self.router, self.interactor) = (view, router, interactor)
    }
    
    func viewDidLoad() {
        
    }
    
    func viewWillAppear() {
        self.setupUIView()
    }
    
    func setupUIView() {
    }

    
}
