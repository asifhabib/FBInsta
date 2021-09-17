//
//  ProfileViewModel.swift
//  FBInsta
//
//  Created by Asif Habib on 17/09/2021.
//

import Foundation


protocol ProfileViewModel {
    
    var name: String {get}
    var email : String {get}
    var profileImage : URL? {get}
    
}

struct ProfileViewModelImp : ProfileViewModel {
    
    var name: String {
        return ""
    }
    var email: String{
        return ""
    }
    var profileImage: URL? {
        return URL(string: "")
    }
    
    
    
}
