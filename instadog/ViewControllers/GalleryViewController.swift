//
//  GalleryViewController.swift
//  instadog
//
//  Created by Thiago Ferrão on 22/06/18.
//  Copyright © 2018 Thiago Ferrão. All rights reserved.
//

import UIKit

class GalleryViewController: UIViewController {
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    
    @IBAction func segmentedControlValueChanged() {
        
    }
    
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


// MARK: UICollectionViewDataSource

extension GalleryViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return UICollectionViewCell()
    }
}


// MARK: UICollectionViewDelegate

extension GalleryViewController: UICollectionViewDelegate {
    
}
