//
//  RootViewController.swift
//  BreakRetainCycle
//
//  Created by MesaMobileThinking on 06/07/21.
//

import UIKit
import RxSwift
import RxCocoa

class RootViewController: BaseViewController<RootViewModel> {
  
  let disposeBag = DisposeBag()
  
  var button: UIButton = {
    var btn = UIButton()
    btn.setTitle("Go to red view", for: .normal)
    btn.setTitleColor(.black, for: .normal)
    btn.translatesAutoresizingMaskIntoConstraints = false
    return btn
  }()
  
  convenience init() {
    self.init(viewModel: RootViewModel())
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    title = "RootViewController"
    view.backgroundColor = .white
    
    view.addSubview(button)
    NSLayoutConstraint.activate([
      button.centerYAnchor.constraint(equalTo: view.centerYAnchor),
      button.centerXAnchor.constraint(equalTo: view.centerXAnchor)
    ])
    
    button.rx.tap
      .observe(on: MainScheduler.instance)
      .subscribe(onNext: nextView)
      .disposed(by: disposeBag)
  }
  
  func nextView() {
    let controller = RedViewController()
    self.navigationController?.pushViewController(controller, animated: true)
  }
  
  override class func description() -> String {
    return "RootViewController"
  }
}
