//
//  MainViewController.swift
//  Clima-Viper
//
//  Created by Casa on 05/07/2019.
//  Copyright © 2019 Alan Casas. All rights reserved.
//

import UIKit

protocol MainViewControllerProtocol {
    func navigationToWeather(destinationVC: UIViewController)
    func setupUIFromPresenter (titleWelcomeLabelText: String, startWelcomeButtonText: String)
}

class MainViewController: UIViewController, MainViewControllerProtocol {

    @IBOutlet weak var titleWelcomeLabel: UILabel!
    @IBOutlet weak var startWelcomeButton: UIButton!
    
    var presenter: MainPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter?.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.presenter?.viewWillAppear()
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title:title, style:.plain, target:nil, action:nil)
    }

    func setupUIFromPresenter(titleWelcomeLabelText: String, startWelcomeButtonText: String) {
        titleWelcomeLabel.text = titleWelcomeLabelText
        startWelcomeButton.setTitle( startWelcomeButtonText, for: .normal)
    }
    
    func navigationToWeather(destinationVC: UIViewController){
        self.navigationController?.pushViewController(destinationVC, animated: true)
    }
    
    @IBAction func startWelcomeButton(_ sender: Any) {
        presenter?.fetchWeatherFromPresenter(cityToQuery: "Madrid")
    }
}
