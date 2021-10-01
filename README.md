# cicd-taskcat
## CI/CD Pipeline for AWS CloudFormation Templates Using TaskCat on the AWS Cloud

This Quick Start deploys a continuous integration and continuous delivery (CI/CD) pipeline on the Amazon Web Services (AWS) Cloud for automatically testing AWS CloudFormation templates from a GitHub repository. 

The blog sets up a CI/CD environment that includes AWS TaskCat for testing, AWS CodePipeline for continuous integration, and AWS CodeBuild as your build service.

![image](https://user-images.githubusercontent.com/91735129/135618914-dada2b6e-0fa6-4ff9-8367-92a37ae1649b.png)



Creating a Pipeline to Run TaskCat
In this example, you will see how you can create a CloudFormation template that automatically provisions CodePipeline, a GitHub source provider, a CodeBuild project to run TaskCat, and another CodeBuild project to deploy the TaskCat dashboard. This way you can run TaskCat automatically without needing to manually type commands every time.

Deployment Steps
There are four main steps in launching this solution: prepare an AWS account, create and store source files, launch the CloudFormation stack, and test the deployment. Each is described in more detail in this section. Please note that you are responsible for any fees incurred while creating and launching your solution.

### Step 1. Prerequisites
Store your GitHub Personal Access Token in AWS Secrets Manager
In order for CodePipeline to use GitHub as a source provider it needs your GitHub personal access token. Since we want to run all changes automatically and we want to be secure, you need to store this secret in an encrypted location. You will do this in AWS Secrets Manager. Here are the steps:


- Go to the AWS Secrets Manager Console.
- Create a new Secret
   - Click on the Other type of secrets radio button.
   - Click on the Plaintext tab and enter the GitHub token value in the text area. 
   - Leave the Select the encryption key dropdown with the DefaultEncryptionKey option selected.

   - Enter github/personal-access-token for the Secret name and description on the Secret name and description page and click Next.
  
   - On the Configure automatic rotation page, select the Disable automatic rotation radio button.

### Step 2. Launch the Stack
````
sh aws/cfm1.sh
````
Or 
````
aws cloudformation create-stack --stack-name cicd-taskcat --capabilities CAPABILITY_NAMED_IAM --disable-rollback --template-body file:///home/ec2-user/environment/taskcat-example/pipeline-taskcat.yml --parameters ParameterKey=GitHubUser,ParameterValue=YOURGITHUBUSERID ParameterKey=GitHubRepo,ParameterValue=cicd-taskcat
````

## References

  - TaskCat is a tool that tests AWS CloudFormation templates. It creates stacks in multiple AWS Regions simultaneously and generates a report with a pass/fail grade for each region. You can specify the regions, indicate the number of Availability Zones you want to include in the test, and pass in the AWS CloudFormation parameter values you want to test. You can use this Quick Start to test any AWS CloudFormation templates, including nested templates, from a GitHub repository.

  - TaskCat is available as an [open-source tool in GitHub](https://github.com/aws-quickstart/taskcat).

## Credits
  - Paul Duvall


