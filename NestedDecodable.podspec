Pod::Spec.new do |s|

    s.platforms = { :ios => "8.0", :osx => "10.10" }

    s.name = "NestedDecodable"
    s.summary = "Directly decode JSON model with nested key"
    s.requires_arc = true

    s.version = "0.0.1"
    s.license = 'MIT'
    s.author = { "Wirawit" => "aun.wirawit@gmail.com" }
    s.homepage = "https://github.com/aunnnn/NestedDecodable"

    s.source = { :git => "https://github.com/aunnnn/NestedDecodable.git", :tag => "#{s.version}"}
    s.framework = "Foundation"

    s.source_files = "NestedDecodable.swift"
    s.swift_version = '4.0'
end
