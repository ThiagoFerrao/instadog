//
//  Constants.swift
//  instadog
//
//  Created by Thiago Ferrão on 22/06/18.
//  Copyright © 2018 Thiago Ferrão. All rights reserved.
//

import UIKit

struct Constants {
    
    struct URL {
        static let API = "https://iddog-api.now.sh"
    }
    
    struct PATH {
        static let SIGNUP = "/signup"
        static let FEED = "/feed"
    }
    
    struct KEYCHAIN {
        static let STORAGE = Bundle.main.bundleIdentifier! + ".keychain"
        static let USER_TOKEN = "userToken"
    }
    
    struct ALPHA {
        static let ENABLE : CGFloat = 1
        static let DISABLE : CGFloat = 0.6
    }
    
    struct SEGUE_IDENTIFIER {
        static let TO_GALLERY = "SegueToGalleryVC"
        static let TO_PHOTO = "SegueToPhotoVC"
    }
    
    struct REUSABLE_IDENTIFIER {
        static let GALLERY_CELL = "GalleryCell"
    }
}
