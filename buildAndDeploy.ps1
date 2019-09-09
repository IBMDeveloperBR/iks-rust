Write-Host "Destroying old container images from IBM Private Container Registry..."
Invoke-Expression "ibmcloud cr image-rm us.icr.io/ibmdegla-cr-namespace/rust-application:latest"

Write-Host "Building new container images from the Dockerfiles and storing them at IBM Private Container Registry..."
Start-Sleep -s 5
Invoke-Expression "ibmcloud cr build -t us.icr.io/ibmdegla-cr-namespace/rust-application:latest ./services/rust_application"

Write-Host "Destroying old PODs at the IKS Cluster..."
Start-Sleep -s 5
Invoke-Expression "kubectl delete -f ./yaml/deploy_rust_application.yaml"

Write-Host "Starting new deployments from .yaml files at the IKS Cluster..."
Start-Sleep -s 5
Invoke-Expression "kubectl apply -f ./yaml/deploy_rust_application.yaml"

## Confirm the services are running - this may take a minute
Start-Sleep -s 5
Invoke-Expression "kubectl get pods"

Write-Host "Tracing logs..."
Start-Sleep -s 10
Invoke-Expression "kubectl logs rust-application --follow"