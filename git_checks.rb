def git_installed
  git_path = `which git`
  if git_path.empty?
    puts 'Git is not installed'.red
    return false
  end
  true
end

# check that the SSH keys are up on GitHub
def git_ssh_keys
  stdin, stdout, stderr = Open3.popen3('ssh -T git@github.com')
  github_return = stderr.gets
  unless github_return.start_with?('Hi')
    puts "Your ssh keys aren't on GitHub".red
    puts 'Please set up your keys by following the directions at'.yellow
    puts "\thttps://help.github.com/articles/generating-ssh-keys".yellow
    return false
  end
  true
end

def check_git
  final_check('Git', ->(){ git_installed && git_ssh_keys })
end