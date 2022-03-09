//
//  UserHeaderView.swift
//  TestProject
//
//  Created by Vinod on 15/05/18.
//  Copyright © 2018 Vinod. All rights reserved.
//

import UIKit

class UserHeaderView: UITableViewHeaderFooterView {
    
    //MARK: - Outlets
    
    //Use for show user Image
    @IBOutlet weak var userImageVew: UIImageView!
    
    //Use for show user name
    @IBOutlet weak var userNameLbl: UILabel!
    
    //Use for seprator lone
    @IBOutlet weak var sepratorLbl: UILabel!
   
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        // Set corner radiou of user image
        self.userImageVew.setCorner()
    }
    
    /**
     * Function to use get Height of cell
     * @param None
     * @return : Height of Header View
     **/
    class func getCellHeight() -> CGFloat {
        return 60.0
    }
    
    /**
     * Function to use to update Ui
     * @param indexPath index path
     * @param userMdl:  user Model object
     * @return none
     **/
    func updateUI(section:Int, userMdl:UserModel?) {
        self.setDefaultData()
        guard let userObj = userMdl else {
            return
        }
        
        if let userName = userObj.userName {
            self.userNameLbl.text = userName
        }
        
        if let userImageUrl = userObj.userImageUrl,let url = URL(string: userImageUrl) {
            self.userImageVew.sd_setImage(with: url, placeholderImage: UIImage.userDefaultImage(), options: .refreshCached)
        }
        if section == 0 {
            self.sepratorLbl.isHidden = true
        }
        
    }
    
    // Set default
    func setDefaultData() {
        self.userNameLbl.text = ""
        self.userImageVew.image = UIImage.userDefaultImage()
        self.sepratorLbl.isHidden = false
    }

}
