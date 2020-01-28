//
//  AnalyticsViewController.swift
//  FST
//
//  Created by Nityanand on 25/01/20.
//  Copyright © 2020 Nityanand. All rights reserved.
//

import UIKit
import FirebaseAnalytics

class AnalyticsViewController: UIViewController {
    
    //MARK: IBActions
    
    @IBAction func test1Pressed(_ sender: UIButton) {
        
        Analytics.logEvent("Google_Analytics_Test_1_Button_Pressed", parameters: nil)
      
    }
    
    
    @IBAction func test2Pressed(_ sender: UIButton) {
        
        Analytics.logEvent("Google_Analytics_Test_2_Button_Pressed", parameters: nil)
        
        
    }
    
    
    @IBAction func test3Pressed(_ sender: UIButton) {
        Analytics.logEvent("Google_Analytics_Test_3_Button_Pressed", parameters: nil)
    }
    

    //MARK: ViewControllers life cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }


}
