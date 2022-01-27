//
//  AppDelegate.swift
//  FlutterBackground
//
//  Created by Justin Pfenning on 1/25/22.
//

import UIKit
@testable import Flutter
@testable import FlutterPluginRegistrant

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window : UIWindow?
    var flutterEngine: FlutterEngine?
    let timer = DispatchSource.makeTimerSource(flags: .strict, queue: DispatchQueue.global(qos: .userInteractive))
    weak var flutterVC: FlutterViewController?
    weak var weakEngine: FlutterEngine?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
//        window = UIWindow(frame: UIScreen.main.bounds)
//        let rootVC = UIViewController()
//
//        let rootNC = UINavigationController(rootViewController: rootVC)
//        window?.rootViewController = rootNC
//        window?.makeKeyAndVisible()
        
        //we put this in a delay to really see the memory jump
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(5)) {
            self.flutterEngine = FlutterEngine(name: "my flutter engine")
            self.weakEngine = self.flutterEngine
            self.flutterEngine!.run()
//            GeneratedPluginRegistrant.register(with: self.flutterEngine!);
            
            let flutterViewController = FlutterViewController(engine: self.flutterEngine!, nibName: nil, bundle: nil)
            self.flutterVC = flutterViewController

            self.window?.rootViewController = flutterViewController
            self.window?.makeKeyAndVisible()
        }

        startTimer()

        return true
        
    }

    func startTimer() {
        timer.schedule(deadline: .now(), repeating: .seconds(1))
        timer.setEventHandler {
            self.printWeakStatus()
        }
        timer.resume()
    }

    func printWeakStatus() {
        let vcNil = flutterVC == nil ? "yes" : "no"
        debugPrint("flutterVC isNil? \(vcNil)")
        let engineNil = weakEngine == nil ? "yes" : "no"
        debugPrint("engine isNil? \(engineNil)")

    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        debugPrint("entering foreground")
        if flutterEngine == nil {
            flutterEngine = FlutterEngine(name: "my flutter engine")
            self.weakEngine = self.flutterEngine
            flutterEngine!.run()
        }

        window = UIWindow(frame: UIScreen.main.bounds)

        let flutterViewController = FlutterViewController(engine: self.flutterEngine!, nibName: nil, bundle: nil)
        self.flutterVC = flutterViewController
        
        window?.rootViewController = flutterViewController
        window?.makeKeyAndVisible()
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        debugPrint("entering background")
//        let storyboard = UIStoryboard(name: "Storyboard", bundle: nil)
//        let initialViewController = storyboard.instantiateViewController(withIdentifier: "ViewController")

//        self.window?.rootViewController = initialViewController
        self.window?.rootViewController = nil
        self.window?.makeKeyAndVisible()

        DispatchQueue.main.async {
            // running async to avoid crash; I guess we need to wait for the window to re-draw
            if let engine = self.flutterEngine {
                debugPrint("destroying engine")
                engine.viewController = nil
                engine.destroyContext()
                self.flutterEngine = nil
                self.window?.remove()
                self.window = nil
                self.printWeakStatus()
            }
        }
    }


}

