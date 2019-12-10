//
//  MapModel.swift
//  CadburyFlake
//
//  Created by Claudio Cavalli on 10/12/2019.
//  Copyright © 2019 Claudio Cavalli. All rights reserved.
//

import MapKit

protocol MapModelViewModelDelegate: SignInViewModel {
    func setMapView(mapView: MKMapView)
}

class MapModel: NSObject, MKMapViewDelegate {
    private var mapView: MKMapView?
    private var mapModelDelegate: MapModelViewModelDelegate?
    
    init(model: MapModelViewModelDelegate) {
       super.init()
       mapView = MKMapView()
       mapView?.delegate = self
       mapView?.userTrackingMode = MKUserTrackingMode.follow
       mapView?.userLocation.title = ""
       mapView?.isRotateEnabled = false
       mapView?.showsCompass = false
       setMapView(model: model)
    }

    private func setMapView(model: SignInViewModel) {
          mapModelDelegate = model
          mapModelDelegate?.setMapView(mapView: mapView!)
    }

    func mapView(_ mapView: MKMapView, didChange mode: MKUserTrackingMode, animated: Bool) {
             if CLLocationManager.authorizationStatus() != .denied {
                mapView.setUserTrackingMode(MKUserTrackingMode.follow, animated: true)
             }
    }
    func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
      
    }
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
    
    }
}
