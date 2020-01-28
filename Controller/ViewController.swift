//
//  ViewController.swift
//  FST
//
//  Created by Nityanand on 21/01/20.
//  Copyright © 2020 Nityanand. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func scanButtonAction(_ sender: UIButton) {
        
         //self.performSegue(withIdentifier: "scanSegue", sender: self)
    }
    @IBAction func loginButtonAction(_ sender: UIButton) {
        
        let biomatricLoginView = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "BiomatricLoginView")
        self.navigationController?.pushViewController(biomatricLoginView, animated: true)
    }
    
    @IBAction func dualChatButtonAction(_ sender: UIButton) {
        
        let chatViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ChatViewController")
        self.navigationController?.pushViewController(chatViewController, animated: true)
    }
    
    @IBAction func socialMediaButtonAction(_ sender: UIButton) {
        
        let SocialMediaViewe = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SocialMediaViewe")
        self.navigationController?.pushViewController(SocialMediaViewe, animated: true)
    }
    
    
    @IBAction func googleAnalyticsButtonAction(_ sender: UIButton) {
        
        let analyticsViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "AnalyticsViewController")
        self.navigationController?.pushViewController(analyticsViewController, animated: true)
    }
    
    @IBAction func materialDesignButtonAction(_ sender: UIButton) {
        
        let materialDesignController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MaterialDesignController")
        self.navigationController?.pushViewController(materialDesignController, animated: true)
    }
}

extension ViewController{
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "scanSegue", let _ = segue.destination as? QRScannerController {
            print("Done")
        }
    }
    
    
    
    
}



