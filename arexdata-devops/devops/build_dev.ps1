param (
    [string] $build
)

# Dummy environment variables for demonstration
$env:ENVIRONMENT = "dev"
$env:RELEASE = "26.1.217"
$env:AREXDATA_BUILD_NUMBER = "4325"
$env:AREXDATA_REVISION_NUMBER = "0"

function Write-Header() {
    param([string]$text)
    Write-Host ""
    Write-Host "====[ $text ]================================================================="
}

# Compute version
$environment = $env:ENVIRONMENT
$image_version = "$($env:RELEASE).$($env:AREXDATA_BUILD_NUMBER).$($env:AREXDATA_REVISION_NUMBER)"

# Print configuration
Write-Header "Configuration"
Write-Host "Version: $image_version"
Write-Host "Environment: $environment"
Write-Host "Release: $($env:RELEASE)"
Write-Host "Build Number: $($env:AREXDATA_BUILD_NUMBER)"
Write-Host "Revision Number: $($env:AREXDATA_REVISION_NUMBER)"
Write-Host "Params: " $PSBoundParameters
Write-Host ""

# Optional: Print which build would run
if ($build) {
    Write-Header "Build $build"
    Write-Host "Skipping actual build steps in CI/CD simulation."
}
