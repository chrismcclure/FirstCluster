Write-Output "`nStep 3. Scale the deployment from 2 to 4 pods `n"

kubectl apply -f .\YamlFiles\deployment-scale.yaml

Write-Output "`nWait 5 seconds for the pods to do their thing.`n"

Start-Sleep -Milliseconds 5000

.\check-info.ps1

#Powershell pull the header line into the array.  I don't really care to figure it out now, so minus 1.
$count = (kubectl get pods -l app=nginx).length - 1

#This whole thing should be a method or loop or something, but don't care since that's not the point of this learning.
if ($count -ne 4) {
    Write-Output("`nThere aren't 4 pods.  Give them another 10 seconds to get ready`n")

    Start-Sleep -Milliseconds 10000

    .\check-info.ps1
}



Invoke-RestMethod -uri "https://artii.herokuapp.com/make?text=Scale Complete&font=ttyb" -DisableKeepAlive |  write-host -ForegroundColor white

Write-Output "`n`n"