//
//  UtilitySharedClass.swift
//  TestProject
//
//  Created by Vinod on 15/05/18.
//  Copyright © 2018 Vinod. All rights reserved.
//

import UIKit

class UtilitySharedClass: NSObject {

    //MARK :- Variables
    static let sharedInstance = UtilitySharedClass()
    
    //MARK :- Functions
    
    /**
     * Function to use for save data to crospoinding keys in default
     * @param : key: Value is store on this key
     * @parm : Value: store value
     **/
    func saveDataInUserDefault(key: String,value:String) {
        let mySharedDefaults = UserDefaults.standard
        mySharedDefaults.set(value, forKey: key)
        mySharedDefaults.synchronize()
    }
    /**
     * Function to use for getting Data from default on the basis of provided key
     * @param key: value store on crossponding key
     * @return value: get value from given key
     **/
    func getDataFromUserDefault(key:String)->String{
        let mySharedDefaults = UserDefaults.standard
        if let returnValue = mySharedDefaults.object(forKey: key) {
            return returnValue as! String
        }
        return ""
    }
    
    /**
     * Function to use for Check Object is dictionary and contain key or not
     * @param response: Any Object and key
     * @return boolen type
     **/
    func isObjectDictionaryWithKey(obj:Any?,key:String) -> Bool {
        if let response = obj as? NSDictionary {
            if response[key] != nil {
                return true
            }
        }
        return false
    }
    /**
     * Function to use for Check dictionary contain key or not
     * @param response: Any Object and key
     * @return boolen type
     **/
    func isDictionaryContainKey(obj:NSDictionary,key:String) -> Bool {
        if obj[key] != nil {
            return true
        }
        return false
    }
    
    /**
     * Function to use for Check null and nil coming from server
     * @param response: Any Object
     * @return boolen type
     **/
    func checkNull(obj :AnyObject?) -> Bool {
        if let str = obj as? String {
            if(str.lowercased() == "null" || str.lowercased() == "<null>" || str.lowercased() == "nil")  {
                
                return false
            }
            return true
        } else {
            return false
        }
    }
    
    //MARK: - Keyboard Functions
    func keyboardWillShow(_ notification: NSNotification, inView: UIView, percent: CGFloat) {
        if let info = notification.userInfo, let keyboardSize =  (info[UIKeyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue, keyboardSize.height > 0 {
            inView.frame.origin.y = 0 - keyboardSize.height * percent
        } else {
            inView.frame.origin.y = 0 - 220 * percent
        }
    }
    
    func keyboardWillHide(_ notification: NSNotification, inView: UIView) {
        
        inView.frame.origin.y = 0
    }
    public func showPopUpToUser(title: String, massege:String) {
        
        if let root = UIApplication.shared.keyWindow?.rootViewController {
            
            let alertController = UIAlertController(title: title, message: massege, preferredStyle: .alert)
            root.present(alertController, animated: true, completion: nil)
            let OKAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alertController.addAction(OKAction)
        }
    }
    
    //MARK: - Internet functions
    func connectionToInternetIsAvailable() -> Bool {
        let reachability: Reachability = Reachability.forInternetConnection()
        let networkStatus: Int = reachability.currentReachabilityStatus().rawValue
        return networkStatus != 0
    }
    
    //
    /**
     * Function to use for Check status of API response
     * @param response: Api response
     * @return boolen type
     **/
    func isValidResponse(obj :[String:Any?]) -> (Bool,String?) {
        var apiStatus = false
        var apiMessage = ""
        if let status = obj[APIResponseKey.responseStatus] as? Bool {
            apiStatus = status
        }
        if let msg = obj[APIResponseKey.responseMessage] as? String {
             apiMessage = msg
        }
        return (apiStatus,apiMessage)
    }
}
