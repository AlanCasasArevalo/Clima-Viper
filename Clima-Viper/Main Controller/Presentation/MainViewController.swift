//
//  MainViewController.swift
//  Clima-Viper
//
//  Created by Casa on 05/07/2019.
//  Copyright © 2019 Alan Casas. All rights reserved.
//

import UIKit

protocol MainViewControllerProtocol {
    func setupUIFromPresenter (titleWelcomeLabelText: String, startWelcomeButtonText: String)
}

class MainViewController: UIViewController, MainViewControllerProtocol {

    @IBOutlet weak var titleWelcomeLabel: UILabel!
    @IBOutlet weak var startWelcomeButton: UIButton!
    
    var presenter: MainPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter?.viewDidLoad()
        presenter?.fetchWeatherFromPresenter(cityToQuery: "Madrid")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.presenter?.viewWillAppear()
    }

    func setupUIFromPresenter(titleWelcomeLabelText: String, startWelcomeButtonText: String) {
        titleWelcomeLabel.text = titleWelcomeLabelText
        startWelcomeButton.setTitle( startWelcomeButtonText, for: .normal)
    }
    
    @IBAction func startWelcomeButton(_ sender: Any) {
    }
    
    
}
