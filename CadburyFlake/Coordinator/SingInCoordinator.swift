//
//  SingInCoordinator.swift
//  CadburyFlake
//
//  Created by Claudio Cavalli on 10/12/2019.
//  Copyright © 2019 Claudio Cavalli. All rights reserved.
//
import RxSwift

class SignInCoordinator: BaseCoordinator {
    
    private let disposeBag = DisposeBag()
    
    override func start() {
        let viewController = SignInViewController()
        // Now Coordinator initializes and injects viewModel
        let signInViewModel = SignInViewModel()
        viewController.viewModel = signInViewModel
        
        // Coordinator subscribes to events and notifies parentCoordinator
        signInViewModel.didSignIn
            .subscribe(onNext: { [weak self] in
                guard let `self` = self else { return }
                self.navigationController.viewControllers = []
                self.parentCoordinator?.didFinish(coordinator: self)
                (self.parentCoordinator as? SignInListener)?.didSignIn()
                
            })
            .disposed(by: self.disposeBag)
        
        self.navigationController.viewControllers = [viewController]
    }
}
