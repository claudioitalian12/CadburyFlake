//
//  ViewControllerViewModel.swift
//  CadburyFlake
//
//  Created by Claudio Cavalli on 10/12/2019.
//  Copyright © 2019 Claudio Cavalli. All rights reserved.
//

import UIKit
import MapKit
import RxSwift
import RxCocoa

protocol ViewControllerDelegate: SignInViewController {
    func setMapView(mapView: MKMapView)
    func createAlertAuthorization(title: String, message: String)
}

class SignInViewModel: MapModelViewModelDelegate, LocationModelDelegate {
    let didSignIn = PublishSubject<Void>()
    let disposeBag = DisposeBag()
    private var mapModel: MapModel?
    private var locationModel: LocationModel?
    private var setMapView: ViewControllerDelegate?

    init() {
    }
    
    init(viewController: ViewControllerDelegate) {
        self.setMapView = viewController
        setLocationModel()
    }
    
    private func setMapModel() {
        self.mapModel = MapModel(model: self)
    }
    
    private func setLocationModel() {
           self.locationModel = LocationModel(locationModelDelegate: self)
    }
    
    func setMapView(mapView: MKMapView) {
        self.setMapView!.setMapView(mapView: mapView)
    }
    
    func createAlertAuthorization(title: String, message: String) {
        self.setMapView!.createAlertAuthorization(title: title, message: message)
    }
    
    func permissionAuthorized() {
        self.setMapModel()
    }
}
