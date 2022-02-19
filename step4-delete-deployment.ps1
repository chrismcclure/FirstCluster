Write-Output "`nStep 4. Deleting Deployments `n"

kubectl delete deployment nginx-deployment

Invoke-RestMethod -uri "https://artii.herokuapp.com/make?text=Deploy Deleted&font=ttyb" -DisableKeepAlive |  write-host -ForegroundColor Cyan

Write-Output "`n`n"

.\check-info.ps1

#Powershell pull the header line into the array.  I don't really care to figure it out now, so minus 1.
$count = (kubectl get pods -l app=nginx).length - 1

#This whole thing should be a method or loop or something, but don't care since that's not the point of this learning.
if ($count -gt 0) {
    Write-Output("`nShouldn't have any pods.  Give them another 10 seconds to get ready`n")

    Start-Sleep -Milliseconds 10000

    .\check-info.ps1
}