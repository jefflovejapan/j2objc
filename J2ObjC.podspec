Pod::Spec.new do |s|
  s.name         = "J2ObjC"
  s.version      = "0.9.7"
  s.license      = { :type => 'Apache License, Version 2.0', :file => 'LICENSE' }
  s.summary      = "J2ObjC's JRE emulation library, emulates a subset of the Java runtime library."
  s.homepage     = "https://github.com/google/j2objc"
  s.author       = "Google Inc."
  s.source       = { :git => "https://github.com/jefflovejapan/j2objc.git", :tag => s.version.to_s }

  # Top level attributes can't be specified by subspecs.
  s.vendored_libraries = 'dist/lib/libj2objc_main.a', 'dist/lib/libjre_emul.a'
  s.frameworks = 'Security'
  s.libraries = 'icucore', 'z'
end
