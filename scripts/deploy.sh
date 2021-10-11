echo Create the cloudformation package
aws cloudformation package --template template.yml --s3-bucket aws-sam-cli-managed-default-samclisourcebucket-1kni8z5nxcykx --output-template template-export.yml

echo Deploy the cloudformation package
aws cloudformation deploy --template-file template-export.yml --stack-name AzureDevopsAlbumStack --capabilities CAPABILITY_IAM

aws cloudformation wait stack-create-complete --stack-name AzureDevopsAlbumStack --region eu-west-1 


aws cloudformation describe-stack-events --stack-name AzureDevopsAlbumStack --region eu-west-1

echo All done