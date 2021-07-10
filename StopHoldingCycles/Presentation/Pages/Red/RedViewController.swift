//
//  RedViewController.swift
//  BreakRetainCycle
//
//  Created by MesaMobileThinking on 06/07/21.
//

import UIKit
import RxSwift
import RxCocoa

class RedViewController: BaseViewController<RedViewModel> {
  
  struct Constants {
    static let TitleView = "RedViewController"
  }
  
  let disposeBag = DisposeBag()
  
  var button: UIButton = {
    var btn = UIButton()
    btn.setTitle("Go to yellow view", for: .normal)
    btn.setTitleColor(.black, for: .normal)
    btn.translatesAutoresizingMaskIntoConstraints = false
    return btn
  }()
  
  convenience init() {
    self.init(viewModel: RedViewModel())
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    title = Constants.TitleView
    view.backgroundColor = .red
    
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
    let controller = YellowViewController()
    self.navigationController?.pushViewController(controller, animated: true)
  }
  
  override class func description() -> String {
    return Constants.TitleView
  }
}
