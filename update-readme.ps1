# Define the path to the README.md file
$readmePath = "README.md"

# Read the content of README.md
$readme = Get-Content $readmePath

# Define the download URL (you can dynamically fetch this or hardcode it)
$downloadUrl = "https://github.com/symonxdd/nsis/releases/latest/download/SampleAppInstaller-6.0.9.exe"

# Replace href attributes that contain "#link_to_be_inserted" or ".exe"
$updated = $readme -replace "href='[^']*(#link_to_be_inserted|\.exe)[^']*'", "href='$downloadUrl'"
# $updated = $readme -replace "href='[^']*(#link_to_be_inserted|\.exe)[^']*'", "href='$downloadUrl'"

# Replace markdown links containing `#link_to_be_inserted` or `.exe` in the URL part and where the display text is 'here'
$updated = $updated -replace '\[here\]\([^\)]*(#link_to_be_inserted|\.exe)[^\)]*\)', "[here]($downloadUrl)"

# Save the updated content back to README.md
$updated | Set-Content $readmePath

# Output to confirm the script worked
Write-Host "README.md has been updated with the download link."
