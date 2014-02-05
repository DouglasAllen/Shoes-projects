call java -jar  jruby-complete-1.7.4.jar -e "$:<< './../../../../../lib'; require 'shoes'; require 'shoes/configuration'; Shoes.configuration.backend = :swt; require '%1' "
REM ~ call jruby --1.9 -e "$:<< 'lib'; require 'shoes'; require 'shoes/configuration'; Shoes.configuration.backend = :swt; require '%1' "
REM ~ call java -jar -cp ./../../../../vendor/jruby-complete-1.7.4.jar -e "$:<< 'lib'; require 'shoes'; require 'shoes/configuration'; Shoes.configuration.backend = :swt; require '%1' "
