# EBS for Testground daemon datadir
resource "aws_ebs_volume" "testground-daemon-datadir" {
  availability_zone = data.vpc.vpc_azs
  size = 10
  type = "gp2"

  tags = "testground"
}