//
//  Extension.swift
//  shopOnline
//
//  Created by Vladimir Liubarskiy on 07/06/2024.
//

import UIKit

extension UIViewController {
    func alert(text: String, description: String) {
        let alert = UIAlertController(title: text, message: description, preferredStyle: .alert)
        let action = UIAlertAction(title: "Close", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true)
    }
}
extension UIWindow {
    private static var loaderViewControllerKey = "loaderViewControllerKey"
    
    private static var loaderViewController: UIViewController? {
        get {
            return objc_getAssociatedObject(self, &UIWindow.loaderViewControllerKey) as? UIViewController
        }
        set {
            objc_setAssociatedObject(self, &UIWindow.loaderViewControllerKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
  static  func showLoader() {
        guard loaderViewController == nil else {
            return
        }
        
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        
        let loaderVC = storyBoard.instantiateViewController(identifier: "LaunchViewController")
        loaderVC.view.backgroundColor = UIColor(white: 0, alpha: 0.5)
    
        
        loaderViewController = loaderVC
      if let window = UIApplication.shared.windows.first {
          
          if let rootViewController = window.rootViewController {
              loaderVC.view.frame = rootViewController.view.frame
              rootViewController.view.addSubview(loaderVC.view)
          }
      }
      
    }
    
   static func hideLoader() {
        loaderViewController?.view.removeFromSuperview()
        loaderViewController = nil
    }
}
