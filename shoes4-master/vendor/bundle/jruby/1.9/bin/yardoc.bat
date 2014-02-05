@ECHO OFF
IF NOT "%~f0" == "~f0" GOTO :WinNT
@"jruby-complete-1.7.4.jar" "F:/Github/Shoes-projects/shoes4-master/vendor/bundle/jruby/1.9/bin/yardoc" %1 %2 %3 %4 %5 %6 %7 %8 %9
GOTO :EOF
:WinNT
@"jruby-complete-1.7.4.jar" "%~dpn0" %*
