//
//  FaceBookViewController.swift
//  FST
//
//  Created by Nityanand on 24/01/20.
//  Copyright © 2020 Nityanand. All rights reserved.
//

import UIKit
import FacebookLogin
import FBSDKCoreKit

class FaceBookViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let manager = LoginManager()
        
        manager.logIn(permissions: [.publicProfile,.email,.userGender], viewController: self) { (result) in
            switch result{
            case .cancelled:print("User Cancel request")
            case .failed(let error):print("Failed due to \(error.localizedDescription)")
            case .success(let grantedPermissions, let declinedPermissions, let accessToken):
                 print("\(grantedPermissions)")
                 print("\(declinedPermissions)")
                 print("\(accessToken)")
                 self.fetchUserData()
            }
        }
        
//        let loginButton = FBLoginButton(
//            permissions: [ .publicProfile, .email, .userFriends ,.userGender]
//        )
//        loginButton.center = view.center
//
//        view.addSubview(loginButton)
    }
    
    
    private func fetchUserData() {
        let graphRequest = GraphRequest(graphPath: "me", parameters: ["fields":"id, email, name, picture.width(480).height(480)"])
        graphRequest.start(completionHandler: { (connection, result, error) in
            if error != nil {
                print("Error",error!.localizedDescription)
            }
            else{
                print(result!)
                let field = result! as? [String:Any]
               // self.userNameLabel.text = field!["name"] as? String
                if let imageURL = ((field!["picture"] as? [String: Any])?["data"] as? [String: Any])?["url"] as? String {
                    print(imageURL)
                    let url = URL(string: imageURL)
                    let data = NSData(contentsOf: url!)
                    let image = UIImage(data: data! as Data)
                  //  self.profileImageView.image = image
                }
            }
        })
    }
}
