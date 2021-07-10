//
//  AppDelegate.swift
//  StopHoldingCycles
//
//  Created by MesaMobileThinking on 10/07/21.
//

import UIKit
import LifetimeTracker

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
  
  var window: UIWindow?
  
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    
    window = UIWindow(frame: UIScreen.main.bounds)
    let controller = RootViewController()
    let nav = UINavigationController(rootViewController: controller)
    window?.rootViewController = nav
    window?.makeKeyAndVisible()
    
    #if DEBUG
    LifetimeTracker.setup(
      onUpdate: LifetimeTrackerDashboardIntegration(
        visibility: .visibleWithIssuesDetected,
        style: .circular)
        .refreshUI
    )
    #endif
    
    return true
  }
}
