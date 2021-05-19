#!/bin/sh

echo "Please enter resource group name: " && read RESOURCE_GROUP
echo "Creating new resource group with name $RESOURCE_GROUP"
az group create --name $RESOURCE_GROUP --location eastus || (echo "Resource group creation failed!!!" && exit)

echo "Please enter the username to use as administrator credentials for Windows Server nodes on your cluster: " && read WINDOWS_USERNAME
echo "Please enter cluster name: " && read CLUSTER_NAME

echo "Creating new AKS cluster with name $CLUSTER_NAME"
az aks create \
    --resource-group $RESOURCE_GROUP \
    --name $CLUSTER_NAME \
    --node-count 1 \
    --enable-addons monitoring \
    --generate-ssh-keys \
    --windows-admin-username $WINDOWS_USERNAME \
    --vm-set-type VirtualMachineScaleSets \
    --network-plugin azure || (echo "AKS cluster creation failed!!!" && exit)

echo "Creating Windows node pool"
az aks nodepool add \
    --resource-group $RESOURCE_GROUP \
    --cluster-name $CLUSTER_NAME \
    --os-type Windows \
    --name npwin \
    --node-count 1 || (echo "Windows node pool creation failed!!!" && exit)

echo "Installing AKS CLI"
az aks install-cli

echo "Retreiving credentials"
az aks get-credentials --resource-group $RESOURCE_GROUP --name $CLUSTER_NAME