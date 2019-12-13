//
//  TrackingButton.swift
//  CadburyFlake
//
//  Created by Claudio Cavalli on 13/12/2019.
//  Copyright © 2019 Claudio Cavalli. All rights reserved.
//

import UIKit
import PinLayout
import RxSwift

protocol TrackingButtonDelegate: MapModel {
    func trackingUser()
}

protocol TrackingButtonViewDelegate: MapViewModel {
    func setTrackingUserButton(trackingUserButton: UIButton)
}

class TrackingUserButton: NSObject {
    
    private let disposeBag = DisposeBag()
    private var trackingUserButton: UIButton?
    private var trackingUserButtonDelegate: TrackingButtonDelegate?
    private var trackingButtonViewDelegate: TrackingButtonViewDelegate?
    
    init(trackingButtonDelegate: TrackingButtonDelegate, trackingButtonViewDelegate: TrackingButtonViewDelegate) {
        super.init()
        trackingUserButton = UIButton()
        trackingUserButton?.isUserInteractionEnabled = true
        trackingUserButton?.backgroundColor = .white
        trackingUserButton?.layer.masksToBounds = false
        trackingUserButton?.imageEdgeInsets = UIEdgeInsets(top: 10, left: 8, bottom: 8, right: 10)
        trackingUserButton?.layer.cornerRadius = 6
        trackingUserButton?.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        trackingUserButton?.setImage(UIImage(named: "navigation"), for: .normal)
        trackingUserButton?.imageView?.contentMode = .scaleAspectFit
        trackingUserButton?.rx.tap
            .bind { self.centerMapOnUser() }
         .disposed(by: self.disposeBag)
        self.setTrackingUserButton(trackingUserButton: trackingButtonDelegate)
        self.setTrackingUserViewButton(trackingUserViewButton: trackingButtonViewDelegate)
    }

    private func centerMapOnUser() {
        trackingUserButtonDelegate?.trackingUser()
    }
    
    private func setTrackingUserButton(trackingUserButton: TrackingButtonDelegate) {
        self.trackingUserButtonDelegate = trackingUserButton
    }
    
    private func setTrackingUserViewButton(trackingUserViewButton: TrackingButtonViewDelegate) {
        self.trackingButtonViewDelegate = trackingUserViewButton
        trackingButtonViewDelegate?.setTrackingUserButton(trackingUserButton: self.trackingUserButton!)
    }
}
