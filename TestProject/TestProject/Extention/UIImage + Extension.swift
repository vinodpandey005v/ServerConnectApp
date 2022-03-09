//
//  UIImage + Extension.swift
//  TestProject
//
//  Created by Vinod on 15/05/18.
//  Copyright © 2018 Vinod. All rights reserved.
//

import Foundation
import UIKit

private let userDefaultImg: String = "users"
private let useItemDefaultImg: String = "image1"


extension UIImage {
    class func userDefaultImage() -> UIImage {
        return (UIImage(named: userDefaultImg)?.withRenderingMode(.alwaysOriginal))!
    }
    
    class func userItemDefaulImage() -> UIImage {
        return (UIImage(named: useItemDefaultImg)?.withRenderingMode(.alwaysOriginal))!
    }
}

