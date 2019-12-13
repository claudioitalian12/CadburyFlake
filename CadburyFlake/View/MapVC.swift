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
    
    private let disposeBag = DisposeBag()
    var viewModel: MapViewModel?
    var mapView: MKMapView?
    var trackingUserButton: UIButton?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = MapViewModel(viewController: self)
    }
    
    override func viewDidLayoutSubviews() {
        guard let mapView = self.mapView else { return }
        guard let trackingUserButton = self.trackingUserButton else { return }
        mapView.pin.all()
        trackingUserButton.pin.width(10%).height(5%).top(20%).right(5%)
    }
}
