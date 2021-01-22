# pratilipi

### Given Task:

 ### To perform following actions using Terraform:
 
  1. Create a security group with inbound(22, 8080), outbound(3306, 6379) ports open
  
  2. Create a IAM Role - Access to s3, read and write to a selected bucket
  
  3. Create EC2 instance attaching the Security group and IAM role create in step 1 and 2
  
### Steps
 
 1. Setup AWS and Terraform on my system
 
 2. Create [main.tf](https://github.com/prem1204/pratilipi/blob/main/main.tf) which is our main terraform script. It creates following resources:
 
  1. Security group with inbound(22, 8080), outbound(3306, 6379) ports open.
  
  2. Create an S3 bucket.
  
  3. Create an iam role for ec2 having full access to an specific S3 bucket.
  
  4. Finally create an EC2 instance and attach iam role.
 
 3. Execute terraform commands (init, plan and apply)

### Output

#### Terraform initializing

![init](https://github.com/prem1204/pratilipi/blob/main/init.png)


#### Terraform planning

![plan](https://github.com/prem1204/pratilipi/blob/main/plan.png)


#### Terraform applying

![apply](https://github.com/prem1204/pratilipi/blob/main/approve.png)


#### pratilipi-instance created successfully

![ec2](https://github.com/prem1204/pratilipi/blob/main/ec2.png)


#### Terraform destroy

![destroy](https://github.com/prem1204/pratilipi/blob/main/destroy.png)

 
 ### Conclusion
 
 ***All Done.
Complete terraform code is shared [here](https://github.com/prem1204/pratilipi/blob/main/main.tf).***

  

 
