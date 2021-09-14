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
        
//        let loginButton = FBLoginButton()
//                loginButton.center = view.center
//                view.addSubview(loginButton)
//        loginButton.permissions = ["public_profile", "email"]
        
//        LoginManager().logIn(permissions: ["public_profile", "email"], from: self) { result, error in
//            if let error = error {
//
//            }
//            else if let result = result {
//             LoginManagerLoginResult
//            }
//        }
        

        // Do any additional setup after loading the view.
    }
    @IBAction func onClick_facebook( _ sender : Any){
        LoginManager().logIn(permissions: ["public_profile", "email"], from: self) { result, error in
            if let error = error {
                
            }
            else {
                
                GraphRequest(graphPath: "me").start { connecting, value, error in
                    if let error = error {
                        print("Error :\(error)")
                    }
                    else {
                        print("Response :\(value)")
                        if let value = value as? [String : String] {
                            print("Name :\(value["name"])")
                            print("Name :\(value["id"])")
                            print("Name :\(value["email"])")
                        }
                    }
                    
                }
                
                
                
            }
        }
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
