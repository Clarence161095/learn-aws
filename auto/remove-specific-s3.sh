#!/bin/bash

PREFIX="101-lab-practice-"

aws s3api list-buckets --query "Buckets[?starts_with(Name, '$PREFIX')].Name" --output text | tr '\t' '\n' | while read bucket; do
  echo "Đang xử lý bucket: $bucket"
  
  # Xóa tất cả các đối tượng
  aws s3api delete-objects --bucket "$bucket" --delete "$(aws s3api list-object-versions --bucket "$bucket" --output=json --query='{Objects: Versions[].{Key:Key,VersionId:VersionId}}')"
  
  # Xóa tất cả các phiên bản đánh dấu xóa
  aws s3api delete-objects --bucket "$bucket" --delete "$(aws s3api list-object-versions --bucket "$bucket" --output=json --query='{Objects: DeleteMarkers[].{Key:Key,VersionId:VersionId}}')"
  
  # Xóa bucket
  aws s3 rb "s3://$bucket" --force
  
  echo "Đã xóa bucket: $bucket"
done