@chcp 65001
@echo OFf 



echo [30,0,40m AAAAAAAAAAAAAAAAA
echo [31,0,40m AAAAAAAAAAAAAAAAA
echo [31;1,0,40m AAAAAAAAAAAAAAAAA
echo [33m AAAAAAAAAAAAAAAAAecho [30,0,40m AAAAAAAAAAAAAAAAA
echo [31,0,44m AAAAAAAAAAAAAAAAA
echo [31;1,0,44m AAAAAAAAAAAAAAAAA
echo [31m AAAAAAAAAAAAAAAAA
echo [5m AAAAAAAAAAAAAAAAA

set SafrTextDefault=[40m[1m
set SafrBcknddWhite=[47m[1m
set SafrsBrigRed=[31;1m%SafrTextDefault%
set SafrsDarkRed=[31m%SafrTextDefault%
set SafrsBrWhite=[37;1m%SafrTextDefault%
set SafrsBYellow=[33m%SafrTextDefault%
set SafrsBlink=[5m%SafrTextDefault%
set SafrTextReset=[40m[0m[37m

echo %SafrsBrigRed%  SafrsBrigRed
echo %SafrsDarkRed%  SafrsDarkRed
echo %SafrsBrWhite%  SafrsBrWhite
echo %SafrsBYellow%  SafrsBYellow
echo %SafrsBrigRed%%SafrBcknddWhite%  SafrsBrigRed
echo %SafrsDarkRed%%SafrBcknddWhite%  SafrsDarkRed
echo %SafrsBrWhite%%SafrBcknddWhite%  SafrsBrWhite
echo %SafrsBYellow%%SafrBcknddWhite%  SafrsBYellow%SafrTextReset%




 