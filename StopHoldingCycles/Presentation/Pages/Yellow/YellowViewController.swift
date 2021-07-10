//
//  YellowViewController.swift
//  BreakRetainCycle
//
//  Created by MesaMobileThinking on 06/07/21.
//

import UIKit
import RxSwift
import RxCocoa

class YellowViewController: BaseViewController<YellowViewModel> {
  
  let disposeBag = DisposeBag()
  
  var button: UIButton = {
    var btn = UIButton()
    btn.setTitle("Go to root view", for: .normal)
    btn.setTitleColor(.black, for: .normal)
    btn.translatesAutoresizingMaskIntoConstraints = false
    return btn
  }()
  
  convenience init() {
    self.init(viewModel: YellowViewModel())
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    title = "YellowViewController"
    view.backgroundColor = .yellow
    
    view.addSubview(button)
    NSLayoutConstraint.activate([
      button.centerYAnchor.constraint(equalTo: view.centerYAnchor),
      button.centerXAnchor.constraint(equalTo: view.centerXAnchor)
    ])
    
    // Observe Notification: Application Did Become Active Notification
    NotificationCenter.default.addObserver(forName: UIApplication.didBecomeActiveNotification,
                                           object: nil,
                                           queue: .main) { [unowned self] _ in
      self.updateView()
    }
    
    button.rx.tap
      .observe(on: MainScheduler.instance)
      .subscribe(onNext: goToRootView)
      .disposed(by: disposeBag)
  }
  
  func goToRootView() {
    self.navigationController?.popToRootViewController(animated: true)
  }
  
  override class func description() -> String {
    return "YellowViewController"
  }
}
