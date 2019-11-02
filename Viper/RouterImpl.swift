//
//  RouterImpl.swift
//  Viper
//
//  Created by Юрий Нориков on 02.11.2019.
//  Copyright © 2019 norikoff. All rights reserved.
//

import Foundation
import UIKit

class NoticeRouter:PresenterToRouterProtocol{
    
    static func createModule() -> ViewController {
        
        let view = ViewController()
        
        let presenter: ViewToPresenterProtocol & InteractorToPresenterProtocol = NoticePresenter()
        let interactor: PresenterToInteractorProtocol = NoticeInteractor()
        
        view.presentor = presenter
        presenter.view = view
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        return view
        
    }
    

    
}
