//
//  LocationModel.swift
//  CadburyFlake
//
//  Created by Claudio Cavalli on 10/12/2019.
//  Copyright © 2019 Claudio Cavalli. All rights reserved.
//

import Foundation
import CoreLocation

// MARK: Azioni per il location model
protocol LocationModelDelegate: MapViewModel {
    func createAlertAuthorization(title: String, message: String)
    func permissionAuthorized()
}

class LocationModel: NSObject, CLLocationManagerDelegate {
    
    private var locationModelDelegate: LocationModelDelegate?
    
    init(locationModelDelegate: LocationModelDelegate) {
        super.init()
        self.locationModelDelegate = locationModelDelegate
        self.setupLocationPermission()
    }
    
    func setupLocationPermission() {
        if CLLocationManager.locationServicesEnabled() {
            switch CLLocationManager.authorizationStatus() {
            case .notDetermined:
                CLLocationManager().requestAlwaysAuthorization()
            case .restricted, .denied:
                let message = ["MainPro necessita della tua posizione.",
                               "Abilita i  servizi di localizzazione nelle impostazioni."]
                self.locationModelDelegate?.createAlertAuthorization(title: "Concedi l'accesso alla posizione", message: message.joined())
            case .authorizedWhenInUse, .authorizedAlways:
                self.locationModelDelegate?.permissionAuthorized()
                break
            default: break
            }
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedAlways || status == .authorizedWhenInUse {
            self.locationModelDelegate?.permissionAuthorized()
        }
    }
    
}
