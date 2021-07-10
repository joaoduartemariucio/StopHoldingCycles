# Uncomment the next line to define a global platform for your project
platform :ios, '12.1'
inhibit_all_warnings!

target 'StopHoldingCycles' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for StopHoldingCycles
  pod 'LifetimeTracker'
  pod 'RxSwift'
  pod 'RxCocoa'
  pod "SwiftLint"

  target 'StopHoldingCyclesTests' do
    inherit! :search_paths
    # Pods for testing
    pod 'RxBlocking'
    pod 'RxTest'
  end

  target 'StopHoldingCyclesUITests' do
    # Pods for testing
  end

end

post_install do |pi|
  pi.pods_project.targets.each do |t|
    t.build_configurations.each do |bc|
      bc.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '12.1'
    end
  end
end
