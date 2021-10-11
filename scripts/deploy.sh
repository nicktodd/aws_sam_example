# Download the dependencies
npm install

# Run the tests
npm test


stackname=AzureDevopsAlbumStack

echo Create the cloudformation package
aws cloudformation package --template template.yml --s3-bucket aws-sam-cli-managed-default-samclisourcebucket-1kni8z5nxcykx --output-template template-export.yml

echo Deploy the cloudformation package
aws cloudformation deploy --template-file template-export.yml --stack-name $stackname --capabilities CAPABILITY_IAM

#aws cloudformation wait stack-create-complete --stack-name $stackname --region eu-west-1 

#aws cloudformation describe-stack-events --stack-name $stackname --region eu-west-1

echo All done