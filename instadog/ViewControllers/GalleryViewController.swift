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
        eventHandler?.segmentWasChangedTo(currentSegmentIndexSelected, title: currentSegmentTitleSelected)
    }
    
    var eventHandler: GalleryViewHandlerInterface?
    var galleryData = [String : [String]]()
    var currentSegmentIndexSelected : Int {
        return segmentedControl.selectedSegmentIndex
    }
    var currentSegmentTitleSelected : String? {
        return segmentedControl.titleForSegment(at: currentSegmentIndexSelected)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        eventHandler = GalleryPresenter(userInterface: self)
        eventHandler?.viewDidLoad()
    }
}


// MARK: GalleryViewInterface

extension GalleryViewController: GalleryViewInterface {
    func setupContent() {
        eventHandler?.segmentWasChangedTo(currentSegmentIndexSelected, title: currentSegmentTitleSelected)
    }
    
    func showLoading() {
        loadingIndicator.isHidden = false
        collectionView.alpha = Constants.ALPHA.DISABLE
        view.isUserInteractionEnabled = false
    }
    
    func hideLoading() {
        loadingIndicator.isHidden = true
        collectionView.alpha = Constants.ALPHA.ENABLE
        view.isUserInteractionEnabled = true
    }
    
    func showAlert(_ alertController: UIAlertController) {
        present(alertController, animated: true, completion: nil)
    }
    
    func presentPhotoScreen() {
        
    }
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
