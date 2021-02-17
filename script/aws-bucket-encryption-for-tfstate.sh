aws s3api put-bucket-encryption --bucket tfstate-permanently-ty \
--server-side-encryption-configuration '{
	"Rules" : [
		{
		"ApplyServerSideEncryptionByDefault" :{
			"SSEAlgorithm" : "AES256"
			}
		}
	]
}'