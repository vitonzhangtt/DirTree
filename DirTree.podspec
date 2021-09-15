#
# Be sure to run `pod lib lint DirTree.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'DirTree'
  s.version          = '0.1.0'
  s.summary          = 'Print the information about each node in a certain directory(Swift version).'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
  Print the information about each node in a certain directory(Swift version).
  Now the information for each node only contains: sizeInByte.
  
  This library is inspired from tree(http://mama.indstate.edu/users/ice/tree/) command tool.
  You could install tree on your computer, it is a very nice tool. 
                       DESC

  s.homepage         = 'https://github.com/vitonzhangtt/DirTree'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'vitonzhangtt' => 'vitonzhang@gmail.com' }
  s.source           = { :git => 'https://github.com/vitonzhangtt/DirTree.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'
  s.swift_versions   = '5.0.0'
  s.ios.deployment_target = '11.0'
  
  s.source_files = 'Sources/DirTreeLib/*.swift'
  s.dependency 'Files', '4.0.0'
  
end