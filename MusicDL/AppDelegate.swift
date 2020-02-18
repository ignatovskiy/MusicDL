//
//  AppDelegate.swift
//
//  Copyright © 2020 Ignatovskiy Nikita. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate
{

  let tintColor =  UIColor.white

  var backgroundSessionCompletionHandler: (() -> Void)?
  var window: UIWindow?
  
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool
  {
    customizeAppearance()
    return true
  }
  
  func application(_ application: UIApplication,
                   handleEventsForBackgroundURLSession handleEventsForBackgroundURLSessionidentifier: String,
                   completionHandler: @escaping () -> Void)
  {
    backgroundSessionCompletionHandler = completionHandler
  }
  
  private func customizeAppearance()
  {
    window?.tintColor = tintColor
    
    UISearchBar.appearance().barTintColor = UIColor.white
    
    UINavigationBar.appearance().barTintColor = tintColor
    UINavigationBar.appearance().tintColor = UIColor.white
    
    
    
    let titleTextAttributes = [NSAttributedString.Key(rawValue: NSAttributedString.Key.foregroundColor.rawValue) : UIColor.white]
    UINavigationBar.appearance().titleTextAttributes = titleTextAttributes
  }
}
