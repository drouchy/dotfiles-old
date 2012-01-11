require 'rake'

desc "install the files into the user's home directory"
task :install do
  replace_all = ENV['ra'] || false
  force_all= ENV['fa'] || false
  
  Dir['*'].each do |file|
    # Add to this array for ignoring files.
    if file == 'zsh-custom'
      Dir.new(file).entries.each do |file|
        next if %w[. ..].include? file
        puts "Copying $PWD/zsh-custom/#{file} to $PWD/oh-my-zsh/custom/#{file}"
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

def replace_file(file)
  system %Q{rm -rf "~/.#{file}"}
  link_file(file)
end

def link_file(file)
  puts "linking ~/.#{file}"
  system %Q{ln -s "$PWD/#{file}" "~/.#{file}"}
end