[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

Write-Host "`n🔍 التحقق من البيئة..."

# التحقق من PHP
if (-not (Get-Command php -ErrorAction SilentlyContinue)) {
    Write-Host "❌ PHP غير مثبت. يرجى تثبيته قبل المتابعة."
    exit
} else {
    Write-Host "✅ PHP مثبت."
}

# التحقق من .NET SDK
if (-not (Get-Command dotnet -ErrorAction SilentlyContinue)) {
    Write-Host "❌ .NET SDK غير مثبت. يرجى تثبيته قبل المتابعة."
    exit
} else {
    Write-Host "✅ .NET SDK مثبت."
}

Write-Host "`n📁 إنشاء المجلدات الأساسية..."

$folders = @("src", "public", "logs", "config", "tests", "docs", "database", "src\modules")
foreach ($folder in $folders) {
    if (-not (Test-Path $folder)) {
        New-Item -ItemType Directory -Path $folder | Out-Null
        Write-Host "📂 تم إنشاء: $folder"
    } else {
        Write-Host "📂 موجود مسبقًا: $folder"
    }
}

Write-Host "`n📝 إنشاء الملفات الأساسية..."

New-Item -ItemType File -Path "src\config.php" -Value "<?php // إعدادات المشروع ?>" -Force | Out-Null
New-Item -ItemType File -Path "public\style.css" -Value "body { font-family: Arial; }" -Force | Out-Null
New-Item -ItemType File -Path ".env" -Value "APP_ENV=development`nAPP_DEBUG=true" -Force | Out-Null
New-Item -ItemType File -Path "docs\README.txt" -Value "📘 توثيق مشروع MOTAKAMEL" -Force | Out-Null
New-Item -ItemType File -Path "database\schema.sql" -Value "-- SQL schema for MOTAKAMEL" -Force | Out-Null
New-Item -ItemType File -Path "tests\test.php" -Value "<?php echo '🧪 اختبار ناجح'; ?>" -Force | Out-Null

Write-Host "`n📦 توليد ملفات الوحدات المحاسبية..."

$modulesPath = "src\modules"
$modules = @{
    "accounts.php"          = "<?php // 🧾 وحدة الحسابات"
    "sales.php"             = "<?php // 💰 وحدة المبيعات"
    "purchases.php"         = "<?php // 📦 وحدة المشتريات"
    "journal_entries.php"   = "<?php // 📘 وحدة القيود اليومية"
    "financial_reports.php" = "<?php // 📊 وحدة التقارير المالية"
}

foreach ($file in $modules.Keys) {
    $path = Join-Path $modulesPath $file
    if (-not (Test-Path $path)) {
        New-Item -ItemType File -Path $path -Value $modules[$file] -Force | Out-Null
        Write-Host "📝 تم إنشاء ملف الوحدة: $file"
    } else {
        Write-Host "📝 الملف موجود مسبقًا: $file"
    }
}

Write-Host "`n✅ تم تجهيز المشروع بالكامل! يمكنك الآن رفعه إلى GitHub أو البدء في التطوير."
