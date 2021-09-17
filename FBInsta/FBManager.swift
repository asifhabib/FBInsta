//
//  FBManager.swift
//  FBInsta
//
//  Created by Asif Habib on 14/09/2021.
//

import Foundation
import FBSDKCoreKit
import FBSDKLoginKit

struct FBManager {
    
    func checkFBLogin() -> Bool{
        guard let accessToken = AccessToken.current,
              !accessToken.isExpired else {
         return false
        }
        return true
    }
    func logoutFB(){
        LoginManager().logOut()
        AccessToken.current = nil
    }
    func login(){
        
        
        LoginManager().logIn(permissions: ["public_profile", "email", "user-posts", "user_link", "user_photos", "user_videos"], from: nil) { result, error in
            
        }
        
        
//        LoginManager().logIn(permissions: ["public_profile", "email", "user-posts", "user_link", "user_photos", "user_videos"]) { result, error in
//
//        }
//
//
//        LoginManager().logIn(permissions: ["public_profile", "email"], from: self) { result, error in
//            if let error = error {
//            }
//            else {
//                GraphRequest(graphPath: "me").start { connecting, value, error in
//                    if let error = error {
//                        print("Error :\(error)")
//                    }
//                    else {
//                        print("Response :\(value)")
//                        if let value = value as? [String : String] {
//                            print("Name :\(value["name"])")
//                            print("Name :\(value["id"])")
//                            print("Name :\(value["email"])")
//                        }
//                    }
//                }
//            }
//        }
    }
    func logout(){
        LoginManager().logOut()
        AccessToken.current = nil
    }
}
