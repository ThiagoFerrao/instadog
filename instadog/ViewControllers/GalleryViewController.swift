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
    
    
    // MARK: SEGUE
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case Constants.SEGUE_IDENTIFIER.TO_PHOTO:
            let tuple = sender as? (String?, String?)
            let photoVC = segue.destination as? PhotoViewController
            
            photoVC?.dogBreed = tuple?.0
            photoVC?.dogPhoto = tuple?.1
            
        default:
            return
        }
    }
}


// MARK: GalleryViewInterface

extension GalleryViewController: GalleryViewInterface {
    func setupContent() {
        collectionView.contentInset = UIEdgeInsets(top: 70, left: 0, bottom: 0, right: 0)
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
    
    func presentPhotoScreen(send sendData: (String?, String?)) {
        performSegue(withIdentifier: Constants.SEGUE_IDENTIFIER.TO_PHOTO, sender: sendData)
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
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.REUSABLE_IDENTIFIER.GALLERY_CELL, for: indexPath) as! GalleryCollectionViewCell
        cell.imageUrlString = galleryData[currentSegmentTitleSelected?.lowercased() ?? ""]?[indexPath.row]
        
        return cell
    }
}


// MARK: UICollectionViewDelegateFlowLayout

extension GalleryViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width / 3, height: view.frame.width / 3)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        eventHandler?.dogPhotoSelected(category: currentSegmentTitleSelected, photo: galleryData[currentSegmentTitleSelected?.lowercased() ?? ""]?[indexPath.row])
    }
}
