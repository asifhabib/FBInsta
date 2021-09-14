//
//  SplashViewModel.swift
//  FBInsta
//
//  Created by Asif Habib on 09/09/2021.
//

import Foundation
import FacebookLogin

protocol SplashViewModel {
    func viewDidLoad()
    func checkFBLogin()
    func checkInstaLogin()
}

struct SplashViewModelImp : SplashViewModel{
    func viewDidLoad() {
        checkFBLogin()
    }
    
    func checkFBLogin(){
        guard let accessToken = AccessToken.current,
              !accessToken.isExpired else {
         return
        }
        
    }
    
    func checkInstaLogin() {
        
    }
}
