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

protocol MapVCDelegate: MapVC {
    func setMapView(mapView: MKMapView)
    func setTrackingUserButton(trackingUserButton: UIButton)
    func createAlertAuthorization(title: String, message: String)
}

class MapViewModel: MapModelViewModelDelegate, LocationModelDelegate, TrackingButtonViewDelegate {
       
    let didSettings = PublishSubject<Void>()
    let disposeBag = DisposeBag()
    private var mapModel: MapModel?
    private var locationModel: LocationModel?
    private var trackingUserButton: TrackingUserButton?
    private var setMapView: MapVCDelegate?
    
    init() {
    }
    
    init(viewController: MapVCDelegate) {
        self.setMapView = viewController
        setLocationModel()
    }
    
     func setTrackingUserButton(trackingUserButton: UIButton) {
        self.setMapView?.setTrackingUserButton(trackingUserButton: trackingUserButton)
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
    
    func setMapView(mapView: MKMapView) {
        self.setMapView!.setMapView(mapView: mapView)
    }
    
    func setDetailsView(annotationView: MKAnnotationView) {
        self.createAlertAuthorization(title: annotationView.description, message: annotationView.description)
    }
    
    func createAlertAuthorization(title: String, message: String) {
        self.setMapView!.createAlertAuthorization(title: title, message: message)
    }
    
    func permissionAuthorized() {
        self.setMapModel()
        self.setTrackingUserB()
    }
}