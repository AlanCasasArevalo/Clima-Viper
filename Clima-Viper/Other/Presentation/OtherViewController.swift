//
//  OtherViewController.swift
//  Clima-Viper
//
//  Created by Casa on 05/07/2019.
//  Copyright © 2019 Alan Casas. All rights reserved.
//

import UIKit

protocol OtherViewControllerProtocol {
    func setupUI (getNewCityButtonText: String, getNewCityTextFieldPlaceholderText: String)
    func popViewController ()
    func showCustomAlert (alertTitle: String, alertMessage: String, titleAction: String)
}

class OtherViewController: UIViewController, OtherViewControllerProtocol {

    var presenter: OtherPresenterProtocol?
    
    @IBOutlet weak var getNewCityButton: UIButton!
    @IBOutlet weak var getNewCityTextField: UITextField!
    var cityToSearch = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter?.viewDidLoad()
        initializeDelegates()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.presenter?.viewWillAppear()
        self.presenter?.setupUIView()
    }

    func setupUI(getNewCityButtonText: String, getNewCityTextFieldPlaceholderText: String) {
        self.getNewCityButton.setTitle(getNewCityButtonText, for: .normal)
        getNewCityTextField.placeholder = getNewCityTextFieldPlaceholderText
    }

    func initializeDelegates() {
        self.getNewCityTextField.delegate = self
    }

    @IBAction func getNewCityButton(_ sender: Any) {
        self.presenter?.selectNewPlaceToKnow(cityToCheck: cityToSearch)
    }

    func popViewController() {
        self.navigationController?.popViewController(animated: true)
    }

}

extension OtherViewController: UITextFieldDelegate {

    public func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        // Se ha pulsado para empezar a escribir
        print("")
        return true
    }

    public func textFieldDidBeginEditing(_ textField: UITextField) {
        // ha terminado el empezado a editar el textfield
        print("")
    }

    public func textFieldDidEndEditing(_ textField: UITextField) {

        print("")
    }

    public func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        // Se termino de editar
        print("")
        dismissKeyboard()

        if !textField.text!.isEmpty && textField.text != "" {
            cityToSearch = textField.text!
            self.getNewCityButton.isEnabled = true
        }
    }

    public func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        // Ha cambiado los caracteres que se presionaron
        print("")
        return true
    }

    public func textFieldShouldClear(_ textField: UITextField) -> Bool {
        print("")
        return true
    }

    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // Se ha presionado el boton de return

        dismissKeyboard()
        print("")
        return true
    }

    @objc func dismissKeyboard() {
        view.endEditing(true)
    }

}

extension OtherViewController {
    func showCustomAlert (alertTitle: String, alertMessage: String, titleAction: String) {
        let alertController = UIAlertController(title: alertTitle, message: alertMessage, preferredStyle: .alert)
        let okAction = UIAlertAction(title: titleAction, style: .default)
        alertController.addAction(okAction)
        self.present(alertController, animated: true)
    }
}
