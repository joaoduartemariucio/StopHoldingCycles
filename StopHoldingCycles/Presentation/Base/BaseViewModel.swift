//
//  BaseViewModel.swift
//  StopHoldingCycles
//
//  Created by MesaMobileThinking on 10/07/21.
//

import Foundation
import LifetimeTracker

class BaseViewModel: LifetimeTrackable {
  
  class var lifetimeConfiguration: LifetimeConfiguration {
    return LifetimeConfiguration(maxCount: 1, groupName: "\(self)")
  }
  
  init() {
    trackLifetime()
  }
  
  deinit {
    debugPrint("DEINIT: \(self)")
  }
}
