//
//  RootViewController.swift
//  BreakRetainCycle
//
//  Created by MesaMobileThinking on 06/07/21.
//

import UIKit
import RxSwift
import RxCocoa

// MARK: - RootViewController
class RootViewController: BaseViewController<RootViewModel> {
  // MARK: - Constants
  struct Constants {
    static let TitleView = "RootViewController"
    static let NextButtonTitle = "Go to red view"
    static let GenerateLeakButtonTitle = "Generate leak"
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
  
  var generateLeakButton: UIButton = {
    var btn = UIButton()
    btn.setTitle(Constants.GenerateLeakButtonTitle, for: .normal)
    btn.setTitleColor(.black, for: .normal)
    btn.translatesAutoresizingMaskIntoConstraints = false
    return btn
  }()
  
  // MARK: - Variables
  let disposeBag = DisposeBag()
  
  // MARK: - Life cycle
  convenience init() {
    self.init(viewModel: RootViewModel())
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    title = Constants.TitleView
    view.backgroundColor = .white
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
    
    generateLeakButton.rx.tap
      .observe(on: MainScheduler.instance)
      .subscribe(onNext: generateLeak)
      .disposed(by: disposeBag)
  }
  
  override class func description() -> String {
    return Constants.TitleView
  }
}

// MARK: - Layout
extension RootViewController {
  func addLayout() {
    view.addSubview(nextViewButton)
    view.addSubview(generateLeakButton)
  }
  
  func addLayoutConstraint() {
    NSLayoutConstraint.activate([
      nextViewButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
      nextViewButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      nextViewButton.heightAnchor.constraint(equalToConstant: Constants.ButtonHeightDefault)
    ])
    
    NSLayoutConstraint.activate([
      generateLeakButton.topAnchor.constraint(equalTo: nextViewButton.bottomAnchor),
      generateLeakButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      generateLeakButton.heightAnchor.constraint(equalToConstant: Constants.ButtonHeightDefault)
    ])
  }
}

// MARK: - Functions
private extension RootViewController {
  
  func generateLeak() {
    var server: Server? = Server(name: self.description)
    
    var client: Client?
  
    if let server = server {
      client = Client(server: server)
    }
    
    print(client?.server.name ?? "nil")
    
    client = nil
    server = nil
  }
  
  func nextView() {
    let controller = RedViewController()
    self.navigationController?.pushViewController(controller, animated: true)
  }
}
