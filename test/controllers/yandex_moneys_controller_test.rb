require 'test_helper'

class YandexMoneysControllerTest < ActionController::TestCase
  setup do
    @client_order = yandex_moneys(:one)
    @encrypted_date_of_avisoPayment_yandex = "
      -----BEGIN PKCS7-----
        MIAGCSqGSIb3DQEHAqCAMIACAQExCzAJBgUrDgMCGgUAMIAGCSqGSIb3DQEHAaCA JIAEggPoPD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iVVRGLTgiID8+PHBh eW1lbnRBdmlzb1JlcXVlc3QgcGF5bWVudFBheWVyQ29kZT0iNDEwMDMyMjQ2ODU1 NyIgb3JkZXJTdW1CYW5rUGF5Y2FzaD0iMTAwMyIgcGF5bWVudERhdGV0aW1lPSIy MDE0LTAxLTE2VDE0OjIyOjA2LjAyMCswNDowMCIgc2hvcFN1bUJhbmtQYXljYXNo PSIxMDAzIiBpbnZvaWNlSWQ9IjIwMDAwMDAxMDIzMzkiIHJlcXVlc3REYXRldGlt ZT0iMjAxNC0wMS0xNlQxNDoyMjowNi40NDArMDQ6MDAiIHNob3BJZD0iMTQwMTAi IGN1c3RvbWVyTnVtYmVyPSI3MTAiIHNob3BTdW1BbW91bnQ9IjgxLjcwIiBvcmRl clN1bUN1cnJlbmN5UGF5Y2FzaD0iMTA2NDMiIHNob3BTdW1DdXJyZW5jeVBheWNh c2g9IjEwNjQzIiBvcmRlclN1bUFtb3VudD0iODYuMDAiIG9yZGVyQ3JlYXRlZERh dGV0aW1lPSIyMDE0LTAxLTE2VDE0OjIxOjUwLjgwNSswNDowMCI+PHBhcmFtIGtl eT0idGFyZ2V0Y3VycmVuY3kiIHZhbD0iNjQzIj48L3BhcmFtPjxwYXJhbSBrZXk9 ImNwc190aGVtZSIgdmFsPSJkZWZhdWx0Ij48L3BhcmFtPjxwYXJhbSBrZXk9Imlz T1VUc2hvcCIgdmFsPSJ0cnVlIj48L3BhcmFtPjxwYXJhbSBrZXk9Im1lcmNoYW50 X29yZGVyX2lkIiB2YWw9IjcxMF8xNjAxMTQxNDIxNDlfMDAwMDBfMTQwMTAiPjwv cGFyYW0+PHBhcmFtIGtleT0ic3VtQ3VycmVuY3kiIHZhbD0iMDAwIj48L3BhcmFt PjxwYXJhbSBrZXk9ImZhaWxVcmwiIHZhbD0iaHR0cDovL3d3dy5zaGFyYW5hdnRp LnJ1Ij48L3BhcmFtPjxwYXJhbSBrZXk9InltX25lZWRfc3lzdGVtX3BhcmFtcyIg dmFsPSIxIj48L3BhcmFtPjxwYXJhbSBrZXk9IkVycm9yVGVtcGxhdGUiIHZhbD0i eW0yeG1sZXJyb3IiPjwvcGFyYW0+PHBhcmFtIGtleT0ic3VjY2Vzc1VybCIgdmFs PSJodHRwOi8vd3d3LnNoYXJhbmF2dGkucnUiPjwvcGFyYW0+PHBhcmFtIGtleT0i aXNWaWFXZWIiIHZhbD0idHJ1ZSI+PC9wYXJhbT48cGFyYW0ga2V5PSJTdWNjZQSB znNzVGVtcGxhdGUiIHZhbD0ieW0yeG1sc3VjY2VzcyI+PC9wYXJhbT48cGFyYW0g a2V5PSJjcHMtc291cmNlIiB2YWw9ImRlZmF1bHQiPjwvcGFyYW0+PHBhcmFtIGtl eT0iYmFja3VybCIgdmFsPSJodHRwOi8vd3d3LnNoYXJhbmF2dGkucnUiPjwvcGFy YW0+PHBhcmFtIGtleT0ic2NpZCIgdmFsPSI1MDMxNCI+PC9wYXJhbT48L3BheW1l bnRBdmlzb1JlcXVlc3Q+AAAAAAAAoIAwggTEMIIELaADAgECAgoxIAUXAAIAAC/X MA0GCSqGSIb3DQEBBQUAMEkxCzAJBgNVBAYTAlJVMRgwFgYDVQQKEw9QUyBZYW5k ZXguTW9uZXkxIDAeBgNVBAMTF1lhbmRleCBNb25leSBJc3N1aW5nIENBMB4XDTEz MDUwNzA3NTc0MFoXDTE0MDUwNzA3NTc0MFowgZQxCzAJBgNVBAYTAlJVMRkwFwYD VQQHExBTYWludC1QZXRlcnNidXJnMRUwEwYDVQQKEwxZYW5kZXguTW9uZXkxCzAJ BgNVBAsTAklUMRYwFAYDVQQDEw1QYXltZW50Q2VudGVyMS4wLAYJKoZIhvcNAQkB Fh9zeXN0ZW1hZG1pbmlzdHJhdG9yc0B5YW1vbmV5LnJ1MIIBIjANBgkqhkiG9w0B AQEFAAOCAQ8AMIIBCgKCAQEAzH8JzMJNKDVu64bMa0Lsw9QpipcB3B7AuKOVR3t5 IF4eBeBMEVQmnlzI/oPcZyvRXXa2jV9EGfXGjqxMLg73kEOSdB3M9T0zovucmMSU HimMmMweTitF7rtTs0ifZyVFN51eiU9St9tPe9iNfRupjPQ2iIzdtOiGv2JQ4zqs 1Qly+UItmVQm/WMmykJ5EVGsKemr5X80vS03WeeeHSPccCcYu12FOaiT7ci76pY1 UMyxcsWXhzzNdvCMMgrKv5AUHhZsPMBO0lh7NQ6vNQyYBJCZjK/t8oRa4dk0jENL ktljCIxzAz0MNmc7YqpvH/ZpQ1hoQf9t/9bkPxt/Pm3ZOwIDAQABo4IB4TCCAd0w HQYDVR0OBBYEFGHGoT1H7SZ83MIbN3Vi+tveeHxjMB8GA1UdIwQYMBaAFOYs54hV acgsOj12YBbjVtpeMpLcMDUGA1UdHwQuMCwwKqAooCaGJGh0dHA6Ly9jcmxzLnlh bW9uZXkucnUvaXNzdWluZ2NhLmNybDCBzgYIKwYBBQUHAQEEgcEwgb4wgbsGCCsG AQUFBzAChoGubGRhcDovLy9DTj1ZYW5kZXglMjBNb25leSUyMElzc3VpbmclMjBD QSxDTj1BSUEsQ049UHVibGljJTIwS2V5JTIwU2VydmljZXMsQ049U2VydmljZXMs Q049Q29uZmlndXJhdGlvbixEQz15YW1vbmV5LERDPXJ1P2NBQ2VydGlmaWNhdGU/ YmFzZT9vYmplY3RDbGFzcz1jZXJ0aWZpY2F0aW9uQXV0aG9yaXR5MAsGA1UdDwQE AwIHgDA+BgkrBgEEAYI3FQcEMTAvBicrBgEEAYI3FQiE09A1hPTqFIPJjSWH77cz hLbMAYFngpviFYGduX4CAWQCAQkwHQYDVR0lBBYwFAYIKwYBBQUHAwQGCCsGAQUF BwMCMCcGCSsGAQQBgjcVCgQaMBgwCgYIKwYBBQUHAwQwCgYIKwYBBQUHAwIwDQYJ KoZIhvcNAQEFBQADgYEADOT9d3yznHy5Z3IEsmJfK/6rrjgn9agBOXjM6vTPaagU Ow3tqP13ShvKnFD6jl2hSKsYrJ/dUrfpvKTXX8GINBIzpS7TbwPNmc7WLuzVSnJC EqMieWD9t/8wATB+JDjPBAgJufWTgDHT4hK047WzzsAqVRYG/qVV3NdpB1MKjOEA ADGCAd0wggHZAgEBMFcwSTELMAkGA1UEBhMCUlUxGDAWBgNVBAoTD1BTIFlhbmRl eC5Nb25leTEgMB4GA1UEAxMXWWFuZGV4IE1vbmV5IElzc3VpbmcgQ0ECCjEgBRcA AgAAL9cwCQYFKw4DAhoFAKBdMBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJ KoZIhvcNAQkFMQ8XDTE0MDExNjEwMjIwNlowIwYJKoZIhvcNAQkEMRYEFF+tw1Ig tJeQ2z2huAIjXXE9aAE3MA0GCSqGSIb3DQEBAQUABIIBADolrQPryo65RZeLQ1Yq YuCNECpwLr1B4XireEMTvGJKv11Dx/CjYcFEq1uw0N8DQ3EW+8g04ZM6DnlmY9Gz Ts7r/Z5b/UP+7UiAhPzmH2U8ewnT+EWmOuAtLYaL7NDkGSooiT3gCfQjFGmuFetb VToWouo3vDw6Mb835sAOojBOWKeC5u2WLQ6u37Noa/rM9+dhirnh4PMFEeTw1eUK z0yV752Ey1qGUgRM5RAf78w0xG6OiKzM8RX3LH2aQhb36Gcrachokt/TfAThtPbx 4iIg+xWa77ikRtuLQUMfYRuMcbqn+lAf9lMRfwbbdLt48vBNwf4t2KsO8V8Tnqc8 mBgAAAAAAAA=
      -----END PKCS7-----
    "
    @encrypted_date_of_checkOrder_yandex  = "
      -----BEGIN PKCS7-----
        MIAGCSqGSIb3DQEHAqCAMIACAQExCzAJBgUrDgMCGgUAMIAGCSqGSIb3DQEHAaCA JIAEggPoPD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iVVRGLTgiID8+PGNo ZWNrT3JkZXJSZXF1ZXN0IHBheW1lbnRQYXllckNvZGU9IjQxMDAzMjI0Njg1NTci IG9yZGVyU3VtQmFua1BheWNhc2g9IjEwMDMiIHNob3BTdW1CYW5rUGF5Y2FzaD0i MTAwMyIgaW52b2ljZUlkPSIyMDAwMDAwMTAyMzM5IiByZXF1ZXN0RGF0ZXRpbWU9 IjIwMTQtMDEtMTZUMTQ6MjI6MDUuNzk1KzA0OjAwIiBzaG9wSWQ9IjE0MDEwIiBj dXN0b21lck51bWJlcj0iNzEwIiBzaG9wU3VtQW1vdW50PSI4MS43MCIgb3JkZXJT dW1DdXJyZW5jeVBheWNhc2g9IjEwNjQzIiBzaG9wU3VtQ3VycmVuY3lQYXljYXNo PSIxMDY0MyIgb3JkZXJTdW1BbW91bnQ9Ijg2LjAwIiBvcmRlckNyZWF0ZWREYXRl dGltZT0iMjAxNC0wMS0xNlQxNDoyMTo1MC44MDUrMDQ6MDAiPjxwYXJhbSBrZXk9 InRhcmdldGN1cnJlbmN5IiB2YWw9IjY0MyI+PC9wYXJhbT48cGFyYW0ga2V5PSJj cHNfdGhlbWUiIHZhbD0iZGVmYXVsdCI+PC9wYXJhbT48cGFyYW0ga2V5PSJpc09V VHNob3AiIHZhbD0idHJ1ZSI+PC9wYXJhbT48cGFyYW0ga2V5PSJtZXJjaGFudF9v cmRlcl9pZCIgdmFsPSI3MTBfMTYwMTE0MTQyMTQ5XzAwMDAwXzE0MDEwIj48L3Bh cmFtPjxwYXJhbSBrZXk9InN1bUN1cnJlbmN5IiB2YWw9IjAwMCI+PC9wYXJhbT48 cGFyYW0ga2V5PSJmYWlsVXJsIiB2YWw9Imh0dHA6Ly93d3cuc2hhcmFuYXZ0aS5y dSI+PC9wYXJhbT48cGFyYW0ga2V5PSJ5bV9uZWVkX3N5c3RlbV9wYXJhbXMiIHZh bD0iMSI+PC9wYXJhbT48cGFyYW0ga2V5PSJFcnJvclRlbXBsYXRlIiB2YWw9Inlt MnhtbGVycm9yIj48L3BhcmFtPjxwYXJhbSBrZXk9InN1Y2Nlc3NVcmwiIHZhbD0i aHR0cDovL3d3dy5zaGFyYW5hdnRpLnJ1Ij48L3BhcmFtPjxwYXJhbSBrZXk9Imlz VmlhV2ViIiB2YWw9InRydWUiPjwvcGFyYW0+PHBhcmFtIGtleT0iU3VjY2Vzc1Rl bXBsYXRlIiB2YWw9InltMnhtbHN1Y2Nlc3MiPjwvcGFyYW0+PHBhcmFtIGtleQSB mj0iY3BzLXNvdXJjZSIgdmFsPSJkZWZhdWx0Ij48L3BhcmFtPjxwYXJhbSBrZXk9 ImJhY2t1cmwiIHZhbD0iaHR0cDovL3d3dy5zaGFyYW5hdnRpLnJ1Ij48L3BhcmFt PjxwYXJhbSBrZXk9InNjaWQiIHZhbD0iNTAzMTQiPjwvcGFyYW0+PC9jaGVja09y ZGVyUmVxdWVzdD4AAAAAAACggDCCBMQwggQtoAMCAQICCjEgBRcAAgAAL9cwDQYJ KoZIhvcNAQEFBQAwSTELMAkGA1UEBhMCUlUxGDAWBgNVBAoTD1BTIFlhbmRleC5N b25leTEgMB4GA1UEAxMXWWFuZGV4IE1vbmV5IElzc3VpbmcgQ0EwHhcNMTMwNTA3 MDc1NzQwWhcNMTQwNTA3MDc1NzQwWjCBlDELMAkGA1UEBhMCUlUxGTAXBgNVBAcT EFNhaW50LVBldGVyc2J1cmcxFTATBgNVBAoTDFlhbmRleC5Nb25leTELMAkGA1UE CxMCSVQxFjAUBgNVBAMTDVBheW1lbnRDZW50ZXIxLjAsBgkqhkiG9w0BCQEWH3N5 c3RlbWFkbWluaXN0cmF0b3JzQHlhbW9uZXkucnUwggEiMA0GCSqGSIb3DQEBAQUA A4IBDwAwggEKAoIBAQDMfwnMwk0oNW7rhsxrQuzD1CmKlwHcHsC4o5VHe3kgXh4F 4EwRVCaeXMj+g9xnK9FddraNX0QZ9caOrEwuDveQQ5J0Hcz1PTOi+5yYxJQeKYyY zB5OK0Xuu1OzSJ9nJUU3nV6JT1K320972I19G6mM9DaIjN206Ia/YlDjOqzVCXL5 Qi2ZVCb9YybKQnkRUawp6avlfzS9LTdZ554dI9xwJxi7XYU5qJPtyLvqljVQzLFy xZeHPM128IwyCsq/kBQeFmw8wE7SWHs1Dq81DJgEkJmMr+3yhFrh2TSMQ0uS2WMI jHMDPQw2Zztiqm8f9mlDWGhB/23/1uQ/G38+bdk7AgMBAAGjggHhMIIB3TAdBgNV HQ4EFgQUYcahPUftJnzcwhs3dWL62954fGMwHwYDVR0jBBgwFoAU5izniFVpyCw6 PXZgFuNW2l4yktwwNQYDVR0fBC4wLDAqoCigJoYkaHR0cDovL2NybHMueWFtb25l eS5ydS9pc3N1aW5nY2EuY3JsMIHOBggrBgEFBQcBAQSBwTCBvjCBuwYIKwYBBQUH MAKGga5sZGFwOi8vL0NOPVlhbmRleCUyME1vbmV5JTIwSXNzdWluZyUyMENBLENO PUFJQSxDTj1QdWJsaWMlMjBLZXklMjBTZXJ2aWNlcyxDTj1TZXJ2aWNlcyxDTj1D b25maWd1cmF0aW9uLERDPXlhbW9uZXksREM9cnU/Y0FDZXJ0aWZpY2F0ZT9iYXNl P29iamVjdENsYXNzPWNlcnRpZmljYXRpb25BdXRob3JpdHkwCwYDVR0PBAQDAgeA MD4GCSsGAQQBgjcVBwQxMC8GJysGAQQBgjcVCITT0DWE9OoUg8mNJYfvtzOEtswB gWeCm+IVgZ25fgIBZAIBCTAdBgNVHSUEFjAUBggrBgEFBQcDBAYIKwYBBQUHAwIw JwYJKwYBBAGCNxUKBBowGDAKBggrBgEFBQcDBDAKBggrBgEFBQcDAjANBgkqhkiG 9w0BAQUFAAOBgQAM5P13fLOcfLlncgSyYl8r/quuOCf1qAE5eMzq9M9pqBQ7De2o /XdKG8qcUPqOXaFIqxisn91St+m8pNdfwYg0EjOlLtNvA82ZztYu7NVKckISoyJ5 YP23/zABMH4kOM8ECAm59ZOAMdPiErTjtbPOwCpVFgb+pVXc12kHUwqM4QAAMYIB 3TCCAdkCAQEwVzBJMQswCQYDVQQGEwJSVTEYMBYGA1UEChMPUFMgWWFuZGV4Lk1v bmV5MSAwHgYDVQQDExdZYW5kZXggTW9uZXkgSXNzdWluZyBDQQIKMSAFFwACAAAv 1zAJBgUrDgMCGgUAoF0wGAYJKoZIhvcNAQkDMQsGCSqGSIb3DQEHATAcBgkqhkiG 9w0BCQUxDxcNMTQwMTE2MTAyMjA1WjAjBgkqhkiG9w0BCQQxFgQUhpg/5sFyd8xK T9NzZn3eY6yOBCowDQYJKoZIhvcNAQEBBQAEggEAEyU7TOVDC8PIlQ+87iU+jGbq PE0KEz+LoQyoceAB9LqCZXPwzWSS9a5bDXaZajyf9SurBNaNXu649AZgjcotNt/l 1kCoqNJO9ea/pGVIl8ImQ6LcVPLpXe7X+iUg7j8iuiGAJIrF2MZaMOPAXQFJWnhx VJbDBIWErz68xB0ID1NEgv3my2qdOcLkw1F08SxpHHM9KEvgDLyrQUgTUliVScnO WU/5OJqXBh8rpO/h7VDf1v3Y3YsmmvYfkcIQK42rjabAaphxLrJh1uP8MxN1ZsHv tFFNvk9fe3DyQuzvYPAkOPDqyLKPVZtF1L3LehOK1fhb7jO3Gd1aqQ6rtKwfQAAA AAAAAA==
      -----END PKCS7-----
    "
  end
  
  test "should check order" do
    post :check_order, @encrypted_date_of_checkOrder_yandex
    assert_response :success
  end

  test "should set payment done" do
    post :payment_done, @encrypted_date_of_avisoPayment_yandex
    assert_response :success
  end
end
