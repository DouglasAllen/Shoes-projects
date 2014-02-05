@ECHO OFF
REM ~ -e "$:<< 'lib'; require 'shoes'; require 'shoes/configuration'; Shoes.configuration.backend = :swt; require '%1' "
call jruby --1.9 -e "$:<< 'lib'; require 'shoes'; require 'shoes/configuration'; Shoes.configuration.backend = :swt; require '%1' "

