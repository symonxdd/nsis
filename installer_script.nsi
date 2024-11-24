Name "Sample App"
OutFile "SampleAppInstaller.exe"
RequestExecutionLevel user

Section "Install"
    ; Write a value to the registry
    WriteRegStr HKCU "Software\SampleApp" "InstallDir" "$LOCALAPPDATA\SampleApp"

    ; Debug: Read the value back from the registry
    ReadRegStr $0 HKCU "Software\SampleApp" "InstallDir"
    MessageBox MB_OK "Registry InstallDir: $0"
SectionEnd

Section "Uninstall"
    ; Remove the registry key
    DeleteRegKey HKCU "Software\SampleApp"
SectionEnd
