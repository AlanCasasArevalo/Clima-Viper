//
//  OtherViewController.swift
//  Clima-Viper
//
//  Created by Casa on 05/07/2019.
//  Copyright © 2019 Alan Casas. All rights reserved.
//

import UIKit

protocol OtherViewControllerProtocol {
    func navigationToOtherCityToCheck ()
}

class OtherViewController: UIViewController, OtherViewControllerProtocol {

    var presenter: OtherPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter?.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.presenter?.viewWillAppear()
    }
    
    func navigationToOtherCityToCheck () {
        
    }
}
