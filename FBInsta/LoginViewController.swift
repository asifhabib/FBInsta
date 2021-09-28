//
//  LoginViewController.swift
//  FBInsta
//
//  Created by Asif Habib on 09/09/2021.
//

import UIKit
import FBSDKCoreKit
import FBSDKLoginKit
import FBAEMKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        checkFBLogin()

        // Do any additional setup after loading the view.
    }
    
    
    func checkFBLogin() {
        let fbFeed = self.storyboard!.instantiateViewController(withIdentifier: "FBFeedViewController")
        if FBManager().checkFBLogin(){
            self.navigationController?.setViewControllers([fbFeed], animated: false)
        }
        
        
    }
    
    @IBAction func onClick_facebook( _ sender : Any){
        
//        let token = AccessToken(tokenString: "", permissions: [], declinedPermissions: [], expiredPermissions: [], appID: "", userID: "")
        
//        public_profile", "email", "user-posts", "user_link", "user_photos", "user_videos"
        let config = LoginConfiguration(permissions: [.email, .publicProfile, .userPosts, .userPhotos, .userVideos], tracking: .enabled)!
        
        
        
        
        LoginManager().logIn(configuration: config) { [weak self] result in
            switch result {
            case .success(let granted,let declined,let token):
                print("Success Granted :\(granted), declined: \(declined), Token: \(token)")
                self?.moveToFeed()
            case .failed(let error):
                print("Failed with Error :\(error)")
            case .cancelled:
                print("Requet canceled")
            }
        }
        
        
        
//        LoginManager().logIn(permissions: ["public_profile", "email", "user-posts"], from: self) { result, error in
//
//        }
//
//
//        LoginManager.logIn(<#T##self: LoginManager##LoginManager#>)
        
        
        
//        LoginManager().logIn(permissions: ["public_profile", "email"], from: self) { result, error in
//            if let error = error {
//
//            }
//            else {
//
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
//
//                }
//
//
//
//            }
//        }
    }
    
    
    func moveToFeed(){
        let fbFeed = self.storyboard!.instantiateViewController(withIdentifier: "FBFeedViewController")
        if FBManager().checkFBLogin(){
            self.navigationController?.setViewControllers([fbFeed], animated: true)
        }
//        AppDelegate.moveToFeed(isFacebook: true)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
