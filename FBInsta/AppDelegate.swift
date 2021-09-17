//
//  AppDelegate.swift
//  FBInsta
//
//  Created by Asif Habib on 08/09/2021.
//

import UIKit
import FBSDKCoreKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        ApplicationDelegate.shared.application(
                    application,
                    didFinishLaunchingWithOptions: launchOptions
                )
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ app: UIApplication,
                     open url: URL,
                     options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        ApplicationDelegate.shared.application(
                    app,
                    open: url,
                    sourceApplication: options[UIApplication.OpenURLOptionsKey.sourceApplication] as? String,
                    annotation: options[UIApplication.OpenURLOptionsKey.annotation]
                )
    }
    
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

extension AppDelegate {
    
    
    static func moveToLogin(){
        let storyBoard = UIStoryboard(name: "Main", bundle: .main)
        let vc = storyBoard.instantiateViewController(withIdentifier: "LoginViewController")
        change(root: vc)
    }
    static func moveToFeed(){
        
        let storyBoard = UIStoryboard(name: "Main", bundle: .main)
        
        let fbFeed = storyBoard.instantiateViewController(withIdentifier: "FBFeedViewController")
        let nav1 = UINavigationController(rootViewController: fbFeed)
        nav1.title = "Facebook"
        
        let isntaFeed = storyBoard.instantiateViewController(withIdentifier: "InstaFeedViewController")
        let nav2 = UINavigationController(rootViewController: isntaFeed)
        nav2.title = "Insta"
        
        let profileVC = storyBoard.instantiateViewController(withIdentifier: "ProfileViewController")
        let nav3 = UINavigationController(rootViewController: profileVC)
        nav3.title = "Profile"
        
        let tabbarController = UITabBarController()
        tabbarController.addChild(nav1)
        tabbarController.addChild(nav2)
        tabbarController.addChild(nav3)
        
        change(root: tabbarController)
    }
    static func change(root vc : UIViewController){
        UIApplication.shared.windows.first?.rootViewController = vc
    }
 }
