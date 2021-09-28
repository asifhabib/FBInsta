//
//  ProfileViewController.swift
//  FBInsta
//
//  Created by Asif Habib on 17/09/2021.
//

import UIKit

class ProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func onClick_primary(_ sender : Any){
        
        UIApplication.shared.setAlternateIconName(nil) { error in
            print("Error :\(error)")
        }
        
    }
    @IBAction func onClick_icon2(_ sender : Any){
        
        UIApplication.shared.setAlternateIconName("AppIcon-2") { error in
            print("Error :\(error)")
        }
        
    }
    @IBAction func onClick_icon3(_ sender : Any){
        UIApplication.shared.setAlternateIconName("AppIcon-3") { error in
            print("Error :\(error)")
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
