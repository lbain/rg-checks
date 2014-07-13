#!/usr/bin/env ruby
require 'rubygems' # not needed with Ruby 1.9+
require 'Open3'

require_relative 'colour_strings'
require_relative 'ruby_checks'
require_relative 'gem_checks'
require_relative 'git_checks'

def final_check(name, proc)
  puts "Checking #{name}..."
  result = false
  if proc.call
    puts "#{name} is OK!".green
    result = true
  end
  puts
  return result
end

def run_full_checks
  return unless check_ruby
  check_rails
  check_git
  check_sinatra
  check_mini_test
end

run_full_checks