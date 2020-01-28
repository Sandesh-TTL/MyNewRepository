//
//  Constants.swift
//  FST
//
//  Created by Nityanand on 22/01/20.
//  Copyright © 2020 Nityanand. All rights reserved.
//

import Foundation
import Firebase

struct Constants
{
    struct refs
    {
        static let databaseRoot = Database.database().reference()
        static let databaseChats = databaseRoot.child("chats")
    }
}

let kAlertTitle = "Thyrocare"
let kReasonMessage = "Biometeric required your authentication."

/// Biometric Default Reason(s)
let kBiometryNotAvailableReason = "Biometric authentication is not available for this device."

/// Common Message(s)
let kSetPasscode = "Please set device passcode for authentication."
let kSuccessAuthentication = "Successfully Authenticated"

/// TouchID Related Message(s)
let kTouchIdAuthenticationReason = "Confirm your fingerprint to authenticate."
let kTouchIdPasscodeAuthenticationReason = "Touch ID is locked now, because of too many failed attempts. Enter passcode to unlock Touch ID."

/// Error Messages Touch ID
let kNoFingerprintEnrolled = "There are no fingerprints enrolled in the device. Please go to Device Settings -> Touch ID & Passcode and enroll your fingerprints."
let kDefaultTouchIDAuthenticationFailedReason = "Touch ID does not recognize your fingerprint. Please try again with your enrolled fingerprint."

/// FaceID Related Message(s)
let kFaceIdAuthenticationReason = "Confirm your face to authenticate."
let kFaceIdPasscodeAuthenticationReason = "Face ID is locked now, because of too many failed attempts. Enter passcode to unlock Face ID."

/// Error Messages Face ID
let kNoFaceIdentityEnrolled = "There is no face enrolled in the device. Please go to Device Settings -> Face ID & Passcode and enroll your face."
let kDefaultFaceIDAuthenticationFailedReason = "Face ID does not recognize your face. Please try again with your enrolled face."
