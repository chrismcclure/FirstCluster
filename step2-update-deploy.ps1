Write-Output "`nStep 2. Update the version of nginx we are using from `n"

Write-Output "`nnginx:1.14.2 to nginx:1.16.1 `n"

kubectl apply -f .\YamlFiles\deployment-update.yaml

Write-Output "`nGet the pods right away. There will be probably be 3 or 4.  A few going away and two being created or completed`n"

kubectl get pods -l app=nginx

Write-Output "`nWait 10 seconds for them to do their thing.`n"

Start-Sleep -Milliseconds 10000

.\check-info.ps1

#Powershell pull the header line into the array.  I don't really care to figure it out now, so minus 1.
$count = (kubectl get pods -l app=nginx).length - 1

if ($count -ne 2) {
    Write-Output("`nThere aren't 2 pods.  Give them another 10 seconds to get ready`n")

    Start-Sleep -Milliseconds 10000

    .\check-info.ps1
}

Invoke-RestMethod -uri "https://artii.herokuapp.com/make?text=Update Complete&font=ttyb" -DisableKeepAlive |  write-host -ForegroundColor Yellow

Write-Output "`n`n"