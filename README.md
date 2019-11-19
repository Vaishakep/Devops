# Terraform


Genrating new Key in AWS console using Terraform


We have to generate a access key abd secret key for the IAM user in AWS having admin privilage:

provider "aws" {
    access_key = "AKIAQQUxxxxxxABKVJD"
    secret_key = "ZXp1hxxxxxxxxQsgrWBiUnUK45Yj8l"
    region = "us-west-2"
}


resource "aws_key_pair" "sshkey" {
  key_name   = "terraform-key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDpniPy2pe7R4g6s7KmGatuIhaq6P8FKNOFnMJRmcYx1gg3yH40Mvd+R3YT9HFLvEirYvYnT0bYvAnPabLGPwxZDkCayA/LvQe0/BxlhzVONgghGxxxxxxxxp213OY8LVN78piG3Ida5ppj7Y+oxM9vDRFuQmyvv3wRJRYyU3+M4/ZwzpUr+fLNBRgB3boTTTiyXW17FIWd/T+zubVIo3I3U0hBoRFhrE3pEFCdXaq2Nc/0UmjfgygyjZTHqwgmOJPBrB4Mr1Dus8oJQyeoK1xHpKREIJSnkbSSMWoclN4LaTnn0Yj7IOvT3NjENNCUufgc6R root@MSI"
}
