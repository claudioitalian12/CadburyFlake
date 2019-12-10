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

class SignInViewController: UIViewController {
    private let disposeBag = DisposeBag()
    var viewModel: SignInViewModel?
    var mapView: MKMapView?
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = SignInViewModel(viewController: self)
    }
    override func viewDidLayoutSubviews() {
        guard let mapView = self.mapView else { return }
        mapView.pin.all()
    }
}
