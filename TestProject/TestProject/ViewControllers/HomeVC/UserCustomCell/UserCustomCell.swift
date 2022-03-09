//
//  UserCustomCell.swift
//  TestProject
//
//  Created by Vinod on 15/05/18.
//  Copyright © 2018 Vinod. All rights reserved.
//

import UIKit

class UserCustomCell: UITableViewCell {

    //MARK: - Outlets
    
    //Use for show first odd item images Image
    @IBOutlet weak var firstImageVew: UIImageView!
    
    //MARK: - variable
    // User model
    var userModel: UserModel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        self.selectionStyle = .none
    }
    
    
    /**
     * Function to use to update Ui
     * @param indexPath index path
     * @param firstImageURL:  first image url
     * @return none
     **/
    func updateUI(indexPath:IndexPath, firstImageURL:String) {
        
        self.firstImageVew.image = UIImage.userItemDefaulImage()
        if let url = URL(string: firstImageURL) {
            self.firstImageVew.sd_setImage(with: url, placeholderImage: UIImage.userItemDefaulImage(), options: .refreshCached)
        }
    }
}


