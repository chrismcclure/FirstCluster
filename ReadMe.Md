# First Attempt at K8s locally

I wanted to make a little project to do the very very very basics of K8s. I think I did that.  I also didn't want to type the kubectl command over and over, so I made a couple scripts. 

## Prerequisites.   

#### 1) Install Kubernetes for windows.  
    Follow the steps on here: https://kubernetes.io/docs/tasks/tools/install-kubectl-windows/
#### 2) Install MinKube for windows
    Follow the steps on here:https://kubernetes.io/docs/tasks/tools/install-kubectl-windows/
#### 3) Run this command if you haven't already:  minikube start
#### 4) Change the directory on powershel this directory and you are ready to go. 


## Demo
#### 1) Run in powershell:  .\step1-initial-deploy.ps1

This will create the deployment based on the YamlFile\deployment.yaml file, then make sure the correct number of nodes are present.

#### 2) Run in powershell:  .\step2-update-deploy.ps1

This updates the underlying image of nginx from nginx:1.14.2 to nginx:1.16.1 

#### 3) Run in powershell: .\step3-scale-deployment.ps1

This will scale the application up to 4 nodes from 2 nodes and wait for 2 nodes to be present.

#### 4) Run in powershell: .\step4-delete-deployment.ps1

This will delete the deployment and wait for the node count to be approximately zero.  

That's it. You're welcome. 

![That's it. The end](https://media.giphy.com/media/DAtJCG1t3im1G/giphy.gif)
