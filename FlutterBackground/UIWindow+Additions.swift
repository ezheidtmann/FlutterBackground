//
//  UIWindow+Additions.swift
//  FlutterBackground
//
//  Created by Evan Heidtmann on 1/27/22.
//

import Foundation
import UIKit
extension UIWindow {
    /// Removes window from windows stack
    func remove() {
        rootViewController?.view.removeFromSuperview()
        rootViewController = nil
        isHidden = true

        // https://stackoverflow.com/a/59988501/4124265
        if #available(iOS 13.0, *) {
            windowScene = nil
        }
    }
}
