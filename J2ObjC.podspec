Pod::Spec.new do |s|
  s.name         = "J2ObjC"
  s.version      = "0.9.6.1"
  s.license      = { :type => 'Apache License, Version 2.0', :file => 'LICENSE' }
  s.summary      = "J2ObjC's JRE emulation library, emulates a subset of the Java runtime library."
  s.homepage     = "https://github.com/google/j2objc"
  s.author       = "Google Inc."
  s.source       = { :git => "https://github.com/goodow/j2objc.git", :tag => "v#{s.version}-lib" }

  s.ios.deployment_target = '5.0'
  s.osx.deployment_target = '10.7'
  s.requires_arc = false
  s.default_subspec = 'lib/jre'

  # Top level attributes can't be specified by subspecs.
  s.header_mappings_dir = 'dist/include'
  s.source = {
    http: 'https://github.com/google/j2objc/releases/download/#{s.version}/j2objc-#{s.version}.zip',
    sha1: 'e4688c50adc169599b01789b3e6ee9d8c750092a'
  }

  s.subspec 'lib' do |lib|
    lib.frameworks = 'Security'
    lib.osx.frameworks = 'ExceptionHandling'
    lib.xcconfig = { 'HEADER_SEARCH_PATHS' => '"${PODS_ROOT}/J2ObjC/dist/include"' }

    lib.subspec 'jre' do |jre|
      jre.preserve_paths = 'dist'
      jre.libraries = 'icucore', 'z'
      jre.vendored_libraries = 'dist/#{lib.base_name}/libjre_emul.a'
    end

    lib.subspec 'jsr305' do |jsr305|
      jsr305.dependency 'J2ObjC/lib/jre'
      jsr305.vendored_libraries = 'dist/#{lib.base_name}/lib#{jsr305.base_name}.a'
    end

    lib.subspec 'junit' do |junit|
      junit.dependency 'J2ObjC/lib/jre'
      junit.vendored_libraries = 'dist/#{lib.base_name}/lib#{junit.base_name}.a', 'dist/#{lib.base_name}/libj2objc_main.a', 'dist/#{lib.base_name}/libmockito.a'
    end

    lib.subspec 'guava' do |guava|
      guava.dependency 'J2ObjC/lib/jre'
      guava.vendored_libraries = 'dist/#{lib.base_name}/lib#{guava.base_name}.a'
    end
  end
end
