Generating a keypair in AWS using IAM user

provider "aws" {
    access_key = "AKIAQQU4xxxxxPMMABKVJD"
    secret_key = "ZXp1hVGKC7QqViDvPtxxxxxgrWBiUnUK45Yj8l"
    region = "us-west-2"
}


resource "aws_key_pair" "sshkey" {
  key_name   = "terraform-key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQxxxxxxxxxx2pe7R4g6s7KmGatuIhaq6P8FKNOFnMJRmcYx1gg3yH40Mvd+R3YT9HFLvEirYvYnT0bYvAnPabLGPwxZDkCayA/LvQe0/BxlhzVONgghGGoNLhUwSQ7SjUjJBuEmYLKhs7qp213OY8LVN78piG3Ida5ppj7Y+oxM9vDRFuQmyvv3wRJRYyU3+M4/ZwzpUr+fLNBRgB3boTTTiyXW17FIWd/T+zubVIo3I3U0hBoRFhrE3pEFCdXaq2Nc/0UmjfgygyjZTHqwgmOJPBrB4Mr1Dus8oJQyeoK1xHpKREIJSnkbSSMWoclN4LaTnn0Yj7IOvT3NjENNCUufgc6R root@MSI"
}
