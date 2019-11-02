//
//  PresenterImpl.swift
//  Viper
//
//  Created by Юрий Нориков on 02.11.2019.
//  Copyright © 2019 norikoff. All rights reserved.
//


import Foundation
import UIKit

class NoticePresenter:ViewToPresenterProtocol {
    
    var view: PresenterToViewProtocol?
    
    var interactor: PresenterToInteractorProtocol?
    
    func getImage() {
        interactor?.getImageOrDownload()
    }
    
    func fetchingImage() {
        interactor?.fetchImage { image, error in
            DispatchQueue.main.async {
                if error != nil{
                    self.noticeFetchFailed()
                    return
                }
                self.noticeFetchedSuccess(image: image!)
            }
        }
    }
    
    func clear() {
        interactor?.clearCache()
    }
    
    
}

extension NoticePresenter: InteractorToPresenterProtocol{
    
    func noticeFetchedSuccess(image:UIImage) {
        view?.showImage(image: image)
    }
    
    func noticeFetchFailed() {
        view?.showError()
    }
    
    
}
