//
//  MaterialDesignController.swift
//  FST
//
//  Created by Nityanand on 27/01/20.
//  Copyright © 2020 Nityanand. All rights reserved.
//

import UIKit
import RAMPaperSwitch

class MaterialDesignController: UIViewController {
    
    @IBOutlet weak var connectContactsLabel: UILabel!
    @IBOutlet weak var phone1ImageView: UIImageView!
    @IBOutlet weak var paperSwitch1: RAMPaperSwitch!
    
    @IBOutlet weak var allowDiscoveryLabel: UILabel!
    @IBOutlet weak var phone2ImageView: UIImageView!
    @IBOutlet weak var paperSwitch2: RAMPaperSwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupPaperSwitch()
        
      //  self.navigationController?.isNavigationBarHidden = true
    }
    
    fileprivate func setupPaperSwitch() {
        
        self.paperSwitch1.animationDidStartClosure = {(onAnimation: Bool) in
            
            self.animateLabel(self.connectContactsLabel, onAnimation: onAnimation, duration: self.paperSwitch1.duration)
            self.animateImageView(self.phone1ImageView, onAnimation: onAnimation, duration: self.paperSwitch1.duration)
        }
        
        
        self.paperSwitch2.animationDidStartClosure = {(onAnimation: Bool) in
            
            self.animateLabel(self.self.allowDiscoveryLabel, onAnimation: onAnimation, duration: self.paperSwitch2.duration)
            self.animateImageView(self.phone2ImageView, onAnimation: onAnimation, duration: self.paperSwitch2.duration)
        }
    }
    
    fileprivate func animateLabel(_ label: UILabel, onAnimation: Bool, duration: TimeInterval) {
        UIView.transition(with: label, duration: duration, options: UIView.AnimationOptions.transitionCrossDissolve, animations: {
            label.textColor = onAnimation ? UIColor.white : UIColor(red: 31/255.0, green: 183/255.0, blue: 252/255.0, alpha: 1)
        }, completion:nil)
    }
    
    fileprivate func animateImageView(_ imageView: UIImageView, onAnimation: Bool, duration: TimeInterval) {
        UIView.transition(with: imageView, duration: duration, options: UIView.AnimationOptions.transitionCrossDissolve, animations: {
            imageView.image = UIImage(named: onAnimation ? "img_phone_on" : "img_phone_off")
        }, completion:nil)
    }
}

