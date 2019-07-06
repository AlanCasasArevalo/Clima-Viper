//
//  WeatherViewController.swift
//  Clima-Viper
//
//  Created by Casa on 05/07/2019.
//  Copyright © 2019 Alan Casas. All rights reserved.
//

import UIKit

protocol WeatherViewControllerProtocol {
    func setupUIFromPresenter (temperatureLabelText: String, weatherImageViewImageName: String, descriptionLabelText: String)
    func navigationToOtherVC(destinationVC: UIViewController)
}

class WeatherViewController: UIViewController, WeatherViewControllerProtocol {
    
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var weatherImageView: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    
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
        self.presenter?.viewDidLoad()
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title:title, style:.plain, target:nil, action:nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.presenter?.viewWillAppear()
    }

    func setupUIFromPresenter (temperatureLabelText: String, weatherImageViewImageName: String, descriptionLabelText: String) {
        temperatureLabel.text = temperatureLabelText
        weatherImageView.image = UIImage(named: weatherImageViewImageName)
        descriptionLabel.text = descriptionLabelText
    }
    
    func navigationToOtherVC(destinationVC: UIViewController) {
        self.navigationController?.pushViewController(destinationVC, animated: true)
    }

    @IBAction func checkOtherCityButton(_ sender: Any) {
        self.presenter?.navigationToCheckOtherCityFromPresenter()
    }

}

extension WeatherViewController: SelectedNewPlaceToKnowDelegate {
    func updateWeatherDTO(weatherDTO: WeatherDTO?) {
        self.presenter?.updateUIWithWeatherDTO(weatherDTO: weatherDTO)
    }
}