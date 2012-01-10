require 'rake'

desc "install the files into the user's home directory"
task :install do
  replace_all = ENV['replace_all'] || false
  force_all= ENV['force_all'] || false
  
  Dir['*'].each do |file|
    next if file == 'Rakefile'
    
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
end

def replace_file(file)
  system %Q{rm -rf "$HOME/.#{file}"}
  link_file(file)
end

def link_file(file)
  puts "linking ~/.#{file}"
  system %Q{ln -s "$PWD/#{file}" "$HOME/.#{file}"}
end