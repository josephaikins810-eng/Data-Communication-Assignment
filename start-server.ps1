# Simple local web server (no Python required)
$port = 5500
$root = $PSScriptRoot
$prefix = "http://localhost:$port/"

$listener = New-Object System.Net.HttpListener
$listener.Prefixes.Add($prefix)
$listener.Start()

Write-Host ""
Write-Host "  Data Communication site is running"
Write-Host "  Open: http://localhost:$port/resources.html#video"
Write-Host "  Press Ctrl+C to stop"
Write-Host ""

Start-Process "http://localhost:$port/resources.html#video"

$mime = @{
  ".html" = "text/html; charset=utf-8"
  ".css"  = "text/css; charset=utf-8"
  ".js"   = "application/javascript; charset=utf-8"
  ".svg"  = "image/svg+xml"
  ".png"  = "image/png"
  ".jpg"  = "image/jpeg"
  ".jpeg" = "image/jpeg"
  ".pdf"  = "application/pdf"
  ".ico"  = "image/x-icon"
}

while ($listener.IsListening) {
  $context = $listener.GetContext()
  $request = $context.Request
  $response = $context.Response

  $path = [System.Uri]::UnescapeDataString($request.Url.AbsolutePath)
  if ($path -eq "/") { $path = "/index.html" }

  $filePath = Join-Path $root ($path.TrimStart("/").Replace("/", [IO.Path]::DirectorySeparatorChar))

  if (Test-Path $filePath -PathType Leaf) {
    $ext = [IO.Path]::GetExtension($filePath).ToLower()
    $bytes = [IO.File]::ReadAllBytes($filePath)
    $response.StatusCode = 200
    $response.ContentType = $mime[$ext]
    if (-not $response.ContentType) { $response.ContentType = "application/octet-stream" }
    $response.ContentLength64 = $bytes.Length
    $response.OutputStream.Write($bytes, 0, $bytes.Length)
  } else {
    $response.StatusCode = 404
    $msg = [Text.Encoding]::UTF8.GetBytes("404 Not Found")
    $response.OutputStream.Write($msg, 0, $msg.Length)
  }

  $response.Close()
}
