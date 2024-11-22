Name "Sample App"
OutFile "SampleAppInstaller.exe"
InstallDir "$LOCALAPPDATA\SampleApp"
RequestExecutionLevel user

Section
    SetOutPath $INSTDIR
    File /r "bin\Release\net8.0-windows\win-x64\publish\*.*"
SectionEnd

Section "Uninstall"
    Delete "$INSTDIR\*.*"
    RMDir /r "$INSTDIR"
SectionEnd
