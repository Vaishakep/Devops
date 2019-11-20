provider "aws" {
    access_key = "AKIAQQU4ZxxxMMABKVJD"
    secret_key = "ZXp1hVGKC7QqViDxxxximUqQsgrWBiUnUK45Yj8l"
    region = "us-west-2"
}


resource "aws_key_pair" "sshkey" {
  key_name   = "terraform-key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDpniPy2pe7R4g6s7KmGatuIhaqxxxxxFKNOFnMJRmcYx1gg3yH40Mvd+R3YT9HFLvEirYvYnT0bYvAnPabLGPwxZDkCayA/LvQe0/BxlhzVONgghGGoNLhUwSQ7SjUjJBuEmYLKhs7qp213OY8LVN78piG3Ida5ppj7Y+oxM9vDRFuQmyvv3wRJRYyU3+M4/ZwzpUr+fLNBRgB3boTTTiyXW17FIWd/T+zubVIo3I3U0hBoRFhrE3pEFCdXaq2Nc/0UmjfgygyjZTHqwgmOJPBrB4Mr1Dus8oJQyeoK1xHpKREIJSnkbSSMWoclN4LaTnn0Yj7IOvT3NjENNCUufgc6R root@MSI"
}

resource "aws_security_group" "terraform-security" {
     name            = "terraform-security"
    description  = "allows 22,80 from all"

    ingress {
        cidr_blocks = ["0.0.0.0/0"]
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
      }

    ingress {
        cidr_blocks = ["0.0.0.0/0"]
        from_port   = 80
        to_port     = 80
        protocol    = "tcp"
      }

    ingress {
        cidr_blocks = ["0.0.0.0/0"]
        from_port   = 3306
        to_port     = 3306
        protocol    = "tcp"
      }

    egress {
        from_port       = 0
        to_port         = 0
        protocol        = "-1"
        cidr_blocks     = ["0.0.0.0/0"]
    }

    tags = {
        Name = "terraform-security"
    }
}


resource "aws_instance" "terraform" {

    ami = "ami-0a8585xxbfc5345c38"
    instance_type = "t2.micro"
    key_name = "terraform-key"
    availability_zone  = "us-west-2a"
    associate_public_ip_address = true
    vpc_security_group_ids = ["${aws_security_group.terraform-security.id}"]
    tags = {
        Name = "terraform"
  }
}


resource "aws_instance" "database" {

    ami = "ami-08d4xxx68314a58df"
    instance_type = "t2.micro"
    key_name = "terraform-key"
    availability_zone  = "us-west-2a"
    associate_public_ip_address = true
    vpc_security_group_ids = ["${aws_security_group.terraform-security.id}"]
    tags = {
        Name = "Database"
  }
}
