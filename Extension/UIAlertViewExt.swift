//
//  UIAlertViewExt.swift
//  FST
//
//  Created by Nityanand on 22/01/20.
//  Copyright © 2020 Nityanand. All rights reserved.
//

import Foundation
import UIKit



extension UIViewController {
    
   public func showAlertWithOption(title:String, message:String, completion:@escaping (_ result:Bool) -> Void) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        self.present(alert, animated: true, completion: nil)
        
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { action in
            completion(true)
        }))
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { action in
            completion(false)
        }))
    }
    
    public func notifyUser(title:String, message:String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        self.present(alert, animated: true, completion: nil)
        
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler:nil))
        
        
    }
}
