//
//  SplashViewController.swift
//  FBInsta
//
//  Created by Asif Habib on 08/09/2021.
//

import UIKit

class SplashViewController: UIViewController {
    
    let viewModel : SplashViewModel = SplashViewModelImp()

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
//        if viewModel.isFBLoggedIn{
            AppDelegate.moveToFeed()
//        }
//        else{
//            AppDelegate.moveToLogin()
//        }
        
       
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
