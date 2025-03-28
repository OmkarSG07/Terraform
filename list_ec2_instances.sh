#!/bin/bash

for region in $(aws ec2 describe-regions --query 'Regions[*].RegionName' --output text); do
  echo "Checking region: $region"
  aws ec2 describe-instances --region $region \
    --query 'Reservations[*].Instances[*].[InstanceId, State.Name, InstanceType, Placement.AvailabilityZone]' \
    --output table
done
