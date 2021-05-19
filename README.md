# Azure Kubernetes Service Example
This is an example of how to use AKS for both Windows and Linux.

## Setup Cluster
1. Execute the `./create-cluster.sh` script.
1. Run `kubectl get nodes` to confirm nodes were created successfully.

## Linux Example
1. Execute `kubectl apply -f linux-example.yaml`
1. Follow instructions in [Quickstart: Deploy an Azure Kubernetes Service cluster using the Azure CLI](https://docs.microsoft.com/en-us/azure/aks/kubernetes-walkthrough)

## Windows Example
1. Execute `kubectl apply -f windows-example.yaml`
1. Follow instructions in [Create a Windows Server container on an Azure Kubernetes Service (AKS) cluster using the Azure CLI](https://docs.microsoft.com/en-us/azure/aks/windows-container-cli)

## Job on Linux
1. Execute `kubectl apply -f linux-job.yaml`
1. Follow instructions in [Kubernetes Jobs](https://kubernetes.io/docs/concepts/workloads/controllers/job/)

## CronJob on Linux
1. Execute `kubectl apply -f linux-cronjob.yaml`
1. Follow instructions in [Running Automated Tasks with a CronJob](https://v1-19.docs.kubernetes.io/docs/tasks/job/automated-tasks-with-cron-jobs/)

## Clean Up
1. `./clean-up.sh`
