#Don't really need this part, but nice to know how to do it incase I need it 
#Write-Output "`nChekcing Deployments with name:nginx-deployment `n"

# kubectl get deployments nginx-deployment

Write-Output "`nChecking Pods`n"

kubectl get pods -l app=nginx

#This whole thing should be a method or loop or something, but don't care since that's not the point of this learning. 
$count = (kubectl get pods -l app=nginx).length - 1

if ($count -gt 0) {
    Write-Output("`nPod Count: $count`n")
}
else{
    Write-Host("No pods")
}

Write-Output "`n`n"