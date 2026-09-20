<#
.SYNOPSIS
    Validates that a developer's local Windows machine is set up correctly.

.DESCRIPTION
    Checks that required tools are installed and working: Git, Node.js, Python, PostgreSQL.
    Add new checks by writing a Test-* function and registering it in $script:Checks.

.EXAMPLE
    ./validate-setup.ps1
#>

[CmdletBinding()]
param()

$ErrorActionPreference = 'Stop'

$script:Results = @()

function Add-Result {
    param(
        [string]$Name,
        [bool]$Passed,
        [string]$Detail
    )
    $script:Results += [pscustomobject]@{
        Name    = $Name
        Passed  = $Passed
        Detail  = $Detail
    }
}

function Get-CommandVersion {
    param(
        [string]$CommandName,
        [string[]]$VersionArgs
    )
    $cmd = Get-Command $CommandName -ErrorAction SilentlyContinue
    if (-not $cmd) {
        return $null
    }
    try {
        $output = & $CommandName @VersionArgs 2>&1
        if ($LASTEXITCODE -ne 0 -and $LASTEXITCODE -ne $null) {
            return $null
        }
        return ($output | Select-Object -First 1).ToString().Trim()
    } catch {
        return $null
    }
}

function Test-Git {
    $version = Get-CommandVersion -CommandName 'git' -VersionArgs @('--version')
    if ($version) {
        Add-Result -Name 'Git' -Passed $true -Detail $version
    } else {
        Add-Result -Name 'Git' -Passed $false -Detail 'git is not installed or not on PATH.'
    }
}

function Test-NodeJs {
    $nodeVersion = Get-CommandVersion -CommandName 'node' -VersionArgs @('--version')
    $npmVersion  = Get-CommandVersion -CommandName 'npm' -VersionArgs @('--version')

    if ($nodeVersion -and $npmVersion) {
        Add-Result -Name 'Node.js' -Passed $true -Detail "node $nodeVersion, npm $npmVersion"
    } elseif ($nodeVersion) {
        Add-Result -Name 'Node.js' -Passed $false -Detail "node $nodeVersion found, but npm is missing or not on PATH."
    } else {
        Add-Result -Name 'Node.js' -Passed $false -Detail 'node is not installed or not on PATH.'
    }
}

function Test-Python {
    $version = Get-CommandVersion -CommandName 'python' -VersionArgs @('--version')
    if (-not $version) {
        # On some setups Python is only available as 'py'
        $version = Get-CommandVersion -CommandName 'py' -VersionArgs @('--version')
    }

    if ($version) {
        Add-Result -Name 'Python' -Passed $true -Detail $version
    } else {
        Add-Result -Name 'Python' -Passed $false -Detail 'python is not installed or not on PATH.'
    }
}

function Test-PostgreSql {
    $version = Get-CommandVersion -CommandName 'psql' -VersionArgs @('--version')
    if (-not $version) {
        Add-Result -Name 'PostgreSQL' -Passed $false -Detail 'psql is not installed or not on PATH.'
        return
    }

    # psql is installed; also confirm the PostgreSQL service is running.
    $service = Get-Service -Name 'postgresql*' -ErrorAction SilentlyContinue | Select-Object -First 1
    if ($service -and $service.Status -eq 'Running') {
        Add-Result -Name 'PostgreSQL' -Passed $true -Detail "$version, service '$($service.Name)' is running."
    } elseif ($service) {
        Add-Result -Name 'PostgreSQL' -Passed $false -Detail "$version, but service '$($service.Name)' is not running (status: $($service.Status))."
    } else {
        Add-Result -Name 'PostgreSQL' -Passed $false -Detail "$version, but no PostgreSQL Windows service was found. It may be running elsewhere (Docker, WSL, remote)."
    }
}

# Register checks here. Add future checks (e.g. Claude Code) as new Test-* functions.
$script:Checks = @(
    ${function:Test-Git},
    ${function:Test-NodeJs},
    ${function:Test-Python},
    ${function:Test-PostgreSql}
)

Write-Host "Validating local workspace setup...`n" -ForegroundColor Cyan

foreach ($check in $script:Checks) {
    & $check
}

Write-Host "Results:" -ForegroundColor Cyan
Write-Host ("-" * 60)

foreach ($result in $script:Results) {
    if ($result.Passed) {
        Write-Host ("[ OK ] {0,-12} {1}" -f $result.Name, $result.Detail) -ForegroundColor Green
    } else {
        Write-Host ("[FAIL] {0,-12} {1}" -f $result.Name, $result.Detail) -ForegroundColor Red
    }
}

Write-Host ("-" * 60)

$failed = $script:Results | Where-Object { -not $_.Passed }

if ($failed) {
    Write-Host "`n$($failed.Count) check(s) failed. Please install/fix the tools above before continuing." -ForegroundColor Yellow
    exit 1
} else {
    Write-Host "`nAll checks passed. Your workspace is set up correctly!" -ForegroundColor Green
    exit 0
}
