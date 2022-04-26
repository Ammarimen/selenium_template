set /p APPLI=Nom Appli :

git clone https://bitbucket.agilefabric.fr.carrefour.com/scm/qod/selenium_template_extentv5.git %APPLI%_Selenium

cd %APPLI%_Selenium

powershell -Command "(gc pom.xml) -replace 'appName', '%APPLI%' | Out-File -encoding UTF8 pom.xml"

cd src\main\resources

powershell -Command "(gc email.properties) -replace 'appName', '%APPLI%' | Out-File -encoding UTF8 email.properties"

cd ..\..\test\resources

powershell -Command "(gc extent-config.xml) -replace 'appName', '%APPLI%' | Out-File -encoding UTF8 extent-config.xml"

powershell -Command "(gc appName.xml) -replace 'appName', '%APPLI%' | Out-File -encoding UTF8 appName.xml"

ren appName.xml %APPLI%.xml