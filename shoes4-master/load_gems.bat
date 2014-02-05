@echo off
REM ~ call java -jar vendor/jruby-complete-1.7.4.jar -S gem install -i vendor/gem_home --no-rdoc --no-ri bundler
set GEM_HOME=vendor/gem_home
set GEM_PATH=vendor/gem_home
REM ~ call java -jar vendor/jruby-complete-1.7.4.jar -S gem list
REM ~ call java -jar vendor/jruby-complete-1.7.4.jar -S vendor/gem_home/bin/bundle install --path=vendor/bundle --binstubs
REM ~ call java -jar vendor/jruby-complete-1.7.4.jar -S bin/rake -T
REM ~ call java -jar vendor/jruby-complete-1.7.4.jar -S vendor/gem_home/bin/bundle package
call java -jar vendor/jruby-complete-1.7.4.jar -e "$:<< 'lib'; require 'shoes'; require 'shoes/configuration'; Shoes.configuration.backend = :swt; require '%1' "  
