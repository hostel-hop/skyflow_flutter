Pod::Spec.new do |s|
    s.name             = 'skyflow_flutter'
    s.version          = '0.0.1'
    s.summary          = 'A new Flutter plugin project.'
   
    s.description      = <<-DESC
  A new Flutter plugin project.
                         DESC
    s.homepage         = 'http://example.com'
    s.license          = { :file => '../LICENSE' }
    s.author           = { 'Your Company' => 'email@example.com' }
    s.source           = { :git => 'git@github.com:hostel-hop/skyflow_ios.git', :tag => '0.0.1' }
    s.source_files     = 'Classes/*.{h,m}'
    s.dependency 'Flutter'
    s.dependency 'Skyflow', '1.19.0'
    s.xcconfig = { 'ENABLE_BITCODE' => 'NO', }
    s.platform = :ios, '13.0'
  
    # Flutter.framework does not contain a i386 slice.
    s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386' }
    s.swift_version = '5.0'
  end