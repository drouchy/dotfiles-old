require 'rake'

task :default => ["install"]

desc "install the files into the user's home directory"
task :install do
  replace_all = ENV['ra'] || false
  force_all= ENV['fa'] || false
  
  if Dir.exist? "#{ENV['HOME']}/jclem_dotfiles_backup"
    puts "Removing previous backup directory at ~/jclem_dotfiles_backup"
    system %Q{rm -rf #{ENV['HOME']}/jclem_dotfiles_backup}
  end

  puts "Creating backup directory in ~/jclem_dotfiles_backup"
  system %Q{mkdir $HOME/jclem_dotfiles_backup}

  Dir['*'].each do |file|
    # Add to this array for ignoring files.
    if file == 'zsh-custom'
      Dir.entries('oh-my-zsh/custom').each do |file|
        next if %w[example example.zsh . ..].include? file
        unless Dir.new('zsh-custom').entries.include? file
          puts "Removing oh-my-zsh/custom/#{file}"
          system %Q{rm -rf $PWD/oh-my-zsh/custom/#{file}}
        end
      end
      
      Dir.new(file).entries.each do |file|
        next if %w[. ..].include? file
        puts "Replacing zsh-custom/#{file} to oh-my-zsh/custom/#{file}"
        system %Q{rm -rf $PWD/oh-my-zsh/custom/#{file}}
        system %Q{cp -r $PWD/zsh-custom/#{file} $PWD/oh-my-zsh/custom/#{file}}
      end
    end
    
    next if %w[Rakefile zsh-custom].include? file
    
    if force_all
      replace_file(file)
    elsif File.exist? File.join(ENV['HOME'], ".#{file}")
      if File.identical? file, File.join(ENV['HOME'], ".#{file}")
        puts "identical: ~/.#{file}"
      elsif replace_all
        replace_file(file)
      else
        print "overwrite ~/.#{file}? [ynaq] "
        case $stdin.gets.chomp
        when 'y'
          replace_file(file)
        when 'a'
          replace_all = true
          replace_file(file)
        when 'q'
          puts "stopping installation"
          exit
        else
          puts "skipping ~/.#{file}"
        end
      end
    else
      link_file(file)
    end
  end
  
  puts "Installation complete!"
end

desc "copies bash/aliases and bash/functions to zsh-custom/aliases.zsh and zsh-custom/functions.zsh"
task :copy_bash_to_zsh do
  system %Q{ cp bash/aliases zsh-custom/aliases.zsh }
  system %Q{ cp bash/functions zsh-custom/functions.zsh }
end

def replace_file(file)
  system %Q{mv "$HOME/.#{file}" "$HOME/jclem_dotfiles_backup"}
  link_file(file)
end

def link_file(file)
  puts "linking ~/.#{file}"
  system %Q{ln -s "$PWD/#{file}" "$HOME/.#{file}"}
end
