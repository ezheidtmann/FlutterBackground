//
//  PigeonBridge.swift
//  FlutterBackground
//
//  Created by Evan Heidtmann on 1/28/22.
//

import Foundation
import Flutter

class PigeonNativeReceiver: NSObject, PigeonNativeBridge {
    func getRandomValueWithError(_ error: AutoreleasingUnsafeMutablePointer<FlutterError?>) -> SingleValue? {
        let retVal = SingleValue()
        retVal.theValue = Int.random(in: 1000...9999) as NSNumber
        return retVal
    }
}
