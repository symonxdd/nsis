# Define the path to your CHANGELOG.md file
$changelogPath = "CHANGELOG.md"

# Define the version to extract notes for
$version = "2.0.7"

# Read the file content (ensure it exists)
if (-Not (Test-Path $changelogPath)) {
    Write-Error "CHANGELOG.md file not found at $changelogPath"
    exit 1
}

# Read the file as a single string
$content = Get-Content $changelogPath -Raw

# Regex pattern to extract the release notes for the given version
$pattern = "(?s)## \[$version\](.*?)(\n## \[|\Z)"

# Match the pattern
$matches = [regex]::Matches($content, $pattern)

if ($matches.Count -eq 0) {
    Write-Output "No release notes found for version $version."
} else {
    $releaseNotes = $matches[0].Groups[1].Value.Trim()
    Write-Output "Extracted Release Notes:`n$releaseNotes"
}
