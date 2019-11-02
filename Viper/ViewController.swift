//
//  ViewController.swift
//  Viper
//
//  Created by Юрий Нориков on 31.10.2019.
//  Copyright © 2019 norikoff. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let imageView:UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .red
        return imageView
    }()
    var viewButton:UIButton? = nil
    var downloadButton:UIButton? = nil
    var clearImageButton:UIButton? = nil
    var clearCacheButton:UIButton? = nil
    
    var presentor:ViewToPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Image shower"
        view.backgroundColor = .white
        imageView.frame = CGRect(x: 0.0, y: 0.0, width: view.frame.width, height: view.frame.height/2)
        viewButton = ButtonFactory.createCustomButton(lable: "Show image", y: imageView.frame.height+10)
        downloadButton = ButtonFactory.createCustomButton(lable: "Download image", y: imageView.frame.height+viewButton!.frame.height+10)
        clearImageButton = ButtonFactory.createCustomButton(lable: "Clear image", y: downloadButton!.frame.height+imageView.frame.height+viewButton!.frame.height+10)
        clearCacheButton = ButtonFactory.createCustomButton(lable: "Clear cache", y: downloadButton!.frame.height+clearImageButton!.frame.height+imageView.frame.height+viewButton!.frame.height+10)
        
        viewButton!.addTarget(self, action: #selector(viewButtonAction), for: .touchUpInside)
        downloadButton!.addTarget(self, action: #selector(downloadButtonAction), for: .touchUpInside)
        clearImageButton!.addTarget(self, action: #selector(clearButtonAction), for: .touchUpInside)
        clearCacheButton!.addTarget(self, action: #selector(clearCacheButtonAction), for: .touchUpInside)
        
        view.addSubview(imageView)
        view.addSubview(viewButton!)
        view.addSubview(downloadButton!)
        view.addSubview(clearImageButton!)
        view.addSubview(clearCacheButton!)
        // Do any additional setup after loading the view.
    }
    
    @objc func viewButtonAction() {
        presentor?.getImage()
    }
    
    @objc func downloadButtonAction() {
        presentor?.fetchingImage()
    }
    
    @objc func clearButtonAction() {
//        presentor?.clear()
        imageView.image = nil
    }
    
    @objc func clearCacheButtonAction() {
        presentor?.clear()
        imageView.image = nil
    }
    
    func showImage(image: UIImage) {
        self.imageView.image = image
        
    }
}


extension ViewController:PresenterToViewProtocol{
    
    func showError() {
        let alert = UIAlertController(title: "Alert", message: "Problem Fetching Image", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Okay", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
        
    }
    
    
}

