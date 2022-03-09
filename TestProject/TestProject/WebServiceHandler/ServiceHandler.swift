//
//  ServiceHandler.swift
//  TestProject
//
//  Created by Vinod on 15/05/18.
//  Copyright © 2018 Vinod. All rights reserved.
//

import UIKit
import AFNetworking

class ServiceHandler: NSObject {
    
    static let sharedServiceInstance = ServiceHandler()
    
    // MARK: Get request Manger
    
    /**
     * Function to use for Getting session manger object
     * @param : None
     * @return : Session maneger object
     **/
    func getRequestManager()->AFHTTPSessionManager
    {
        let configutation = URLSessionConfiguration.default
        let aFHTTPSessionManager = AFHTTPSessionManager(sessionConfiguration: configutation)
        aFHTTPSessionManager.requestSerializer = AFJSONRequestSerializer(writingOptions: .prettyPrinted)
        aFHTTPSessionManager.requestSerializer.setValue(HeaderKeysAndValue.headerDeviceTypeValue, forHTTPHeaderField: HeaderKeysAndValue.headerDeviceType)
        return aFHTTPSessionManager
    }
    

    /**
     * Function to use for get user List
     * @param
     **/
    func getUserList(params: [String:Any], successBlock:@escaping (_ result: [UserModel], _ hasMoreItem : Bool) -> (), failureBlock:@escaping (_ fail: Bool, _ message:String?) -> ())
    {
        let manager = getRequestManager()
        
        manager.get(APINames.APIGetUserListURL, parameters: params, progress: nil, success: { (dataTask, responseObj) in
            //Request has been successful
            //Make sure there is a response object
            guard let dictObj = responseObj as? [String:Any?] else {
                return
            }
            
            //Check if the response is a valid response
            let  responseTupple = UtilitySharedClass.sharedInstance.isValidResponse(obj: dictObj)
            if responseTupple.0 == true {
                //It's a valid response will parse it for user list and return a user modal object Array and has more item.
                    
                let tuple = BusinessLayer.sharedInstance.parseUserData(userData: dictObj )
                successBlock(tuple.0,tuple.1)
               
            } else {
                failureBlock(false,responseTupple.1)
            }
        }, failure:{ URLSessionDataTask, error in
            failureBlock(true,AlertMessages.serverError)
        })
    }
}
