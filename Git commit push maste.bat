:: #################################################################
:: #                                                               #
:: #            THIS BLOCK WILL MADE A NEW VERSION  lm             #
:: #                                                               #
:: #################################################################
:: version folder
Set VersionCountLM=C:\ALIENWAREB\SoAkiSemEsp\MyVersionControl\VersionCountLM.txt
Set VersionLogLM=C:\ALIENWAREB\SoAkiSemEsp\MyVersionControl\VersionLogLM.txt
:: the code....
for /f "delims=" %%x in (%VersionCountLM%) do set BuildVerLM=%%x
set /a BuildVerLM=%BuildVerLM% + 1
ECHO %BuildVerLM% > %VersionCountLM%
ECHO ver- %BuildVerLM% _em %date% %time% _ %cd% >> %VersionLogLM%
:: the new version number will be in %BuildVerLM% 
ECHO A nova versao do agora eh: %BuildVerLM% 
ECHO New version: %BuildVerLM% 
:: ######################## FIM #######################################





::PRIMEIRAS LINHAS SAO PARA CRIAR OS DIAS, NAO APAGA
@ECHO OFF
:: Check WMIC is available
WMIC.EXE Alias /? >NUL 2>&1 || GOTO s_error
:: Use WMIC to retrieve date and time
FOR /F "skip=1 tokens=1-6" %%G IN ('WMIC Path Win32_LocalTime Get Day^,Hour^,Minute^,Month^,Second^,Year /Format:table') DO (
   IF "%%~L"=="" goto s_done
      Set _yyyy=%%L
      Set _mm=00%%J
      Set _dd=00%%G
      Set _hour=00%%H
      SET _minute=00%%I
      SET _second=00%%K
)
:s_done
:: Pad digits with leading zeros
      Set _mm=%_mm:~-2%
      Set _dd=%_dd:~-2%
      Set _hour=%_hour:~-2%
      Set _minute=%_minute:~-2%
      Set _second=%_second:~-2%
GOTO COMECA_AQUI
goto make_dump
:s_error
echo WMIC is not available, NAO FUNCIONOU!
pause
pause
pause
pause
pause
pause
pause
pause
EXIT
:make_dump
EXIT




:COMECA_AQUI
:: COMECA AQUI ------
ECHO ON


::crio a pasta para publicar
mkdir .\docs

::copio usando 2 metodos, pq as vezes o xcopy nao copia arquivo aberto
::xcopy ".\build" ".\docs" /e /y
::Robocopy ".\build" ".\docs" /MIR /PURGE

:: troquei para parar de mostrar a hora
::Set defaultComment=%_yyyy% %_mm% %_dd% %_hour% %_minute% %_second%
Set defaultComment=%_yyyy% %_mm% %_dd% _ %BuildVerLM%

::se quiser add algo no final, set /p comment=
set comment= "%defaultComment% %comment%"

:: ADD ALL
git add .

::commit
git commit -am %comment%

::manda para o alem
git push origin master

ECHO OFF
ECHO .
ECHO .     DEU CERTO?
ECHO .   enter    =  sai
ECHO .   1 2 3    =  open_GitHub
ECHO .    f       =  git push origin master --force
ECHO .
set /p opcao=


if "%opcao%"=="1" goto open_GitHub
if "%opcao%"=="2" goto open_GitHub
if "%opcao%"=="3" goto open_GitHub

if "%opcao%"=="f" goto force_GitHub


::se apertar enter, ele chega aqui

EXIT
:open_GitHub
start open_GitHub_of_this_repository.lnk
EXIT


EXIT
:force_GitHub
ECHO ON
git push origin master --force
PAUSE
EXIT



@ECHO OFF
ECHO .
ECHO .          ACABEI
ECHO . 
Pause
exit
exit
exit
exit
exit



--antigo------------------------------------------------------------------------------------------------------------------------------------








::--------------------------------altere aqui o repositorio
:: :::::::::::::::::::::::::Set defaultRepos="https://github.com/leodecm3/time_there_flutter_web.git"
Set defaultComment=%_yyyy% %_mm% %_dd% %_hour% %_minute% %_second%


@ECHO OFF
ECHO .
ECHO .
ECHO .  LEONARDO VOU ENVIAR ESSA PASTA PARA O GIT
ECHO .        ALGUMAS PERGUNTAS:
ECHO .
ECHO .           1) repository
ECHO .           2) comment
ECHO .
ECHO .
ECHO .
ECHO repositorio eh esse?  %defaultRepos%
set repo=""
::set /p repo=""
if "%repo%"=="" ; set repo=%defaultRepos%


ECHO comments?
set comment=
::set /p comment=
set comment= "%defaultComment% %comment%"


ECHO .
ECHO .
ECHO .
ECHO repo: %repo%
ECHO comment: %comment%
ECHO ON

::inicia 
git init

:: ADD ALL
git add .

::commit
git commit -am %comment%

::aponta para o diretorio que vai enviar
::git remote add origin %repo%

::manda para o alem
git push origin master





start "Chrome" "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe" %defaultRepos%
PAUSE