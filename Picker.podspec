Pod::Spec.new do |s|
  s.name         = "Picker"
  s.version      = "0.2"
  s.license      = "MIT"

  s.summary      = "Pick a value using a promise"

  s.description  = <<-DESC
Pick a value using a promise, supporting user cancellation and system interruption.
                   DESC

  s.authors           = { "Tom Lokhorst" => "tom@lokhorst.eu" }
  s.social_media_url  = "https://twitter.com/tomlokhorst"
  s.homepage          = "https://github.com/Q42/Picker"

  s.ios.deployment_target = '9.0'
  s.tvos.deployment_target = '9.0'
  s.osx.deployment_target = '10.11'

  s.source          = { :git => "https://github.com/Q42/Picker.git", :tag => s.version }
  s.requires_arc    = true
  s.default_subspec = "Core"

  s.subspec "Core" do |ss|
    ss.source_files  = "Sources"
    ss.dependency "Promissum", "~> 3"
  end

end
