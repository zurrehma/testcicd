# Print all input parameters
Write-Host "====[  Parameters ]================================================================="
foreach($psbp in $PSBoundParameters.GetEnumerator()) {
    "Key={0} Value={1}" -f $psbp.Key,$psbp.Value
}

# Set defaults for environment variables if not already set
if(-not $env:Version) {
    $env:Version = if($version) { $version } else { "${env:RELEASE}.${env:BUILD_NUMBER}" }
}
if(-not $env:Environment -and $environment) { $env:Environment = $environment }
if(-not $env:Operation -and $operation) { $env:Operation = $operation }
if(-not $env:domain -and $domain) { $env:domain = $domain }
if(-not $env:registry -and $registry) { $env:registry = $registry }
if(-not $env:sslredirect -and $sslredirect) { $env:sslredirect = $sslredirect }

# Print Configuration
Write-Header "Configuration"
Write-Host "Version: $env:Version"
Write-Host "Environment: $env:Environment"
Write-Host "Operation: $env:Operation"
Write-Host ""

# Optionally print Apps Config if -apps is specified
if($apps) {
    Write-Header "Apps Config"
    Write-Host "domain: $env:domain"
    Write-Host "arexdata-ui replicas: $env:uireplicas"
    Write-Host "arexdata-api replicas: $env:apireplicas"
    Write-Host "arexdata-ingest replicas: $env:ingestreplicas"
    Write-Host "registry: $env:registry"
    Write-Host "sslredirect: $env:sslredirect"
}
