Write-Output "Set 1: Run the deployment YAML to create deployment of image: nginx:1.14.2 with 2 pods `n" 

kubectl apply -f .\YamlFiles\deployment.yaml

Write-Output "`nInitial Deployment Complete. `n"

Write-Output "`nDescribe Deployment.`n "

kubectl describe deployment nginx-deployment

Write-Output "`n5 seconds to read this, if you want to and for the pods to get going`n"

Start-Sleep -Milliseconds 5000

.\check-info.ps1

#Powershell pull the header line into the array.  I don't really care to figure it out now, so minus 1.
$count = (kubectl get pods -l app=nginx).length - 1

#This whole thing should be a method or loop or something, but don't care since that's not the point of this learning.
if ($count -ne 2) {
    Write-Output("`nThere aren't 2 pods.  Give them another 10 seconds to get ready`n")

    Start-Sleep -Milliseconds 10000

    .\check-info.ps1
}

Invoke-RestMethod -uri "https://artii.herokuapp.com/make?text=Initial Deploy Complete&font=ttyb" -DisableKeepAlive |  write-host -ForegroundColor Magenta

Write-Output "`n`n"