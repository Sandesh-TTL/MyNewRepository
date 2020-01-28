//
//  SocialMediaViewe.swift
//  FST
//
//  Created by Nityanand on 23/01/20.
//  Copyright © 2020 Nityanand. All rights reserved.
//

import UIKit
import FirebaseAnalytics
import TwitterKit

class SocialMediaViewe: UIViewController {
    
    var firstName = String()
    var lastName = String()

    @IBAction func fbLoginPressed(_ sender: UIButton) {
        
        Analytics.logEvent("Facebook_Button_Pressed", parameters: nil)
        
        
        let faceBookController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "FaceBookViewController")
        self.navigationController?.pushViewController(faceBookController, animated: true)
    }
    
    
    @IBAction func twitterLoginPressed(_ sender: UIButton) {
        
        TWTRTwitter.sharedInstance().logIn { (session, error) in
            if (session != nil) {
                self.firstName = session?.userName ?? ""
                self.lastName = session?.userName ?? ""
                
                DispatchQueue.main.async {
                    self.notifyUser(title: "Twitter Account User Name", message: self.firstName)
                }
                let client = TWTRAPIClient.withCurrentUser()
                client.requestEmail { email, error in
                    if (email != nil) {
                        print("signed in as \(String(describing: session?.userName))");
                        let firstName = session?.userName ?? ""   // received first name
                        let lastName = session?.userName ?? ""  // received last name
                        let recivedEmailID = email ?? ""   // received email
                        
                       
                        
                        
                        
                        
                    }else {
                        print("error: \(String(describing: error?.localizedDescription))");
                    }
                }
            }else {
                print("error: \(String(describing: error?.localizedDescription))");
            }
        }
        
        
    }
   
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        return TWTRTwitter.sharedInstance().application(app, open: url, options: options)
    }
    
    @IBAction func linkedInLoginPressed(_ sender: UIButton) {
        Analytics.logEvent("LinkedIn_Button_Pressed", parameters: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    

   
}
