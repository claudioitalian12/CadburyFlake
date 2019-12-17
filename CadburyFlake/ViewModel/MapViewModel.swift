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

// MARK: Vista del controller
protocol MapVCDelegate: MapVC {
    func setMapView(mapView: MKMapView)
    func setTrackingUserButton(trackingUserButton: UIButton)
    func setSettingsViewButton(settingsButton: UIButton)
    func createAlertAuthorization(title: String, message: String)
}

class MapViewModel: MapModelViewModelDelegate, LocationModelDelegate, TrackingButtonViewDelegate, SettingsButtonViewDelegate {
    
    let didSettings = PublishSubject<Void>()
    
    // MARK: Private property
    private let disposeBag = DisposeBag()
    private var mapModel: MapModel?
    private var locationModel: LocationModel?
    private var trackingUserButton: TrackingUserButton?
    private var settingsButton: SettingsButton?
    private var setMapView: MapVCDelegate?
    
    init() {
        
    }
    
    init(viewController: MapVCDelegate) {
        self.setMapView = viewController
        setLocationModel()
    }
    
    // MARK: Setting private method
    private func setSettingsB() {
        self.settingsButton = SettingsButton(settingsButtonViewDelegate: self)
    }
    
    private func setTrackingUserB() {
        self.trackingUserButton = TrackingUserButton(trackingButtonDelegate: self.mapModel!, trackingButtonViewDelegate: self)
    }
    
    private func setMapModel() {
        self.mapModel = MapModel(model: self)
    }
    
    private func setLocationModel() {
        self.locationModel = LocationModel(locationModelDelegate: self)
    }
    
    // MARK: Protocol method
    func setMapView(mapView: MKMapView) {
        self.setMapView!.setMapView(mapView: mapView)
    }
    
    func setDetailsView(annotationView: MKAnnotationView) {
        self.createAlertAuthorization(title: annotationView.description, message: annotationView.description)
    }
    
    func createAlertAuthorization(title: String, message: String) {
        self.setMapView!.createAlertAuthorization(title: title, message: message)
    }
    
    func setSettingsButtonView(setSettingsButtonView: UIButton) {
        self.setMapView!.setSettingsViewButton(settingsButton: setSettingsButtonView)
    }
    
    func setTrackingUserButton(trackingUserButton: UIButton) {
        self.setMapView?.setTrackingUserButton(trackingUserButton: trackingUserButton)
    }
    
    func permissionAuthorized() {
        self.setMapModel()
        self.setTrackingUserB()
        self.setSettingsB()
    }
}
