//
//  QRScannerController.swift
//  FST
//
//  Created by Nityanand on 21/01/20.
//  Copyright © 2020 Nityanand. All rights reserved.
//

import UIKit
import AVFoundation

class QRScannerController: UIViewController {

 
     //MARK: Properties
    
    private var scanner: Scanner?
    
    
    
     //MARK: ViewController's Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.scanner = Scanner(withDelegate: self)
        
        guard let scanner = self.scanner else {
            return
        }
        
        scanner.requestCaptureSessionStartRunning()

    }
    
    
   

}



//MARK:AVFoundation delegate methods

extension QRScannerController:AVCaptureMetadataOutputObjectsDelegate{
    
    public func metadataOutput(_ output: AVCaptureMetadataOutput,
                               didOutput metadataObjects: [AVMetadataObject],
                               from connection: AVCaptureConnection) {
        guard let scanner = self.scanner else {
            return
        }
        scanner.metadataOutput(output,
                               didOutput: metadataObjects,
                               from: connection)
    }
    
    
}


//MARK:Scanner delegate methods

extension QRScannerController:ScannerDelegate{
    
    func cameraView() -> UIView
    {
        return self.view
    }
    
    func delegateViewController() -> UIViewController
    {
        return self
    }
    
    func scanCompleted(withCode code: String)
    {
        print(code)
        
        showAlertWithOption(title: "Scanning Code", message: code) { (actionTakenByUser) in
            //User has clicked on Ok
            if actionTakenByUser {
                
                
                self.navigationController?.popViewController(animated: true)
         
            }
            //User has clicked on Cancel
            else{
                self.scanner = Scanner(withDelegate: self)
                
                guard let scanner = self.scanner else {
                    return
                }
                
                scanner.requestCaptureSessionStartRunning()
            }
        }
    }
    
    
}

extension QRScannerController{
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "scanSegue", let _ = segue.destination as? ViewController {
            print("Done")
        }
    }
    
    
    
    
}
