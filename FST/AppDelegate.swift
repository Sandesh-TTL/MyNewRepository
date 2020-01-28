//
//  AppDelegate.swift
//  FST
//
//  Created by Nityanand on 21/01/20.
//  Copyright © 2020 Nityanand. All rights reserved.
//

import UIKit
import Firebase
import FacebookCore
import FBSDKCoreKit
import TwitterKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
    ApplicationDelegate.shared.application(application, didFinishLaunchingWithOptions: launchOptions)
        
        TWTRTwitter.sharedInstance().start(withConsumerKey: "CsLE8swqBug5symCPgAO8f2nO", consumerSecret: "YdMy41LAPayfNsLK64VeL1xdH7cNb5RunYsU89cdskh84j5Uy1")
        
       FirebaseApp.configure()
        return true
    }
    

    internal func application(_ application: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey: Any]) -> Bool {

    let directedByFB = ApplicationDelegate.shared.application(application, open: url, options: options)
    let directedByTWTR =  TWTRTwitter.sharedInstance().application(application, open: url, options: options)
   
    return directedByFB || directedByTWTR
    }
    
    func application(_ application: UIApplication, shouldAllowExtensionPointIdentifier extensionPointIdentifier: UIApplication.ExtensionPointIdentifier) -> Bool {
        if (extensionPointIdentifier == UIApplication.ExtensionPointIdentifier.keyboard) {
            return false
        }
        return true
    }
    
    
    
    func application(_ application: UIApplication,
                     open url: URL, sourceApplication: String?, annotation: Any) -> Bool {
        var handle: Bool = true
        
        
        let options: [String: AnyObject] = [UIApplication.OpenURLOptionsKey.sourceApplication.rawValue: sourceApplication as AnyObject, UIApplication.OpenURLOptionsKey.annotation.rawValue: annotation as AnyObject]
        
        handle = TWTRTwitter.sharedInstance().application(application, open: url, options: options)
        
        
        
        return handle
    }

    func applicationWillResignActive(_ application: UIApplication) {
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
     
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
       
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        
         AppEvents.activateApp()
       
    }

    func applicationWillTerminate(_ application: UIApplication) {
      
    }


}

