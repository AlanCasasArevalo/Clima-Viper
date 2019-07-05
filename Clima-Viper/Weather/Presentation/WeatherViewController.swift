//
//  WeatherViewController.swift
//  Clima-Viper
//
//  Created by Casa on 05/07/2019.
//  Copyright © 2019 Alan Casas. All rights reserved.
//

import UIKit

protocol WeatherViewControllerProtocol {
    
}

class WeatherViewController: UIViewController, WeatherViewControllerProtocol {

    var presenter: WeatherPresenterProtocol?
    let weatherDTO: WeatherDTO!

    init(weatherDTO: WeatherDTO) {
        self.weatherDTO = weatherDTO
        super.init(nibName: nil, bundle: Bundle(for: type(of: self)))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title:title, style:.plain, target:nil, action:nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }

}
