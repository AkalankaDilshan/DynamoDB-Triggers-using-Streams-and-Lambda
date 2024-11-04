output "function_role_arn" {
  value = aws_iam_role.function_role.arn
}

output "debug_role_arn" {
  value = module.lam_role.function_role_arn
}
