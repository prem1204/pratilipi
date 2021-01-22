provider "aws" {
	region  = "ap-south-1"
}

resource "aws_security_group" "pratilipi_sg"{
  name = "pratilipi_sg"
  vpc_id = "vpc-462f0c2e"

        ingress{
                from_port = 22
                to_port = 8080
                protocol = "tcp"
        }

        egress{
                from_port = 3306
                to_port = 6379
                protocol = "tcp"	
		cidr_blocks = ["0.0.0.0/0"]
        }

        tags = {
                Name = "pratilipi_sg"
        }

}

resource "aws_s3_bucket" "bucket"{
	bucket = "pratilipi-bucket"
	acl = "private"

	tags = {
		Name = "pratilipi-bucket"
	}
	versioning {
		enabled = true
	}
}

resource "aws_iam_role" "pratilipi_iam_role" {
	name = "pratilipi_iam_role"
	assume_role_policy = "${file("ec2_assume_policy.json")}"
		
}

resource "aws_iam_role_policy" "pratilipi_iam_policy" {
	  name = "pratilipi_iam_policy"
	  role = aws_iam_role.pratilipi_iam_role.id
	  policy = "${file("s3_policy.json")}"	  
  	  
}

resource "aws_iam_instance_profile" "profile"{
	name = "profile"
	role = aws_iam_role.pratilipi_iam_role.name
}


resource "aws_instance" "pratilipi-assignment" {
	ami           = "ami-04b1ddd35fd71475a"
	instance_type = "t2.micro"
	iam_instance_profile = aws_iam_instance_profile.profile.name
	key_name = "pranay_key"
	tags = {
                Name = "pratilipi-instance"
        }
}

