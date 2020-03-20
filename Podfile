source 'https://cdn.cocoapods.org/'
platform :ios, '13.2'
use_frameworks!

def install_pods
    pod 'RxSwift', '~> 5'
    pod 'RxCocoa', '~> 5'
    pod 'Alamofire', '~> 5.0'
    pod 'SVProgressHUD'
    pod 'Kingfisher', '~> 5.0'
end

def install_unit_test_pods
    pod 'Quick'
    pod 'Nimble'
end

target 'RubyTranslator' do
    install_pods
end

target 'RubyTranslatorTests' do
    install_unit_test_pods
end