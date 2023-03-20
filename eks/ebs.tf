# EBS for Testground daemon datadir
resource "aws_ebs_volume" "testground-daemon-datadir" {
  availability_zone = module.vpc.azs[0]
  size = 10
  type = "gp3"

  tags = {
    "project": "testground"
  }
}
