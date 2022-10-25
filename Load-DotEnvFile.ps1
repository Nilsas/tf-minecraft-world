param (
    [Parameter()]
    [string]$Path,
    [Parameter()]
    [switch]$Info,
    [Parameter()]
    [switch]$Remove,
    [Parameter()]
    [switch]$RemoveQuotes
)

$variables = Select-String -Path $Path -Pattern '^s*[^\s=#]+=[^\s]+$' -Raw

foreach ($var in $variables) {
    $keyVal = $var -Split '=', 2
    $key = $keyVal[0].Trim()
    $value = $RemoveQuotes ? $keyVal[1].Trim("'") : $keyVal[1]
    [Environment]::SetEnvironmentVariable($key, $Remove ? '' : $value)
    if ($Info) {
        Write-Host "$key=$([Environment]::GetEnvironmentVariable($key))"
    }
}