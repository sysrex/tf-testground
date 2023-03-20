# EFS for Testground outputs
resource "aws_efs_file_system" "default" {
  count           = 1

  tags = {
    Name = "${local.project_name}-${local.environment}-efs"
  }
}

// TODO: refactor this part PLEASE
resource "aws_efs_mount_target" "target_subnet_zone_a" {
  count           = 1
  file_system_id  = join("", aws_efs_file_system.default.*.id)
  subnet_id       = module.vpc.private_subnets[0]
  security_groups = [module.vpc.default_security_group_id]
}

resource "aws_efs_mount_target" "target_subnet_zone_b" {
  count           = 1
  file_system_id  = join("", aws_efs_file_system.default.*.id)
  subnet_id       = module.vpc.private_subnets[1]
  security_groups = [module.vpc.default_security_group_id]
}


resource "aws_efs_mount_target" "target_subnet_zone_c" {
  count           = 1
  file_system_id  = join("", aws_efs_file_system.default.*.id)
  subnet_id       = module.vpc.private_subnets[2]
  security_groups = [module.vpc.default_security_group_id]
}
