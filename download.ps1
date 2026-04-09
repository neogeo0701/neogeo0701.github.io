$headers = @{ "User-Agent" = "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36" }
$urls = @{
    "assets\boseong.png" = "https://upload.wikimedia.org/wikipedia/ko/thumb/7/7b/%EB%B3%B4%EC%84%B1%EA%B3%A0%EB%93%B1%ED%95%99%EA%B5%90.png/150px-%EB%B3%B4%EC%84%B1%EA%B3%A0%EB%93%B1%ED%95%99%EA%B5%90.png"
    "assets\khu.png" = "https://upload.wikimedia.org/wikipedia/ko/a/a6/KyungHee_University_Emblem.png"
    "assets\snu.png" = "https://upload.wikimedia.org/wikipedia/en/thumb/4/44/Seoul_National_University_seal.svg/150px-Seoul_National_University_seal.svg.png"
    "assets\psu.png" = "https://upload.wikimedia.org/wikipedia/en/thumb/3/3a/Penn_State_Nittany_Lions_logo.svg/150px-Penn_State_Nittany_Lions_logo.svg.png"
    "assets\naver.png" = "https://upload.wikimedia.org/wikipedia/commons/thumb/b/b4/Naver_Corporation_logo.svg/150px-Naver_Corporation_logo.svg.png"
    "assets\hyundai.png" = "https://upload.wikimedia.org/wikipedia/commons/thumb/4/44/Hyundai_Motor_Company_logo.svg/150px-Hyundai_Motor_Company_logo.svg.png"
}

mkdir -Force assets

foreach ($file in $urls.Keys) {
    try {
        Invoke-WebRequest -Uri $urls[$file] -Headers $headers -OutFile "$pwd\$file"
        Write-Host "Downloaded '$file'"
    } catch {
        Write-Host "Failed to download '$file': $_"
    }
}
