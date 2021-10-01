aws cloudformation create-stack \
	--stack-name pipeline-taskcat --capabilities CAPABILITY_NAMED_IAM --disable-rollback \
	--template-body file:///home/ec2-user/github/cicd-taskcat/pipeline-taskcat.yml \
	--parameters ParameterKey=GitHubUser,ParameterValue=twocoins-ca \
	ParameterKey=GitHubRepo,ParameterValue=cicd-taskcat


