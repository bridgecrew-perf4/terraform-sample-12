aws s3api put-public-access-block --bucket tfstate-permanently-ty \
--public-access-block-configuration '{
"BlockPublicAcls" : true,
"IgnorePublicAcls" : true,
"BlockPublicPolicy" : true,
"RestrictPublicBuckets" : true
}'