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
        if (checkIfGalleryDataIsAvailable()) {
            collectionView.reloadData()
            return
        }
        
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
    
    
    // MARK: Private Methods
    
    private func checkIfGalleryDataIsAvailable() -> Bool {
        return galleryData[currentSegmentTitleSelected?.lowercased() ?? ""] != nil
    }
}


// MARK: GalleryViewInterface

extension GalleryViewController: GalleryViewInterface {
    func setupContent() {
        if (checkIfGalleryDataIsAvailable()) {
            collectionView.reloadData()
            return
        }
        
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
    
    func updateGalleryData(_ newGalleryData: [String : [String]]) {
        galleryData.merge(newGalleryData) { (_, new) in new }
        collectionView.reloadData()
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
        guard let segmentTitle = currentSegmentTitleSelected?.lowercased(), let dogPhotoList = galleryData[segmentTitle] else {
            return 0
        }
        
        return dogPhotoList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.REUSABLE_IDENTIFIER.GALLERY_CELL, for: indexPath)
        
        return cell
    }
}


// MARK: UICollectionViewDelegate

extension GalleryViewController: UICollectionViewDelegate {
    
}
