//
//  RedViewController.swift
//  BreakRetainCycle
//
//  Created by MesaMobileThinking on 06/07/21.
//

import UIKit
import RxSwift
import RxCocoa

// MARK: - RedViewController
class RedViewController: BaseViewController<RedViewModel> {
  // MARK: - Constants
  struct Constants {
    static let TitleView = "RedViewController"
    static let NextButtonTitle = "Go to yellow view"
    static let ButtonHeightDefault: CGFloat = 50
  }
  
  // MARK: - Components
  var nextViewButton: UIButton = {
    var btn = UIButton()
    btn.setTitle(Constants.NextButtonTitle, for: .normal)
    btn.setTitleColor(.black, for: .normal)
    btn.translatesAutoresizingMaskIntoConstraints = false
    return btn
  }()
  
  // MARK: - Variables
  let disposeBag = DisposeBag()
  
  // MARK: - Life cycle
  convenience init() {
    self.init(viewModel: RedViewModel())
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    title = Constants.TitleView
    view.backgroundColor = .red
  }
  
  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    addLayout()
    addLayoutConstraint()
  }
  
  override func bindView() {
    super.bindView()
    
    nextViewButton.rx.tap
      .observe(on: MainScheduler.instance)
      .subscribe(onNext: nextView)
      .disposed(by: disposeBag)
  }
  
  override class func description() -> String {
    return Constants.TitleView
  }
}

// MARK: - Layout
extension RedViewController {
  func addLayout() {
    view.addSubview(nextViewButton)
  }
  
  func addLayoutConstraint() {
    NSLayoutConstraint.activate([
      nextViewButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
      nextViewButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      nextViewButton.heightAnchor.constraint(equalToConstant: Constants.ButtonHeightDefault)
    ])
  }
}

// MARK: - Functions
private extension RedViewController {
  
  func nextView() {
    let controller = YellowViewController()
    self.navigationController?.pushViewController(controller, animated: true)
  }
}
