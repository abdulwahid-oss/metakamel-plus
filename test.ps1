Write-Host "🔍 Checking for PHP..."
if (-not (Get-Command php -ErrorAction SilentlyContinue)) {
    Write-Host "❌ PHP is not installed."
    exit
} else {
    Write-Host "✅ PHP is installed."
}

Write-Host "🔍 Checking for .NET SDK..."
if (-not (Get-Command dotnet -ErrorAction SilentlyContinue)) {
    Write-Host "❌ .NET SDK is not installed."
    exit
} else {
    Write-Host "✅ .NET SDK is installed."
}

Write-Host "🚀 Environment is ready. You can start building your project."
