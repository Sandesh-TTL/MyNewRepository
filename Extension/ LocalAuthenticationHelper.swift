//
//   LocalAuthenticationHelper.swift
//  FST
//
//  Created by Nityanand on 22/01/20.
//  Copyright © 2020 Nityanand. All rights reserved.
//

import Foundation
import LocalAuthentication

class LocalAuthenticationHelper:NSObject{
    
   //Variable decleration
    
    class var isFaceIdAvailable:Bool{
        
        let context : LAContext = LAContext()
        let evaluate = context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: nil)
        if #available(iOS 11.0, *){
            return (context.biometryType == .faceID)
        }
        
        return evaluate
    }
    
    class var isTouchIdAvailable:Bool {
        let context : LAContext = LAContext()
        let evaluate = context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: nil)
        if #available(iOS 11.0, *){
            return (context.biometryType == .touchID)
        }
        return evaluate
    }
    
     /// Change default message as per your need.
    
    fileprivate static var defaultReasonMessage: String {
        return LocalAuthenticationHelper.isFaceIdAvailable ?  kFaceIdAuthenticationReason : kTouchIdAuthenticationReason
    }
    /// Block Declaration(s)
    typealias authenticationBlock = ((AuthenticationBlockState) -> ())
}

// MARK: - Authentication Related Method(s)
extension LocalAuthenticationHelper {
    /// This method will check the user authentication with biometeric. If biometrics get failed user will prompt with passcode option.
    ///
    /// - Parameters:
    ///   - reasonMessage: Reason message is must be and cannot be empty/nil for using biometeric/passcode.
    
    ///   - cancelTitle: By default is `Cancel`.
    
    ///   - block: Return the state of user authentication is success or failure.
    class func authenticateUserWithBioMetrics(_ reasonMessage: String, cancelTitle: String? = "", block: @escaping authenticationBlock) {
        let context: LAContext = LAContext()
        context.localizedCancelTitle = cancelTitle
        context.localizedFallbackTitle = "Passcode"
        evaluate(.deviceOwnerAuthentication, reason: (reasonMessage.isEmpty ? defaultReasonMessage : reasonMessage), context: context, block: block)
    }
    fileprivate static func evaluate(_ policy: LAPolicy, reason: String, context: LAContext, block: @escaping authenticationBlock) {
        context.evaluatePolicy(policy, localizedReason: reason) { (isSuccess, error) in
            block(AuthenticationBlockState.initWith(error as? LAError))
        }
    }
}
