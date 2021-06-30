
resource "aws_instance" "user_data_example_input_file" {
  ami           = lookup(var.ami_id, var.region)
  instance_type = "t2.micro"
  subnet_id     = "subnet-00d27fad11a313cdb"
  associate_public_ip_address = true

  # Security group assign to instance
  vpc_security_group_ids = [aws_security_group.MyLab_Sec_Group.id]

  # key name
  key_name  = var.key_name
  user_data = file("apache_config.sh")

  tags = {
    Name = "Apache-Server1"
  }
}


resource "aws_security_group" "MyLab_Sec_Group" {
  name        = "MyLab Security Group"
  description = "To allow inbound and outbound traffic to mylab"
  vpc_id      = "vpc-99e256f2"

  dynamic "ingress" {
    for_each = var.ports
    iterator = myPort

    content {
      from_port   = myPort.value
      to_port     = myPort.value
      protocol    = "tcp"
      cidr_blocks = ["47.187.192.91/32","172.31.0.0/16"]
    }
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "allow traffic"
  }
}