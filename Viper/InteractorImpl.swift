//
//  InteractorImpl.swift
//  Viper
//
//  Created by Юрий Нориков on 02.11.2019.
//  Copyright © 2019 norikoff. All rights reserved.
//


import Foundation
import UIKit


class NoticeInteractor: PresenterToInteractorProtocol{
    var presenter: InteractorToPresenterProtocol?
    var image:UIImage?
    
    func clearCache() {
        image = nil
    }
    
    func getImageOrDownload() {
        if image == nil{
            presenter?.noticeFetchFailed()
        }else{
            presenter?.noticeFetchedSuccess(image: image!)
        }
    }
    
    func fetchImage(completion: @escaping (UIImage?, Error?) -> Void) {
        guard let url = URL(string:"http://tubesetfonds.t.u.pic.centerblog.net/oiseau19.png") else { return }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let currentError = error {
                completion(nil, currentError)
                return
            }
            
            guard let currentData = data else { return }
            let image = UIImage(data: currentData)
            self.image = image
            completion(image, nil)
        }
        
        task.resume()
    }
}
