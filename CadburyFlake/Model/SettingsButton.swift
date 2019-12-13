//
//  SettingsButton.swift
//  CadburyFlake
//
//  Created by Claudio Cavalli on 13/12/2019.
//  Copyright © 2019 Claudio Cavalli. All rights reserved.
//

import UIKit
import RxSwift

protocol SettingsButtonViewDelegate: MapViewModel {
    func setSettingsButtonView(setSettingsButtonView: UIButton)
}

class SettingsButton: NSObject {
    
    private let disposeBag = DisposeBag()
    private var settingsButton: UIButton?
    private var settingsButtonViewDelegate: SettingsButtonViewDelegate?
    
    init(settingsButtonViewDelegate: SettingsButtonViewDelegate) {
        super.init()
        settingsButton = UIButton()
        settingsButton?.backgroundColor = .white
        settingsButton?.layer.masksToBounds = false
        settingsButton?.imageEdgeInsets = UIEdgeInsets(top: 7, left: 5, bottom: 5, right: 7)
        settingsButton?.layer.cornerRadius = 6
        settingsButton?.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        settingsButton?.setImage(UIImage(named: "Onboarding-0"), for: .normal)
        settingsButton?.imageView?.contentMode = .scaleAspectFit
        
        settingsButton?.rx.tap
         .bind { self.settingsController() }
         .disposed(by: self.disposeBag)
        self.setTrackingUserViewButton(settingsButtonViewDelegate: settingsButtonViewDelegate)
    }
    
    private func settingsController() {
        
    }
    
    private func setTrackingUserViewButton(settingsButtonViewDelegate: TrackingButtonViewDelegate) {
        self.settingsButtonViewDelegate = settingsButtonViewDelegate
        self.settingsButtonViewDelegate?.setTrackingUserButton(trackingUserButton: self.settingsButton!)
    }
}
