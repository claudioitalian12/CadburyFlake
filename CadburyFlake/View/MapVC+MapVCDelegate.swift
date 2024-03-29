//
//  VC+AlertAuthorization.swift
//  CadburyFlake
//
//  Created by Claudio Cavalli on 10/12/2019.
//  Copyright © 2019 Claudio Cavalli. All rights reserved.
//

import UIKit
import MapKit

extension MapVC: MapVCDelegate {
    
    func createAlertAuthorization(title: String, message: String) {
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Settings",
                                      style: UIAlertAction.Style.default,
                                      handler: { _ in
                                        guard let settingsUrl = URL(
                                            string: UIApplication.openSettingsURLString)
                                            else { return }
                                        guard UIApplication.shared.canOpenURL(settingsUrl) else { return }
                                        UIApplication.shared.open(settingsUrl, completionHandler: { (success) in
                                            print("Settings opened: \(success)")
                                        })
        }))
        alert.addAction(UIAlertAction(title: "Ok",
                                      style: .default,
                                      handler: nil))
        
        present(alert, animated: true, completion: nil)
    }
}
