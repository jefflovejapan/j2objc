Pod::Spec.new do |s|
  s.name         = "J2ObjC"
  s.version      = "0.9.7"
  s.license      = { :type => 'Apache License, Version 2.0', :file => 'LICENSE' }
  s.summary      = "J2ObjC's JRE emulation library, emulates a subset of the Java runtime library."
  s.homepage     = "https://github.com/google/j2objc"
  s.author       = "Google Inc."
  s.source       = { :git => "https://github.com/jefflovejapan/j2objc.git", :tag => s.version.to_s }

  s.ios.deployment_target = '5.0'
  s.osx.deployment_target = '10.7'
  s.requires_arc = false
  # s.default_subspec = 'lib/jre'

  # Top level attributes can't be specified by subspecs.
  s.header_mappings_dir = 'dist/include'
  s.source_files = 'dist/include/**/*.{h,m}'
  s.vendored_libraries = 'dist/lib/libguava.a', 'dist/lib/libj2objc_main.a', 'dist/lib/libjavax_inject.a', 'dist/lib/libjre_emul.a', 'dist/lib/libjsr305.a', 'dist/lib/libjunit.a', 'dist/lib/libprotobuf_runtime.a', 
  s.prepare_command = <<-CMD
    scripts/download_distribution.sh
  CMD
  
  # s.subspec 'lib' do |lib|
  #   lib.frameworks = 'Security'
  #   lib.osx.frameworks = 'ExceptionHandling'

  #   lib.subspec 'jre' do |jre|
  #     jre.preserve_paths = 'dist'
  #     jre.libraries = 'jre_emul', 'icucore', 'z'
  #   end

  #   lib.subspec 'jsr305' do |jsr305|
  #     jsr305.dependency 'J2ObjC/lib/jre'
  #     jsr305.libraries = 'jsr305'
  #   end

  #   lib.subspec 'junit' do |junit|
  #     junit.dependency 'J2ObjC/lib/jre'
  #     junit.libraries = 'j2objc_main', 'junit', 'mockito'
  #   end
    
  #   lib.subspec 'guava' do |guava|
  #     guava.dependency 'J2ObjC/lib/jre'
  #     guava.libraries = 'guava'
  #   end
  # end
end
