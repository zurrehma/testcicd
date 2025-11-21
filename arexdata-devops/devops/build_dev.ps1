param (
    [string] $build
)

if ($env:AREXDATA_BUILD_NUMBER) {
    $build_number = $env:AREXDATA_BUILD_NUMBER
} else {
    $build_number = "4325"
}

$image_version = "$($env:RELEASE).$build_number.$($env:AREXDATA_REVISION_NUMBER)"

Write-Host "Build Number: $build_number"
# Dummy environment variables for demonstration
$env:ENVIRONMENT = "dev"
$env:RELEASE = "26.1.217"

$env:AREXDATA_REVISION_NUMBER = "0"

function Write-Header() {
    param([string]$text)
    Write-Host ""
    Write-Host "====[ $text ]================================================================="
}

# Compute version
$environment = $env:ENVIRONMENT
$image_version = "$($env:RELEASE).$build_number.$($env:AREXDATA_REVISION_NUMBER)"

Write-Host "Build Number: $build_number"
# Print configuration
Write-Header "Configuration"
Write-Host "Version: $image_version"
Write-Host "Environment: $environment"
Write-Host "Release: $($env:RELEASE)"
Write-Host "Revision Number: $($env:AREXDATA_REVISION_NUMBER)"
Write-Host "Params: " $PSBoundParameters
Write-Host ""

# Optional: Print which build would run
if ($build) {
    Write-Header "Build $build"
    Write-Host "Skipping actual build steps in CI/CD simulation."
}
