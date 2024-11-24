Name "Sample App"
OutFile "SampleAppInstaller.exe"
InstallDir "$LOCALAPPDATA\SampleApp"
RequestExecutionLevel user

Section
    SetOutPath $INSTDIR
    File /r "bin\Release\net8.0-windows\win-x64\publish\*.*"

    ; Write a value to the registry
    WriteRegStr HKCU "Software\SampleApp" "InstallDir" "$INSTDIR"

    ; Debug: Read the value back from the registry
    ReadRegStr $0 HKCU "Software\SampleApp" "InstallDir"
    MessageBox MB_OK "Registry InstallDir: $0"
SectionEnd

Section "Uninstall"
    ; Delete all files and remove the installation directory
    Delete "$INSTDIR\*.*"
    RMDir /r "$INSTDIR"

    ; Remove the registry key
    DeleteRegKey HKCU "Software\SampleApp"
SectionEnd
