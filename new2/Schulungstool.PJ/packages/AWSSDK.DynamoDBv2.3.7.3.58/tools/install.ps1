﻿param($installPath, $toolsPath, $package, $project)

$analyzersPaths = Join-Path (Join-Path (Split-Path -Path $toolsPath -Parent) "analyzers" ) * -Resolve

foreach($analyzersPath in $analyzersPaths)
{
    # Install the language agnostic analyzers.
    if (Test-Path $analyzersPath)
    {
        foreach ($analyzerFilePath in Get-ChildItem $analyzersPath -Filter *.dll)
        {
            if($project.Object.AnalyzerReferences)
            {
                $project.Object.AnalyzerReferences.Add($analyzerFilePath.FullName)
            }
        }
    }
}

# $project.Type gives the language name like (C# or VB.NET)
$languageFolder = ""
if($project.Type -eq "C#")
{
    $languageFolder = "cs"
}
if($project.Type -eq "VB.NET")
{
    $languageFolder = "vb"
}
if($languageFolder -eq "")
{
    return
}

foreach($analyzersPath in $analyzersPaths)
{
    # Install language specific analyzers.
    $languageAnalyzersPath = join-path $analyzersPath $languageFolder
    if (Test-Path $languageAnalyzersPath)
    {
        foreach ($analyzerFilePath in Get-ChildItem $languageAnalyzersPath -Filter *.dll)
        {
            if($project.Object.AnalyzerReferences)
            {
                $project.Object.AnalyzerReferences.Add($analyzerFilePath.FullName)
            }
        }
    }
}
# SIG # Begin signature block
# MIIsnAYJKoZIhvcNAQcCoIIsjTCCLIkCAQExDzANBglghkgBZQMEAgEFADB5Bgor
# BgEEAYI3AgEEoGswaTA0BgorBgEEAYI3AgEeMCYCAwEAAAQQH8w7YFlLCE63JNLG
# KX7zUQIBAAIBAAIBAAIBAAIBADAxMA0GCWCGSAFlAwQCAQUABCDZJBZzcs7cfqM9
# MWr2aPykOqNSy5POJYRMX2iYAyfLG6CCFB0wggXAMIIEqKADAgECAhAP0bvKeWvX
# +N1MguEKmpYxMA0GCSqGSIb3DQEBCwUAMGwxCzAJBgNVBAYTAlVTMRUwEwYDVQQK
# EwxEaWdpQ2VydCBJbmMxGTAXBgNVBAsTEHd3dy5kaWdpY2VydC5jb20xKzApBgNV
# BAMTIkRpZ2lDZXJ0IEhpZ2ggQXNzdXJhbmNlIEVWIFJvb3QgQ0EwHhcNMjIwMTEz
# MDAwMDAwWhcNMzExMTA5MjM1OTU5WjBiMQswCQYDVQQGEwJVUzEVMBMGA1UEChMM
# RGlnaUNlcnQgSW5jMRkwFwYDVQQLExB3d3cuZGlnaWNlcnQuY29tMSEwHwYDVQQD
# ExhEaWdpQ2VydCBUcnVzdGVkIFJvb3QgRzQwggIiMA0GCSqGSIb3DQEBAQUAA4IC
# DwAwggIKAoICAQC/5pBzaN675F1KPDAiMGkz7MKnJS7JIT3yithZwuEppz1Yq3aa
# za57G4QNxDAf8xukOBbrVsaXbR2rsnnyyhHS5F/WBTxSD1Ifxp4VpX6+n6lXFllV
# cq9ok3DCsrp1mWpzMpTREEQQLt+C8weE5nQ7bXHiLQwb7iDVySAdYyktzuxeTsiT
# +CFhmzTrBcZe7FsavOvJz82sNEBfsXpm7nfISKhmV1efVFiODCu3T6cw2Vbuyntd
# 463JT17lNecxy9qTXtyOj4DatpGYQJB5w3jHtrHEtWoYOAMQjdjUN6QuBX2I9YI+
# EJFwq1WCQTLX2wRzKm6RAXwhTNS8rhsDdV14Ztk6MUSaM0C/CNdaSaTC5qmgZ92k
# J7yhTzm1EVgX9yRcRo9k98FpiHaYdj1ZXUJ2h4mXaXpI8OCiEhtmmnTK3kse5w5j
# rubU75KSOp493ADkRSWJtppEGSt+wJS00mFt6zPZxd9LBADMfRyVw4/3IbKyEbe7
# f/LVjHAsQWCqsWMYRJUadmJ+9oCw++hkpjPRiQfhvbfmQ6QYuKZ3AeEPlAwhHbJU
# KSWJbOUOUlFHdL4mrLZBdd56rF+NP8m800ERElvlEFDrMcXKchYiCd98THU/Y+wh
# X8QgUWtvsauGi0/C1kVfnSD8oR7FwI+isX4KJpn15GkvmB0t9dmpsh3lGwIDAQAB
# o4IBZjCCAWIwDwYDVR0TAQH/BAUwAwEB/zAdBgNVHQ4EFgQU7NfjgtJxXWRM3y5n
# P+e6mK4cD08wHwYDVR0jBBgwFoAUsT7DaQP4v0cB1JgmGggC72NkK8MwDgYDVR0P
# AQH/BAQDAgGGMBMGA1UdJQQMMAoGCCsGAQUFBwMDMH8GCCsGAQUFBwEBBHMwcTAk
# BggrBgEFBQcwAYYYaHR0cDovL29jc3AuZGlnaWNlcnQuY29tMEkGCCsGAQUFBzAC
# hj1odHRwOi8vY2FjZXJ0cy5kaWdpY2VydC5jb20vRGlnaUNlcnRIaWdoQXNzdXJh
# bmNlRVZSb290Q0EuY3J0MEsGA1UdHwREMEIwQKA+oDyGOmh0dHA6Ly9jcmwzLmRp
# Z2ljZXJ0LmNvbS9EaWdpQ2VydEhpZ2hBc3N1cmFuY2VFVlJvb3RDQS5jcmwwHAYD
# VR0gBBUwEzAHBgVngQwBAzAIBgZngQwBBAEwDQYJKoZIhvcNAQELBQADggEBAEHx
# qRH0DxNHecllao3A7pgEpMbjDPKisedfYk/ak1k2zfIe4R7sD+EbP5HU5A/C5pg0
# /xkPZigfT2IxpCrhKhO61z7H0ZL+q93fqpgzRh9Onr3g7QdG64AupP2uU7SkwaT1
# IY1rzAGt9Rnu15ClMlIr28xzDxj4+87eg3Gn77tRWwR2L62t0+od/P1Tk+WMieNg
# GbngLyOOLFxJy34riDkruQZhiPOuAnZ2dMFkkbiJUZflhX0901emWG4f7vtpYeJa
# 3Cgh6GO6Ps9W7Zrk9wXqyvPsEt84zdp7PiuTUy9cUQBY3pBIowrHC/Q7bVUx8ALM
# R3eWUaNetbxcyEMRoacwggawMIIEmKADAgECAhAIrUCyYNKcTJ9ezam9k67ZMA0G
# CSqGSIb3DQEBDAUAMGIxCzAJBgNVBAYTAlVTMRUwEwYDVQQKEwxEaWdpQ2VydCBJ
# bmMxGTAXBgNVBAsTEHd3dy5kaWdpY2VydC5jb20xITAfBgNVBAMTGERpZ2lDZXJ0
# IFRydXN0ZWQgUm9vdCBHNDAeFw0yMTA0MjkwMDAwMDBaFw0zNjA0MjgyMzU5NTla
# MGkxCzAJBgNVBAYTAlVTMRcwFQYDVQQKEw5EaWdpQ2VydCwgSW5jLjFBMD8GA1UE
# AxM4RGlnaUNlcnQgVHJ1c3RlZCBHNCBDb2RlIFNpZ25pbmcgUlNBNDA5NiBTSEEz
# ODQgMjAyMSBDQTEwggIiMA0GCSqGSIb3DQEBAQUAA4ICDwAwggIKAoICAQDVtC9C
# 0CiteLdd1TlZG7GIQvUzjOs9gZdwxbvEhSYwn6SOaNhc9es0JAfhS0/TeEP0F9ce
# 2vnS1WcaUk8OoVf8iJnBkcyBAz5NcCRks43iCH00fUyAVxJrQ5qZ8sU7H/Lvy0da
# E6ZMswEgJfMQ04uy+wjwiuCdCcBlp/qYgEk1hz1RGeiQIXhFLqGfLOEYwhrMxe6T
# SXBCMo/7xuoc82VokaJNTIIRSFJo3hC9FFdd6BgTZcV/sk+FLEikVoQ11vkunKoA
# FdE3/hoGlMJ8yOobMubKwvSnowMOdKWvObarYBLj6Na59zHh3K3kGKDYwSNHR7Oh
# D26jq22YBoMbt2pnLdK9RBqSEIGPsDsJ18ebMlrC/2pgVItJwZPt4bRc4G/rJvmM
# 1bL5OBDm6s6R9b7T+2+TYTRcvJNFKIM2KmYoX7BzzosmJQayg9Rc9hUZTO1i4F4z
# 8ujo7AqnsAMrkbI2eb73rQgedaZlzLvjSFDzd5Ea/ttQokbIYViY9XwCFjyDKK05
# huzUtw1T0PhH5nUwjewwk3YUpltLXXRhTT8SkXbev1jLchApQfDVxW0mdmgRQRNY
# mtwmKwH0iU1Z23jPgUo+QEdfyYFQc4UQIyFZYIpkVMHMIRroOBl8ZhzNeDhFMJlP
# /2NPTLuqDQhTQXxYPUez+rbsjDIJAsxsPAxWEQIDAQABo4IBWTCCAVUwEgYDVR0T
# AQH/BAgwBgEB/wIBADAdBgNVHQ4EFgQUaDfg67Y7+F8Rhvv+YXsIiGX0TkIwHwYD
# VR0jBBgwFoAU7NfjgtJxXWRM3y5nP+e6mK4cD08wDgYDVR0PAQH/BAQDAgGGMBMG
# A1UdJQQMMAoGCCsGAQUFBwMDMHcGCCsGAQUFBwEBBGswaTAkBggrBgEFBQcwAYYY
# aHR0cDovL29jc3AuZGlnaWNlcnQuY29tMEEGCCsGAQUFBzAChjVodHRwOi8vY2Fj
# ZXJ0cy5kaWdpY2VydC5jb20vRGlnaUNlcnRUcnVzdGVkUm9vdEc0LmNydDBDBgNV
# HR8EPDA6MDigNqA0hjJodHRwOi8vY3JsMy5kaWdpY2VydC5jb20vRGlnaUNlcnRU
# cnVzdGVkUm9vdEc0LmNybDAcBgNVHSAEFTATMAcGBWeBDAEDMAgGBmeBDAEEATAN
# BgkqhkiG9w0BAQwFAAOCAgEAOiNEPY0Idu6PvDqZ01bgAhql+Eg08yy25nRm95Ry
# sQDKr2wwJxMSnpBEn0v9nqN8JtU3vDpdSG2V1T9J9Ce7FoFFUP2cvbaF4HZ+N3HL
# IvdaqpDP9ZNq4+sg0dVQeYiaiorBtr2hSBh+3NiAGhEZGM1hmYFW9snjdufE5Btf
# Q/g+lP92OT2e1JnPSt0o618moZVYSNUa/tcnP/2Q0XaG3RywYFzzDaju4ImhvTnh
# OE7abrs2nfvlIVNaw8rpavGiPttDuDPITzgUkpn13c5UbdldAhQfQDN8A+KVssIh
# dXNSy0bYxDQcoqVLjc1vdjcshT8azibpGL6QB7BDf5WIIIJw8MzK7/0pNVwfiThV
# 9zeKiwmhywvpMRr/LhlcOXHhvpynCgbWJme3kuZOX956rEnPLqR0kq3bPKSchh/j
# wVYbKyP/j7XqiHtwa+aguv06P0WmxOgWkVKLQcBIhEuWTatEQOON8BUozu3xGFYH
# Ki8QxAwIZDwzj64ojDzLj4gLDb879M4ee47vtevLt/B3E+bnKD+sEq6lLyJsQfmC
# XBVmzGwOysWGw/YmMwwHS6DTBwJqakAwSEs0qFEgu60bhQjiWQ1tygVQK+pKHJ6l
# /aCnHwZ05/LWUpD9r4VIIflXO7ScA+2GRfS0YW6/aOImYIbqyK+p/pQd52MbOoZW
# eE4wggehMIIFiaADAgECAhALyko14sGCglkXWPsT8gmbMA0GCSqGSIb3DQEBCwUA
# MGkxCzAJBgNVBAYTAlVTMRcwFQYDVQQKEw5EaWdpQ2VydCwgSW5jLjFBMD8GA1UE
# AxM4RGlnaUNlcnQgVHJ1c3RlZCBHNCBDb2RlIFNpZ25pbmcgUlNBNDA5NiBTSEEz
# ODQgMjAyMSBDQTEwHhcNMjExMjI4MDAwMDAwWhcNMjMwMTAzMjM1OTU5WjCB9jEd
# MBsGA1UEDwwUUHJpdmF0ZSBPcmdhbml6YXRpb24xEzARBgsrBgEEAYI3PAIBAxMC
# VVMxGTAXBgsrBgEEAYI3PAIBAhMIRGVsYXdhcmUxEDAOBgNVBAUTBzQxNTI5NTQx
# CzAJBgNVBAYTAlVTMRMwEQYDVQQIEwpXYXNoaW5ndG9uMRAwDgYDVQQHEwdTZWF0
# dGxlMSIwIAYDVQQKExlBbWF6b24gV2ViIFNlcnZpY2VzLCBJbmMuMRcwFQYDVQQL
# Ew5TREtzIGFuZCBUb29sczEiMCAGA1UEAxMZQW1hem9uIFdlYiBTZXJ2aWNlcywg
# SW5jLjCCAaIwDQYJKoZIhvcNAQEBBQADggGPADCCAYoCggGBAKHRLdQSyJ6AfhQ8
# U7Gi6le7gshUhu34xQ7jaTCfpKaKQRGu+oNfAYDRSSfh498eK+jFnGHU/TMzVHEg
# Bb4TUrc1e2f5LHhXAtYTJK0uis9OJ5n3MjHwOJt/uGSSMUAIIIselvbSF2mOE0lI
# z0CNMIlUiXI9O+y9+FJP7Vsg/NU/zAVsQ4Ok0GLd+Yp566nRuj9aNU+L+TxRhSHA
# 7KKjJ9oE0mVblUGQaeNrOd1Ql9djJy0pg6oT2s9Peh8lqB3tUsMaoQ/FMV0P/e1S
# 6V3yFg/I1OvQdtm29ryJTdg9ZvIV/FGnIYdW5s5T8t//nf+7LToQVhpML/ZWEhFR
# Aa6We80Y8zs9glIPDZyYmi6OPbpY7kVHa4dr8S49tPwrVMjC3hk9v9S6poDx/hR9
# kytwVt1Lo4LjAlpmKLeHVmOnn5uenpXqFOJMbTMYmciwHz8yWJwZYMKKLJPCGa79
# xaAkZj9HCop5yPUPccqjyz2i0v/Pt8yFH77s8q86e99O2a+/oQIDAQABo4ICNTCC
# AjEwHwYDVR0jBBgwFoAUaDfg67Y7+F8Rhvv+YXsIiGX0TkIwHQYDVR0OBBYEFGml
# Ip+0bnVEmnOvWcJjnCup9DbsMC4GA1UdEQQnMCWgIwYIKwYBBQUHCAOgFzAVDBNV
# Uy1ERUxBV0FSRS00MTUyOTU0MA4GA1UdDwEB/wQEAwIHgDATBgNVHSUEDDAKBggr
# BgEFBQcDAzCBtQYDVR0fBIGtMIGqMFOgUaBPhk1odHRwOi8vY3JsMy5kaWdpY2Vy
# dC5jb20vRGlnaUNlcnRUcnVzdGVkRzRDb2RlU2lnbmluZ1JTQTQwOTZTSEEzODQy
# MDIxQ0ExLmNybDBToFGgT4ZNaHR0cDovL2NybDQuZGlnaWNlcnQuY29tL0RpZ2lD
# ZXJ0VHJ1c3RlZEc0Q29kZVNpZ25pbmdSU0E0MDk2U0hBMzg0MjAyMUNBMS5jcmww
# PQYDVR0gBDYwNDAyBgVngQwBAzApMCcGCCsGAQUFBwIBFhtodHRwOi8vd3d3LmRp
# Z2ljZXJ0LmNvbS9DUFMwgZQGCCsGAQUFBwEBBIGHMIGEMCQGCCsGAQUFBzABhhho
# dHRwOi8vb2NzcC5kaWdpY2VydC5jb20wXAYIKwYBBQUHMAKGUGh0dHA6Ly9jYWNl
# cnRzLmRpZ2ljZXJ0LmNvbS9EaWdpQ2VydFRydXN0ZWRHNENvZGVTaWduaW5nUlNB
# NDA5NlNIQTM4NDIwMjFDQTEuY3J0MAwGA1UdEwEB/wQCMAAwDQYJKoZIhvcNAQEL
# BQADggIBALlYa6PSDPPulVJbqEi7XGz23lFZwYa1PiXk+PkJO2HDXv2zep26LZri
# wBHT2yA/KbDvbwZpf4VOBKn5lQC9R+DsgwW/xZbNq7y3cWf9Ad1AQ9Do/FXfBqVO
# 1if+GpqFbqUme5wOjn8/8dc4nFR4erbDgkM4ICn/astBigYnfM5wTO+J8ex+7fE2
# D1kFAwfZAuiRNdDreVMDlYXpJMQ4CtTKVLHYentLR747zzRjO4PqgL1exvbvpOMZ
# lSDLWhaDjtKwUDb645ziHDA3DXe8K51+hIFuadKTinJa8Pfsbgg2W7aTfBdi2gTy
# XkeVJ836631Ks4KD3cXui9Jx2PWRAVxKIEvXuebZ09Mph2jiBH75urqS57i1mpS7
# OA5lIj7a7NIYsVl26PVpJUEr3LRKV8GO3tRC7KP0zE7sB7k2VQKwBXbsifq/vpcm
# eyy4OeQbZ1i8GwZLPHuygP9exTWK2o2wWByJs62Wdk6JmSREvr9Wr59BVNbQfRSR
# aF9q058bBK68hGZtDBpJ9gJX4V12DI2UpSbcGf10+afL1J4zFDv98GIGkgmfLQJU
# pJeC/FnNrEXJbINndCsOb6gdLvLX1grMdUPmPkpRZyvG3HEyEMCV5ODMItTx7K6T
# DyeZDIXXP5oBnBMK9EjtRD3XkEb9dDfuzCrdlTpEoTElt2mGuEE7MYIX1TCCF9EC
# AQEwfTBpMQswCQYDVQQGEwJVUzEXMBUGA1UEChMORGlnaUNlcnQsIEluYy4xQTA/
# BgNVBAMTOERpZ2lDZXJ0IFRydXN0ZWQgRzQgQ29kZSBTaWduaW5nIFJTQTQwOTYg
# U0hBMzg0IDIwMjEgQ0ExAhALyko14sGCglkXWPsT8gmbMA0GCWCGSAFlAwQCAQUA
# oHwwEAYKKwYBBAGCNwIBDDECMAAwGQYJKoZIhvcNAQkDMQwGCisGAQQBgjcCAQQw
# HAYKKwYBBAGCNwIBCzEOMAwGCisGAQQBgjcCARUwLwYJKoZIhvcNAQkEMSIEIIgg
# GiiIJe1Hnoajdl4sgBmQ1f6QTids3rxvEr1zUzMYMA0GCSqGSIb3DQEBAQUABIIB
# gH550g+rOs+pD6dlPRG+y+mr7VnNVJuh4JeRhpSI/EPd7+O28Izms+XjDymqyU1L
# JFr/WqvQF/nbf3Htxsri67UWbuQkyo/ap9d7ewS19Ta8u3RY2vgtbGSTVyzttngS
# yM19Z6LTS7C3200s7PkEGEYoTnC4vaaapQll3wS6i8WYznq7UTBxFSZoNE5azUzc
# 5LDt7VPw9gVImhGaOtg/k/7rcwMhw6Wb9vb/lMDstTZMPc7jHtJSrcTD5tklvPR3
# QWclsys2d0HDzV5Aof46j+l0e4902gC1mmd+qXF+0CTwBXIJSawjAMK8B3TWKpCA
# OHXLZ/9OZNdVy/BN4QHkbISfkeGLkJvb3rs1YK3ENPzsCv3lLnVx04iq/pA1Yg8p
# d8zVRoAOLmRrvtRxLAn5N4Ab5PyLI90AD4G7ObVIBJEh5bHAuGJrtXg+U9BTYL4R
# 70CQKKm6oBrBQfEx+91z869eoiupsNWb6VheB3V6YNKpgyzjj2ca6IBCg0X/V6nm
# CKGCFSswghUnBgorBgEEAYI3AwMBMYIVFzCCFRMGCSqGSIb3DQEHAqCCFQQwghUA
# AgEDMQ0wCwYJYIZIAWUDBAIBMIH0BgsqhkiG9w0BCRABBKCB5ASB4TCB3gIBAQYK
# YIZIAYb6bAoDBTAxMA0GCWCGSAFlAwQCAQUABCCK6TF2MnIMQEwAAAUxaPNjR9lf
# QvHgHFziSUivswKXSwIJAOYnGlIvYqkkGA8yMDIyMDcxODE4NDk0N1owAwIBAaB5
# pHcwdTELMAkGA1UEBhMCQ0ExEDAOBgNVBAgTB09udGFyaW8xDzANBgNVBAcTBk90
# dGF3YTEWMBQGA1UEChMNRW50cnVzdCwgSW5jLjErMCkGA1UEAxMiRW50cnVzdCBU
# aW1lc3RhbXAgQXV0aG9yaXR5IC0gVFNBMaCCD1UwggQqMIIDEqADAgECAgQ4Y974
# MA0GCSqGSIb3DQEBBQUAMIG0MRQwEgYDVQQKEwtFbnRydXN0Lm5ldDFAMD4GA1UE
# CxQ3d3d3LmVudHJ1c3QubmV0L0NQU18yMDQ4IGluY29ycC4gYnkgcmVmLiAobGlt
# aXRzIGxpYWIuKTElMCMGA1UECxMcKGMpIDE5OTkgRW50cnVzdC5uZXQgTGltaXRl
# ZDEzMDEGA1UEAxMqRW50cnVzdC5uZXQgQ2VydGlmaWNhdGlvbiBBdXRob3JpdHkg
# KDIwNDgpMB4XDTk5MTIyNDE3NTA1MVoXDTI5MDcyNDE0MTUxMlowgbQxFDASBgNV
# BAoTC0VudHJ1c3QubmV0MUAwPgYDVQQLFDd3d3cuZW50cnVzdC5uZXQvQ1BTXzIw
# NDggaW5jb3JwLiBieSByZWYuIChsaW1pdHMgbGlhYi4pMSUwIwYDVQQLExwoYykg
# MTk5OSBFbnRydXN0Lm5ldCBMaW1pdGVkMTMwMQYDVQQDEypFbnRydXN0Lm5ldCBD
# ZXJ0aWZpY2F0aW9uIEF1dGhvcml0eSAoMjA0OCkwggEiMA0GCSqGSIb3DQEBAQUA
# A4IBDwAwggEKAoIBAQCtTUupEoay6qMgBxUWZCorS9G/C0pNju2AdqVnt3hAwHNC
# yGjA21Mr3V64dpg1k4sanXwTOg4fW7cez+UkFB6xgamNfbjMa0sD8QIM3KulQCQA
# f3SUoZ0IKbOIC/WHd51VzeTDftdqZKuFFIaVW5cyUG89yLpmDOP8vbhJwXaJSRn9
# wKi9iaNnL8afvHEZYLgt6SzJkHZme5Tir3jWZVNdPNacss8pA/kvpFCy1EjOBTJV
# iv2yZEwO5JgHddt/37kIVWCFMCn5e0ikaYbjNT8ehl16ehW97wCOFSJUFwCQJpO8
# Dklokb/4R9OdlULBDk3fbybPwxghYmZDcNbVwAfhAgMBAAGjQjBAMA4GA1UdDwEB
# /wQEAwIBBjAPBgNVHRMBAf8EBTADAQH/MB0GA1UdDgQWBBRV5IHREYC+2Im5CKMx
# +aEkCRa5cDANBgkqhkiG9w0BAQUFAAOCAQEAO5uPVpsw51OZfHp5p02X1xmVkPsG
# H8ozfEZjj5ZmJPpAGyEnyuZyc/JP/jGZ/cgMTGhTxoCCE5j6tq3aXT3xzm72FRGU
# ggzuP5WvEasP1y/eHwOPVyweybuaGkSV6xhPph/NfVcQL5sECVqEtW7YHTrh1p7R
# bHleeRwUxePQTJM7ZTzt3z2+puWVGsO1GcO9Xlu7/yPvaBnLEpMnXAMtbzDQHrYa
# rN5a99GqqCem/nmBxHmZM1e6ErCp4EJsk8pW3v5thAsIi36N6teYIcbz5zx5L16c
# 0UwVjeHsIjfMmkMLl9yAkI2zZ5tvSAgVVs+/8St8Xpp26VmQxXyDNRFlUTCCBRMw
# ggP7oAMCAQICDFjaE/8AAAAAUc4N9zANBgkqhkiG9w0BAQsFADCBtDEUMBIGA1UE
# ChMLRW50cnVzdC5uZXQxQDA+BgNVBAsUN3d3dy5lbnRydXN0Lm5ldC9DUFNfMjA0
# OCBpbmNvcnAuIGJ5IHJlZi4gKGxpbWl0cyBsaWFiLikxJTAjBgNVBAsTHChjKSAx
# OTk5IEVudHJ1c3QubmV0IExpbWl0ZWQxMzAxBgNVBAMTKkVudHJ1c3QubmV0IENl
# cnRpZmljYXRpb24gQXV0aG9yaXR5ICgyMDQ4KTAeFw0xNTA3MjIxOTAyNTRaFw0y
# OTA2MjIxOTMyNTRaMIGyMQswCQYDVQQGEwJVUzEWMBQGA1UEChMNRW50cnVzdCwg
# SW5jLjEoMCYGA1UECxMfU2VlIHd3dy5lbnRydXN0Lm5ldC9sZWdhbC10ZXJtczE5
# MDcGA1UECxMwKGMpIDIwMTUgRW50cnVzdCwgSW5jLiAtIGZvciBhdXRob3JpemVk
# IHVzZSBvbmx5MSYwJAYDVQQDEx1FbnRydXN0IFRpbWVzdGFtcGluZyBDQSAtIFRT
# MTCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBANkj5hSk6HxLhXFY+/iB
# 5nKLXUbDiAAfONCK4dZuVjDlr9pkUH3CEzn7vWa02oT7g9AoH8t26GBQaZvzzk8T
# 4sE+wd8SyzKj+F5EIg7MOumNSblgdMjeVD1BXkNfKEapprfKECsivFtNW4wXZRKG
# /Sx31cWgjMrCg+BHV3zncK5iRScxGArUwKQYVVL3YMYES7PdaDJuEB80EbgSeGTx
# 7qng9+OxIo80WmXLivThRVB035OXpjTm0Ew7nzdJUqdTTp8uZ1ztlvylv3RRiOOq
# jr3ZsS9fUDAW9FFgImuZy//hVDu5+0Q4pQg5I5tpR/o8xNDnqt9GsuzyihmsKbI4
# lXUCAwEAAaOCASMwggEfMBIGA1UdEwEB/wQIMAYBAf8CAQAwDgYDVR0PAQH/BAQD
# AgEGMDsGA1UdIAQ0MDIwMAYEVR0gADAoMCYGCCsGAQUFBwIBFhpodHRwOi8vd3d3
# LmVudHJ1c3QubmV0L3JwYTAzBggrBgEFBQcBAQQnMCUwIwYIKwYBBQUHMAGGF2h0
# dHA6Ly9vY3NwLmVudHJ1c3QubmV0MDIGA1UdHwQrMCkwJ6AloCOGIWh0dHA6Ly9j
# cmwuZW50cnVzdC5uZXQvMjA0OGNhLmNybDATBgNVHSUEDDAKBggrBgEFBQcDCDAd
# BgNVHQ4EFgQUw8Jx0nvXaAWuOzmbNCUMYgPHV2gwHwYDVR0jBBgwFoAUVeSB0RGA
# vtiJuQijMfmhJAkWuXAwDQYJKoZIhvcNAQELBQADggEBAB0k55p0W6pw/LEOMUXX
# LAB/ZjoroJo0qqxjbYn5n98Nd/0kI/xPnLdvj/P0H7bB/dYcxIyIZsFjjbpXd9O4
# Gh7IUa3MYDYah2oo6hFl3sw8LIx0t+hQQ9PMKOgVbBEqnxSVKckFV7VnNug8qYPv
# QcEhFtN+9y0RR2Z2YIISaYx2VXMP3y9LXelsI/gH9rV91mlFnFh9YS78eEtDTomR
# RkQsoFOoRaH2Fli7kRPyS8XfC8Dnril6vUWz53Aw5zSO63r207XR3msTmUazi9JN
# k3W18W+/3AAowiW/vOejZTTsPw0dl4z6qogipBg12wWOduMQyCmPY9CurBjZ2sSf
# URIwggYMMIIE9KADAgECAhEAjc4V86eUxYcAAAAAVZIz9DANBgkqhkiG9w0BAQsF
# ADCBsjELMAkGA1UEBhMCVVMxFjAUBgNVBAoTDUVudHJ1c3QsIEluYy4xKDAmBgNV
# BAsTH1NlZSB3d3cuZW50cnVzdC5uZXQvbGVnYWwtdGVybXMxOTA3BgNVBAsTMChj
# KSAyMDE1IEVudHJ1c3QsIEluYy4gLSBmb3IgYXV0aG9yaXplZCB1c2Ugb25seTEm
# MCQGA1UEAxMdRW50cnVzdCBUaW1lc3RhbXBpbmcgQ0EgLSBUUzEwHhcNMjAwNzIy
# MTUzMzI5WhcNMzAxMjI5MTYyOTIzWjB1MQswCQYDVQQGEwJDQTEQMA4GA1UECBMH
# T250YXJpbzEPMA0GA1UEBxMGT3R0YXdhMRYwFAYDVQQKEw1FbnRydXN0LCBJbmMu
# MSswKQYDVQQDEyJFbnRydXN0IFRpbWVzdGFtcCBBdXRob3JpdHkgLSBUU0ExMIIC
# IjANBgkqhkiG9w0BAQEFAAOCAg8AMIICCgKCAgEAyj7sJGLh9/7f0TapN2bWeRcU
# lEIApIaXuCeM60+p99Ou4qswBAgoX5tTpoeKLd0CUl+1uOW2UPCcqxLB7hpWeIpu
# RD+pio/X21PZxkfIDNxGVwBnBhcahbdAqq92B+eQX5SS1a7W1815ocU1K0SEX0kc
# 1XO4gY1ylAJqqc9Wkqo2lMNQyVaXiFzhf1/9+98Ujj2rJA32e49q+m4e+pW9fZD4
# 5EIUv1VeBFSTMUP3w+fCBRForEBpxyM37FpMKcnfNbN+SU7GetvOwiWUnjc/iOwk
# TTmPf+8Va1RMcfENIXxaddCHU4mgW+Ad+5wHwKihtCLQYqTHF383Ts4tOljj5fAm
# hk1CB5++o+IZomtypUa/y2RbJchF9N7oPLb9nPOg74NBfDZwkMNSYrDHfz175ZaH
# pVb/DupJBd+03RNvRdObyCN5KjCZnZnczM2lLoFTUiLy0D2iN1KRkUZw1sVLBf9O
# 9NxkBpf+fJCGJ6+fNFVIiasiwHUHjCHZBNMcp+ptpMlSK+LEAokwXuebMeY5Za1x
# re9nW9yjJO0N5uKpejoYVd7wRi40TRpNmIANTtFshXW4A8IA1SJKJtGO3e211CfW
# OnxnaYbXVD+Xz2S+katutp0ZEHm1lw700YXJ5K7HwLSqB8QfwTpXn80OpnrlFYay
# qvSikyzPjPdR+t2M0EkCAwEAAaOCAVcwggFTMA4GA1UdDwEB/wQEAwIHgDAWBgNV
# HSUBAf8EDDAKBggrBgEFBQcDCDBBBgNVHSAEOjA4MDYGCmCGSAGG+mwKAwUwKDAm
# BggrBgEFBQcCARYaaHR0cDovL3d3dy5lbnRydXN0Lm5ldC9ycGEwCQYDVR0TBAIw
# ADBoBggrBgEFBQcBAQRcMFowIwYIKwYBBQUHMAGGF2h0dHA6Ly9vY3NwLmVudHJ1
# c3QubmV0MDMGCCsGAQUFBzAChidodHRwOi8vYWlhLmVudHJ1c3QubmV0L3RzMS1j
# aGFpbjI1Ni5jZXIwMQYDVR0fBCowKDAmoCSgIoYgaHR0cDovL2NybC5lbnRydXN0
# Lm5ldC90czFjYS5jcmwwHwYDVR0jBBgwFoAUw8Jx0nvXaAWuOzmbNCUMYgPHV2gw
# HQYDVR0OBBYEFC1WgO+O90pDHEOhtd7Z16iqayYoMA0GCSqGSIb3DQEBCwUAA4IB
# AQBYS87Y/oHXUdjHXI2S0k6VHoWGQ+3gGuaaIUIzXeORvvhQfHaMJalB1ISZ6Oii
# tpmXaKIgvTKoqil8CnYan8hVjqvTe9Tjfll+knA5D+32L/NP/3Rc8+cwNECjEaNr
# cqQyEQV8/ZGLR6hXNlLH+rVFhNGyPkLlFl7dA9Op/T1wZ3raE+CEgmc4YFbDrbCI
# 4Qo3fmKBBrsjBO9YoCOo0QljMM3ZGTj061p3WL5fv+uULf8vBDBkEI8+WVYuOjZP
# DjyWD4/J6n5/STIfo19u2iKf19kXOVneSBd6AktYcf+3DC2h8GejEdz3ybzZHsts
# DBUneEgWayzxrZe4dWy7lcOOMYIEmjCCBJYCAQEwgcgwgbIxCzAJBgNVBAYTAlVT
# MRYwFAYDVQQKEw1FbnRydXN0LCBJbmMuMSgwJgYDVQQLEx9TZWUgd3d3LmVudHJ1
# c3QubmV0L2xlZ2FsLXRlcm1zMTkwNwYDVQQLEzAoYykgMjAxNSBFbnRydXN0LCBJ
# bmMuIC0gZm9yIGF1dGhvcml6ZWQgdXNlIG9ubHkxJjAkBgNVBAMTHUVudHJ1c3Qg
# VGltZXN0YW1waW5nIENBIC0gVFMxAhEAjc4V86eUxYcAAAAAVZIz9DALBglghkgB
# ZQMEAgGgggGmMBoGCSqGSIb3DQEJAzENBgsqhkiG9w0BCRABBDAcBgkqhkiG9w0B
# CQUxDxcNMjIwNzE4MTg0OTQ3WjApBgkqhkiG9w0BCTQxHDAaMAsGCWCGSAFlAwQC
# AaELBgkqhkiG9w0BAQswLwYJKoZIhvcNAQkEMSIEIFZUR8iCBq54A0f8QAw1HgS9
# WMnUFGwa6k4ICp9v9prDMIIBDAYLKoZIhvcNAQkQAi8xgfwwgfkwgfYwgfMEIJUK
# Jv3HwCAY6feRqVw48m7vPaQyZ8qwzRWlVa9jEHLJMIHOMIG4pIG1MIGyMQswCQYD
# VQQGEwJVUzEWMBQGA1UEChMNRW50cnVzdCwgSW5jLjEoMCYGA1UECxMfU2VlIHd3
# dy5lbnRydXN0Lm5ldC9sZWdhbC10ZXJtczE5MDcGA1UECxMwKGMpIDIwMTUgRW50
# cnVzdCwgSW5jLiAtIGZvciBhdXRob3JpemVkIHVzZSBvbmx5MSYwJAYDVQQDEx1F
# bnRydXN0IFRpbWVzdGFtcGluZyBDQSAtIFRTMQIRAI3OFfOnlMWHAAAAAFWSM/Qw
# CwYJKoZIhvcNAQELBIICABshKtRTK2T+GECpxSZocDI8FG152Qnc05kCyeRK0Vhj
# qZY6svPyNZD79LlxmZudVYGGtZwKc2HDLoMHJ1ijWx0/FX1P5dUIHxSijNiCOlUh
# owVJe+up5bRWW3saXuwdER7KDGZtHyd4PovC7/SX4AnALyTgGRXHwxrT9n4BgQH2
# KE5SB+EAeuuQ0wMwrc65EwYAFqriqaUv1lybOOWBDM8fRBm/LvW0V/y84s2WGYk2
# uRI7eMbpP/9KeupkxxzigLfNcmaJPWthkbDQwGPw9D881/ynHhW2KKEdlx+zK+4r
# ei1hwWpLPhDAU0IuZVx8BFAnI9OTSwG/3usL7L4YzkykK4FobagdEb6uv8P4CcFO
# BdcaS7e8ENDowi9ausb5jBwccZQOewPE2I2zmCw2ZXOPzjWnhsMItI3nWi8qOBZZ
# /mcoPhYCdDu17C0YmXBw3+GNxT8BdhSkF1rgQxrH6iHxuGbtvIgCPdRQnD/qkptn
# jufJxGrVhLBm8pIab1lYOFRlShQzc83EwZyDM/xvXsivDonG81M8lBsWZeUXy9Q5
# LEifKqJJv6Fo/4FQGQO9u7q5kIu9JSuvcixvtT5icGxs06PPI/30+oQXz93eN8Nw
# QduMbpDu1/2E65RqwK2C4oqnCBz+UOS52OvuM5fyaIc0W9Odnzuyj5BmOpCeYZZN
# SIG # End signature block
