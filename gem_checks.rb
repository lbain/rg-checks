def gem_installed(gem_name)
  begin
    Gem::Specification.find_by_name(gem_name)
  rescue Exception
    puts "#{gem_name.capitalize} is not installed".red
    puts "You can install #{gem_name.capitalize} by putting".yellow
    puts "\tbundle install #{gem_name}".yellow
    puts "  in your command line".yellow
    return false
  end
  true
end

def gem_version(lowest_version, gem_name)
  lowest_version = Gem::Version.new(lowest_version)
  personal_version = Gem::Specification.find_by_name(gem_name).version
  if lowest_version >= personal_version
    puts "#{gem_name} version is: #{personal_version}"
    puts "#{gem_name} needs to be upgraded to #{lowest_version}+".red
    return false
  end
  true
end

def check_rails
  final_check('Rails', ->(){ gem_installed('rails') && gem_version('4.0.0', 'rails') })
end

def check_sinatra
  final_check('Sinatra', ->(){ gem_installed('sinatra') })
end

def check_mini_test
  final_check('MiniTest', ->(){ gem_installed('minitest') })
end