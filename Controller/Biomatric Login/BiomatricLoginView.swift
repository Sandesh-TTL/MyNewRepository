//
//  BiomatricLoginView.swift
//  FST
//
//  Created by Nityanand on 22/01/20.
//  Copyright © 2020 Nityanand. All rights reserved.
//

import UIKit
import LocalAuthentication

class BiomatricLoginView: UIViewController {
  
    //MARK: ViewController's Life Cycle
        override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

}

//MARK: IBAction's
extension BiomatricLoginView{
    
    @IBAction func bioMatricButtonAction(_ sender: UIButton) {
        
        LocalAuthenticationHelper.authenticateUserWithBioMetrics(kReasonMessage) { [weak self] (authenticationState) in
            guard let self = self else {
                return
            }
            switch authenticationState {
            case .success:
                
                self.showAlertWithOption(title: kAlertTitle, message: kSuccessAuthentication, completion: { (success) in
                    if success{
                        let successViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SuccessViewController")
                        self.navigationController?.pushViewController(successViewController, animated: true)
                    }
                    else{
                        
                    }
                })
                

            case .canceledByUser, .fallback, .canceledBySystem:
                break
                
            case .passcodeNotSet:
                self.notifyUser(title: kAlertTitle, message:authenticationState.message())

            default:
                self.notifyUser(title: kAlertTitle, message: authenticationState.message())
            }
        }
    }
}



