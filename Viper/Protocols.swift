//
//  Protocols.swift
//  Viper
//
//  Created by Юрий Нориков on 02.11.2019.
//  Copyright © 2019 norikoff. All rights reserved.
//

import Foundation
import UIKit

protocol ViewToPresenterProtocol: class{
    
    var view: PresenterToViewProtocol? {get set}
    var interactor: PresenterToInteractorProtocol? {get set}
    func fetchingImage()
    func clear()
    func getImage()
}

protocol PresenterToViewProtocol: class{
    func showImage(image: UIImage)
    func showError()
}

protocol PresenterToRouterProtocol: class {
    static func createModule()-> ViewController
}

protocol PresenterToInteractorProtocol: class {
    var presenter:InteractorToPresenterProtocol? {get set}
    func fetchImage(completion: @escaping (UIImage?, Error?) -> Void)
    func clearCache();
    func getImageOrDownload();
}

protocol InteractorToPresenterProtocol: class {
    func noticeFetchedSuccess(image:UIImage)
    func noticeFetchFailed()
}
