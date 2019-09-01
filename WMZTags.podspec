Pod::Spec.new do |s|

  s.name         = "WMZTags"
  s.version      = "1.0.0"
  s.summary      = "WMZTags test."
  s.description  = <<-DESC 
                    详细描述11111111111111
                   DESC
  s.homepage     = "https://github.com/wwmz/WMZTags"
  s.license      = "MIT"
  s.author       = { "wmz" => "925457662@qq.com" }
  s.platform     = :ios
  s.source       = { :git => "https://github.com/wwmz/WMZTags.git", :tag => "1.0.0" }
  s.source_files = "WMZTags", "WMZTags/**/*.{h,m}"

end
