//
//  TwoImageCell.swift
//  TestProject
//
//  Created by Vinod on 15/05/18.
//  Copyright © 2018 Vinod. All rights reserved.
//

import UIKit

class TwoImageCell: UITableViewCell {

    //MARK: - Outlets
    
    //Use for show first item images Image
    @IBOutlet weak var firstImageVew: UIImageView!
    
    //Use for show second item images Image
    @IBOutlet weak var secondImageVew: UIImageView!
    
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
     * @param firstImageURL:  first image url
     * @param secondImageURL:  second image url
     * @return none
     **/
    func updateUI(firstImageURL:String, secondImageURL:String) {
        
        
        self.firstImageVew.image = UIImage.userItemDefaulImage()
        self.secondImageVew.image = UIImage.userItemDefaulImage()
        
        if let url = URL(string: firstImageURL) {
            self.firstImageVew.sd_setImage(with: url, placeholderImage: UIImage.userItemDefaulImage(), options: .refreshCached)
        }
        
        if let url = URL(string: secondImageURL) {
            self.secondImageVew.sd_setImage(with: url, placeholderImage: UIImage.userItemDefaulImage(), options: .refreshCached)
        }
        
    }
    
}
