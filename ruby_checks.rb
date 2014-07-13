# check that the ruby version is 2+
def ruby_version
  ruby_2 = Gem::Version.new('2.0.0')
  ruby_personal = Gem::Version.new(RUBY_VERSION)
  if ruby_2 >= ruby_personal
    puts "Ruby version is: #{RUBY_VERSION}"
    puts 'Ruby needs to be upgraded to 2+'.red
    return false
  end
  true
end

# check if it's the Mavericks install
def ruby_mavericks
  ruby_location = `which ruby`
  unless ruby_location.start_with?('/Users/')
    puts "Ruby installed at: #{ruby_location}"
    puts 'This is a Mavericks install'.red
    puts 'Please follow the directions at'.yellow
    puts "\thttp://railsinstallfest.org/guides/installfest41/rails_on_mavericks/".yellow
    return false
  end
  true
end

def check_ruby
  final_check('Ruby', ->(){ ruby_version && ruby_mavericks })
end