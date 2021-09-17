//
//  SplashViewModel.swift
//  FBInsta
//
//  Created by Asif Habib on 09/09/2021.
//

import Foundation
import FacebookLogin

protocol SplashViewModel {
    
    var isFBLoggedIn : Bool {get}
    func viewDidLoad()
//    func checkFBLogin() -> Bool
//    func checkInstaLogin()
}

struct SplashViewModelImp : SplashViewModel{
    var isFBLoggedIn: Bool {
        return FBManager().checkFBLogin()
        
    }
    func viewDidLoad() {
        
    }
    
    
}
