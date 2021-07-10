//
//  BaseViewController.swift
//  BreakRetainCycle
//
//  Created by MesaMobileThinking on 06/07/21.
//

import Foundation
import UIKit
import LifetimeTracker

class BaseViewController<VM>: UIViewController,
                              LifetimeTrackable where VM: BaseViewModel {
  
  let viewModel: VM!
  
  class var lifetimeConfiguration: LifetimeConfiguration {
    return LifetimeConfiguration(maxCount: 1, groupName: "\(self.description())")
  }
  
  init(viewModel: VM, xibName: String? = nil) {
    self.viewModel = viewModel
    super.init(nibName: xibName, bundle: nil)
    trackLifetime()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  deinit {
    debugPrint("DEINIT: \(self)")
  }
  
  func updateView() { }
}
