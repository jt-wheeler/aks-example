# Azure Kubernetes Service Example

## Setup Cluster
1. Execute the `./create-cluster.sh` script.
1. Run `kubectl get nodes` to confirm nodes were created successfully.

## Linux Example
[Quickstart: Deploy an Azure Kubernetes Service cluster using the Azure CLI](https://docs.microsoft.com/en-us/azure/aks/kubernetes-walkthrough)
1. Execute `kubectl apply -f linux-example.yaml`
1. Monitor progress using `kubectl get service azure-vote-front --watch`
1. After the EXTERNAL-IP is assigned, navigate to IP address in the browser. The Azure Voting App should load. 

## Windows Example
[Create a Windows Server container on an Azure Kubernetes Service (AKS) cluster using the Azure CLI](https://docs.microsoft.com/en-us/azure/aks/windows-container-cli)
1. Execute `kubectl apply -f windows-example.yaml`
1. Monitor progress using `kubectl get service sample --watch`
1. After the EXTERNAL-IP is assigned, navigate to IP address in the browser. The generic ASP.NET Framework app should load.

## Job on Linux
[Kubernetes Jobs](https://kubernetes.io/docs/concepts/workloads/controllers/job/)
1. Execute `kubectl apply -f linux-job.yaml`
1. `kubectl describe jobs/pi`
1. `pods=$(kubectl get pods --selector=job-name=pi --output=jsonpath='{.items[*].metadata.name}')`
1. `kubectl logs $pods`

## CronJob on Linux
[Running Automated Tasks with a CronJob](https://v1-19.docs.kubernetes.io/docs/tasks/job/automated-tasks-with-cron-jobs/)
1. Execute `kubectl apply -f linux-cronjob.yaml`
1. `kubectl get cronjob hello`
1. `kubectl get jobs --watch`
1. `kubectl get cronjob hello`
1. Replace "hello-4111706356" with the job name in your system `pods=$(kubectl get pods --selector=job-name=hello-4111706356 --output=jsonpath={.items[*].metadata.name})`
1. `kubectl logs $pods`

## Clean Up
1. `./clean-up.sh`