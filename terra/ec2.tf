resource "aws_instance" "PRT_ins" {
  count                       = 3
  instance_type               = "t2.medium"
  subnet_id                   = aws_subnet.public-subnet.id
  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.allow_all.id]
  ami                         = "ami-0e1bed4f06a3b463d"
  key_name                    = aws_key_pair.my_key.key_name
  depends_on                  = [aws_vpc.myvpc, aws_internet_gateway.myigw, aws_subnet.public-subnet]
}

resource "aws_key_pair" "my_key" {
  key_name   = "my-ssh-key"
  public_key = file("./ansi/id_rsa.pub")

}
