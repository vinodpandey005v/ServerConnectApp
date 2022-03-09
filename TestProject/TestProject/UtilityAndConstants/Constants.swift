//
//  Constants.swift
//  TestProject
//
//  Created by Vinod on 15/05/18.
//  Copyright © 2018 Vinod. All rights reserved.
//

import Foundation
import UIKit

var APP_DELEGATE : AppDelegate = UIApplication.shared.delegate as! AppDelegate

struct HeaderKeysAndValue {
    static let headerDeviceType = "device-type"
    static let headerDeviceTypeValue = "ios"
    
    static let headerContentType = "Content-Type"
    static let headerContentTypeValue = "application/json"
    
    static let headerAcceptType = "Accept"
    static let headerAuthorization = "Authorization"
}

struct DateFormates {
    static let yyyy_MM_DD = "yyyy-MM-dd"
    static let dd_mm_yyyy = "dd/MM/yyyy"
    static let EEEE_dd_MMM_YYYY = "EEEE, dd MMM YYYY"
    static let MMM_dd = "MMM dd"
    static let yyyy_MM_DD_HH_MM_SS = "yyyy-MM-dd HH:mm:ss"
    static let HH_mm = "HH:mm"
}
struct APINames {
    static let APIGetUserListURL = "http://sd2-hiring.herokuapp.com/api/users"
}

struct APIMethods {
    static let APIPost = "POST"
    static let APIGet = "GET"
    static let APIDelete = "DELETE"
    static let APIPut = "PUT"
    static let APIOptions = "OPTIONS"
}

struct APIParametersKey {
    static let APIRequestOffset = "offset"
    static let APIRequestLimit = "limit"
}

struct APIResponseKey{
    static let responseStatus = "status"
    static let responseMessage = "message"
    static let responseHasMore = "has_more"
    static let responseData = "data"
    static let responseUsers = "users"
    static let responseUserName = "name"
    static let responseUserImageURL = "image"
    static let responseUserItems = "items"
}


struct ProgressMessages {
    static let waitMessage = "Wait..."
    static let loadingMessage = "Loading..."
}

struct AlertMessages {
    //Home
    static let InvalidUserId = "Please provide valid user id."
    
    static let serverError = "Server error.Please try again."
    
    // Droup Down
    static let cancelText = "Cancel"
    static let doneText = "Done"
    
}

struct ScreenSize {
    
    static let ScreenWidth        = UIScreen.main.bounds.size.width
    static let ScreenHeight       = UIScreen.main.bounds.size.height
    static let ScreenMaxLength    = max(ScreenSize.ScreenWidth, ScreenSize.ScreenHeight)
    static let ScreenMinLength    = min(ScreenSize.ScreenWidth, ScreenSize.ScreenHeight)
}

struct DeviceType {
    
    static let IsIphone4S  = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.ScreenMaxLength < 568.0
    static let IsIphone5S = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.ScreenMaxLength == 568.0
    static let ISIPhone7 = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.ScreenMaxLength == 667.0
    static let ISIPhone7P = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.ScreenMaxLength == 736.0
    static let IS_IPAD = UIDevice.current.userInterfaceIdiom == .pad && ScreenSize.ScreenMaxLength == 1024.0
}

struct Version {
    static let SystemVersion = (UIDevice.current.systemVersion as NSString).floatValue
    static let iOS9 = (Version.SystemVersion >= 9.0 && Version.SystemVersion < 10.0)
    static let iOS10 = (Version.SystemVersion >= 10.0 && Version.SystemVersion < 11.0)
}
struct Colors {
    static let screenBackgroundColor = UIColor(red: 227.0/255.0, green: 26.0/255.0, blue: 45.0/255.0, alpha: 1.0)
}

struct AppFonts {
    static let kBoldSystemFontSize16 : UIFont = UIFont.boldSystemFont(ofSize: 16)
}

struct Keyboard {
    static let KEYBOARD_ANIMATION_DURATION: CGFloat! = 0.3
    static let MINIMUM_SCROLL_FRACTION: CGFloat! = 0.2
    static let MAXIMUM_SCROLL_FRACTION: CGFloat! = 0.8
    static let PORTRAIT_KEYBOARD_HEIGHT: CGFloat! = 216
    static let LANDSCAPE_KEYBOARD_HEIGHT: CGFloat! = 162
}
