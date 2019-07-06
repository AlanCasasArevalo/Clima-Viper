//
//  MainPresenter.swift
//  Clima-Viper
//
//  Created by Casa on 05/07/2019.
//  Copyright © 2019 Alan Casas. All rights reserved.
//

import Foundation
import CoreLocation

protocol MainPresenterProtocol {
    func viewDidLoad()
    func viewWillAppear()
    func fetchWeatherFromPresenter(cityToQuery: String)
    func setupUIView ()
    func navigationToWeather()
}

class MainPresenter: NSObject, MainPresenterProtocol {
    
    var view: MainViewControllerProtocol!
    var router: MainRouterProtocol!
    var interactor: MainInteractorProtocol!

    var locationManager = CLLocationManager()
    let geoCoder = CLGeocoder()


    init (view: MainViewControllerProtocol, router: MainRouterProtocol, interactor: MainInteractorProtocol) {
        (self.view, self.router, self.interactor) = (view, router, interactor)
    }
    
    func viewDidLoad() {
        setLocationManager()
    }
    
    func viewWillAppear() {
        setupUIView()
    }

    func initialDelegates () {
        locationManager.delegate = self
    }

    func setLocationManager () {
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.startMonitoringSignificantLocationChanges()
    }

    func navigationToWeather(){
        if let location = locationManager.location {
            self.reverseGeocodeLocation(location: location)
        } else {
            self.view?.showLocationAlert()
        }
    }

    func setupUIView() {
        let titleWelcomeLabelText = MainConstants.kTitleWelcomeLabelText
        let startWelcomeButtonText = MainConstants.kTartWelcomeButtonText
        self.view.setupUIFromPresenter(titleWelcomeLabelText: titleWelcomeLabelText, startWelcomeButtonText: startWelcomeButtonText)
    }

    func fetchWeatherFromPresenter(cityToQuery: String){
        interactor.fetchWeatherFromInteractor(cityToQuery: cityToQuery, success: { (weatherEntity) in
            
            let defaultDTO = self.interactor.defaultWeatherDTO()
            let weatherDTO = self.interactor.formatWeatherEntityIntoWeatherDTO(weatherEntity: weatherEntity)
            
            DispatchQueue.main.async {
                self.router.navigationToWeatherScene(weatherDTO: weatherDTO ?? defaultDTO)
            }
        }) { (error) in
            print(error)
        }
    }
}

extension MainPresenter: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]){
        let location = locations.last
        self.locationManager.stopUpdatingLocation()
    }
    func locationManager(_ manager: CLLocationManager, didUpdateHeading newHeading: CLHeading){

    }

    func locationManagerShouldDisplayHeadingCalibration(_ manager: CLLocationManager) -> Bool{
        return true
    }

    func locationManager(_ manager: CLLocationManager, didDetermineState state: CLRegionState, for region: CLRegion){

    }

    func locationManager(_ manager: CLLocationManager, didRangeBeacons beacons: [CLBeacon], in region: CLBeaconRegion){

    }

    func locationManager(_ manager: CLLocationManager, rangingBeaconsDidFailFor region: CLBeaconRegion, withError error: Error){

    }

    func locationManager(_ manager: CLLocationManager, didEnterRegion region: CLRegion){

    }

    func locationManager(_ manager: CLLocationManager, didExitRegion region: CLRegion){

    }

    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error){

    }

    func locationManager(_ manager: CLLocationManager, monitoringDidFailFor region: CLRegion?, withError error: Error){

    }

    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus){
        if CLLocationManager.authorizationStatus() == .notDetermined{
            locationManager.requestWhenInUseAuthorization()
            locationManager.startUpdatingLocation()
        }else if  CLLocationManager.authorizationStatus() == .denied {
            self.view?.showLocationAlert()
        }else if CLLocationManager.authorizationStatus() == .authorizedAlways{
            locationManager.startUpdatingLocation()
        } else {
            locationManager.requestWhenInUseAuthorization()
            locationManager.startUpdatingLocation()
        }

    }

    func locationManager(_ manager: CLLocationManager, didStartMonitoringFor region: CLRegion){

    }

    func locationManagerDidPauseLocationUpdates(_ manager: CLLocationManager){

    }

    func locationManagerDidResumeLocationUpdates(_ manager: CLLocationManager){

    }

    func locationManager(_ manager: CLLocationManager, didFinishDeferredUpdatesWithError error: Error?){

    }

    func locationManager(_ manager: CLLocationManager, didVisit visit: CLVisit){

    }

}

extension MainPresenter {
    func reverseGeocodeLocation (location: CLLocation) {
        geoCoder.reverseGeocodeLocation(location) { placemarks, _ in
            if let place = placemarks?.first {
                self.fetchWeatherFromPresenter(cityToQuery: place.locality ?? MainConstants.kDefaultLocationToCheckWeatherApi)
            }
        }
    }
}
