Gem::Specification.new do |s|
  s.name = 'update_attribute_with_validations'
  s.version = '0.1.0'
  s.author = 'Jonathan Garvin'

  s.description = <<-EOF
    Changes ActiveRecord's update_attribute (singular) method to behave more intuitively and consistently like
    update_attributes (plural). ActiveRecord's built-in update_attribute (singular) will not check validations
    on the object before saving, unlike update_attributes (plural), which will.  
    
EOF
  s.summary = %q{Changes ActiveRecord's update_attribute (singular) method to behave like update_attributes (plural)}
  s.homepage = %q{http://github.com/jsgarvin/update_attribute_with_validations}

  s.add_dependency('activerecord', '>= 3.0.1')

  s.files = Dir['lib/*']
  s.require_path = 'lib'
end