Pod::Spec.new do |s|
  s.name         = "Picker"
  s.version      = "0.4"
  s.license      = "MIT"

  s.summary      = "Pick a value using a promise"

  s.description  = <<-DESC
Pick a value using a promise, supporting user cancellation and system interruption.
                   DESC

  s.authors           = { "Tom Lokhorst" => "tom@lokhorst.eu" }
  s.social_media_url  = "https://twitter.com/tomlokhorst"
  s.homepage          = "https://github.com/Q42/Picker"

  s.ios.deployment_target = '10.0'
  s.osx.deployment_target = '10.12'
  s.tvos.deployment_target = '10.0'
  s.watchos.deployment_target = '3.0'

  s.source          = { :git => "https://github.com/Q42/Picker.git", :tag => s.version }
  s.requires_arc    = true
  s.default_subspec = "Core"
  s.swift_version   = '5.1'

  s.subspec "Core" do |ss|
    ss.source_files  = "Sources/Picker/"
    ss.dependency "Promissum", "~> 5"
  end

end
