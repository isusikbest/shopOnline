//
//  AppDelegate.swift
//  shopOnline
//
//  Created by Vladimir Liubarskiy on 04/06/2024.
//

import UIKit
import Firebase

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        FirebaseApp.configure()
        PushService.shared.begin()
        window = UIWindow(frame: UIScreen.main.bounds)
        if let _ = FirebaseAuthService.shared.current {
            DispatchQueue.main.async {
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let controller = storyboard.instantiateViewController(identifier: "AuthModule")
                self.window?.rootViewController = controller
                self.window?.makeKeyAndVisible()
            }
        } else {
            DispatchQueue.main.async {
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let controller = storyboard.instantiateViewController(identifier: "RootModule")
                self.window?.rootViewController = controller
                self.window?.makeKeyAndVisible()
            }
        }
       
   return true
  }

  

}

