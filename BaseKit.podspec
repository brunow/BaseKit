Pod::Spec.new do |s|
  current_version = "0.3.dev"

  s.name     = 'BaseKit'
  s.version  = current_version
  s.license  = 'Apache 2'
  s.summary  = 'BaseKit is a set of IOS class to make your life easier.'
  s.homepage = 'https://github.com/brunow/BaseKit'
  s.author   = { 'Bruno Wernimont' => 'bruno.wernimont+github@gmail.com' }
  s.source   = { :git => 'https://github.com/brunow/BaseKit.git' }
  s.requires_arc = true
  s.framework = 'UIKit'
  s.description = 'BaseKit is a set of IOS class to make your life easier.'
  s.platform = :ios, '4.0'
  s.clean_paths  = 'Examples', 'Kiwi', 'Test', 'Vendor', 'README.md', '.gitignore', 'BaseKit.xcodeproj', 'LICENSE', 'form-mapping.png', 'BaseKit', 'BaseKitTests'

  s.subspec 'All' do |all|
    core_data.dependency 'BaseKit/Core'
    core_data.dependency 'BaseKit/CoreData'
    core_data.dependency 'BaseKit/View'
    core_data.dependency 'BaseKit/CellMapping'
    core_data.dependency 'BaseKit/LocationManager'
    core_data.dependency 'BaseKit/FormField'
    core_data.dependency 'BaseKit/FormMapping'
  end

  s.subspec 'Core' do |core|
    core.source_files = 'Code/Core/*.{h,m}'
  end

  s.subspec 'CoreData' do |core_data|
    core_data.source_files = 'Code/CoreData/*.{h,m}'
    core_data.dependency 'BaseKit/Core'
  end

  s.subspec 'View' do |view|
    view.source_files = 'Code/View/*.{h,m}'
    view.dependency 'BaseKit/Core'
  end

  s.subspec 'CellMapping' do |cell_mapping|
    cell_mapping.source_files = 'Code/CellMapping/*.{h,m}'
    cell_mapping.dependency 'BaseKit/Core'
    cell_mapping.dependency 'BaseKit/View'
  end

  s.subspec 'LocationManager' do |location_manager|
    location_manager.source_files = 'Code/LocationManager/*.{h,m}'
    location_manager.framework = 'CoreLocation'
    location_manager.dependency 'BaseKit/Core'
  end

  s.subspec 'FormField' do |form_field|
    form_field.source_files = 'Code/FormField/*.{h,m}'
    form_field.dependency 'BaseKit/Core'
    form_field.dependency 'BaseKit/View'
  end

  s.subspec 'FormMapping' do |form_mapping|
    form_mapping.source_files = 'Code/FormMapping/*.{h,m}'
    form_mapping.dependency 'BaseKit/Core'
    form_mapping.dependency 'BaseKit/View'
    form_mapping.dependency 'BaseKit/FormField'
    form_mapping.dependency 'BWLongTextViewController', '~> 1.0'
    form_mapping.dependency 'ActionSheetPicker2', '~> 0.1'
  end

  s.subspec 'ViewDecorator' do |view_decorator|
    view_decorator.source_files = 'Code/ViewDecorator/*.{h,m}'
    view_decorator.dependency 'BaseKit/Core'
  end
end