//
//  ImageView + Extension.swift
//  TestProject
//
//  Created by Vinod on 15/05/18.
//  Copyright © 2018 Vinod. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView {
    func setCorner() {
        self.layer.cornerRadius = self.frame.height / 2
        self.clipsToBounds = true
    }
}
