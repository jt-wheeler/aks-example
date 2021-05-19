#!/bin/sh
echo "Please enter resource group name to delete: " && read RESOURCE_GROUP

az group delete --name $RESOURCE_GROUP --yes --no-wait