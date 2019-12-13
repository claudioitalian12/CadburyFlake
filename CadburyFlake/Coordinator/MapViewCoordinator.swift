//
//  SingInCoordinator.swift
//  CadburyFlake
//
//  Created by Claudio Cavalli on 10/12/2019.
//  Copyright © 2019 Claudio Cavalli. All rights reserved.
//
import RxSwift

class MapViewCoordinator: BaseCoordinator {
    
    private let disposeBag = DisposeBag()
    
    override func start() {
        let viewController = MapVC()
        let mapViewModel = MapViewModel()
        viewController.viewModel = mapViewModel
        mapViewModel.didSettings
            .subscribe(onNext: { [weak self] in
                guard let `self` = self else { return }
                self.navigationController.viewControllers = []
                self.parentCoordinator?.didFinish(coordinator: self)
                (self.parentCoordinator as? SettingsListener)?.didSettings()
            })
            .disposed(by: self.disposeBag)
        self.navigationController.viewControllers = [viewController]
    }
}
