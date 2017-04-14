Pod::Spec.new do |s|

  s.name         = "KRNPageViewController"
  s.version      = "0.0.1"
  s.summary      = "KRNPageViewController is a wrapper of UIPageViewController that simplifies its usage"

  s.homepage     = "https://github.com/ulian-onua/KRNPageViewController"

  s.license      = { :type => "MIT", :file => "LICENSE" }


  s.author              = { "Julian Drapaylo" => "ulian.onua@gmail.com" }
  #s.social_media_url   = "http://www.linkedin.com/in/julian-drapaylo"


  s.platform     = :ios, "8.0"

  s.source       = { :git => "https://github.com/ulian-onua/KRNPageViewController.git", :tag => "0.0.1" }


  s.source_files  = "KRNPageViewController/*.{h,m}"
  s.public_header_files = "KRNPageViewController/*.h"

  s.frameworks = "Foundation", "UIKit"
  s.requires_arc = true

end
