//
//  BusinessLayer.swift
//  TestProject
//
//  Created by Vinod on 15/05/18.
//  Copyright © 2018 Vinod. All rights reserved.
//

import UIKit

class BusinessLayer: NSObject {

    static let sharedInstance = BusinessLayer()
    
    /**
     * Function to use to parse response come from server for user
     * @param responseObj : Response come from API
     * @return Tupple of user model list and is more item
     **/
    func parseUserData(userData: [String : Any?]) -> ([UserModel],Bool) {
        
        var userModelArray: [UserModel] = []
        var hasMoreItems = false
        
        // data key is available or not in key pair format
        if let responseData = userData[APIResponseKey.responseData] as? [String : Any] {
            // user key is available or not in array formate
            if let userList = responseData[APIResponseKey.responseUsers] as? [[String : Any]] {
                for item in userList {
                    // add user model into array
                    userModelArray.append(UserModel(responseObject: item))
                }
            }
            
            // has more key is available or not in bool format
            if let isMoreItems = responseData[APIResponseKey.responseHasMore] as? Bool {
                hasMoreItems = isMoreItems
            }
        }
        return (userModelArray,hasMoreItems)
    }
}
