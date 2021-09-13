//
//  InstaFeedViewController.swift
//  FBInsta
//
//  Created by Asif Habib on 08/09/2021.
//

import UIKit

class InstaFeedViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
//class ViewController: UIViewController {
//    
//    @IBOutlet weak var btn_login : UIButton!
//    @IBOutlet weak var btn_fetchFeed : UIButton!
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        setupFacebook()
//        
//        // Do any additional setup after loading the view.
//    }
//    
//    func setupFacebook(){
//        if !isLoggedIn() {
//            btn_login.setTitle("Login Facebook", for: .normal)
//            return
//        }
//        btn_login.setTitle("Logout Facebook", for: .normal)
//        proceedWithGraphRequest()
//        
//    }
//    func isLoggedIn() -> Bool {
//        if let token = AccessToken.current,
//           token.isExpired == false {
//            return true
//        }
//        return false
//    }
//    
//    @IBAction func onClick_login(_ sender : Any){
//        if isLoggedIn() {
//            LoginManager().logOut()
//            AccessToken.current = nil
//            return
//        }
//        
//        LoginManager().logIn(permissions: ["email","public_profile","user_posts"], from: self) { [weak self] (result, error) in
//            if let error = error {
//                print("Login Failed with Error :\(error)")
//            }
//            else {
//                self?.proceedWithGraphRequest()
//            }
//        }
//        
//        
//        
//    }
//    func proceedWithGraphRequest(){
//        let request = GraphRequest(graphPath: "/me", parameters: ["fields": "id,name,email,posts"], httpMethod: .get)
//        
//        request.start { (connection, result, error) in
//            if let error = error {
//                print("GraphRequest Error :\(error)")
//            }
//            else {
//                print("Response :\(result)")
//            }
//        }
//        
//        
//    }
//    @IBAction func onClick_fetchFeed(_ sender : Any){
//        
//    }
//}
