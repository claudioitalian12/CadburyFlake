//
//  ViewController.swift
//  CadburyFlake
//
//  Created by Claudio Cavalli on 10/12/2019.
//  Copyright © 2019 Claudio Cavalli. All rights reserved.
//

import UIKit
import MapKit
import RxSwift
import PinLayout

class MapVC: UIViewController {
    
    private var viewModel: MapViewModel?
    private let disposeBag = DisposeBag()
    private var mapView: MKMapView?
    private var trackingUserButton: UIButton?
    private var settingButton: UIButton?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = MapViewModel(viewController: self)
    }
    
    override func viewDidLayoutSubviews() {
        guard let mapView = self.mapView else { return }
        guard let trackingUserButton = self.trackingUserButton else { return }
       // guard let settingButton = self.settingButton else { return }
        mapView.pin.all()
        trackingUserButton.pin.width(10%).height(5%).top(20%).right(5%)
        // settingButton.pin.width(10%).height(5%).top(10%).right(5%)
    }
    
    func setViewModel(mapViewModel: MapViewModel) {
        self.viewModel = mapViewModel
    }
    
    func setSettingsViewButton(settingsButton: UIButton) {
        self.settingButton = settingsButton
        self.view.addSubview(self.settingButton!)
    }
    
    func setTrackingUserButton(trackingUserButton: UIButton) {
        self.trackingUserButton = trackingUserButton
        self.view.addSubview(self.trackingUserButton!)
    }
    
    func setMapView(mapView: MKMapView) {
        self.mapView = mapView
        self.view.addSubview(self.mapView!)
    }
}
