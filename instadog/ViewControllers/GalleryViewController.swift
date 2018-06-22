//
//  GalleryViewController.swift
//  instadog
//
//  Created by Thiago Ferrão on 22/06/18.
//  Copyright © 2018 Thiago Ferrão. All rights reserved.
//

import UIKit

class GalleryViewController: UIViewController {
    
    var eventHandler: GalleryViewHandlerInterface?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        eventHandler = GalleryPresenter(userInterface: self)
        eventHandler?.viewDidLoad()
    }
}


// MARK: GalleryViewInterface

extension GalleryViewController: GalleryViewInterface {
    
}
