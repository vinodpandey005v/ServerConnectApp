//
//  UserModel.swift
//  TestProject
//
//  Created by Vinod on 15/05/18.
//  Copyright © 2018 Vinod. All rights reserved.
//

import UIKit

class UserModel: NSObject {
    
    //MARK: - Variables
    var userName: String?
    var userImageUrl: String?
    var userItems: [String]?
   
    //MARK: - FUnction
    override init() {
        
    }
    
    // Parse user data
    init(responseObject: [String: Any?]) {
        super.init()
        if let uName = responseObject[APIResponseKey.responseUserName] as? String {
            self.userName = uName
        }
        if let uImageURL = responseObject[APIResponseKey.responseUserImageURL] as? String {
            self.userImageUrl = uImageURL
        }
        if let uItems = responseObject[APIResponseKey.responseUserItems] as? [String] {
            self.userItems = uItems
        }
    }
}
