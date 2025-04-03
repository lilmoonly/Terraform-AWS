resource "aws_iam_policy" "eks_admin_custom" {
  name        = "eks-admin-custom-policy"
  description = "Least-privilege policy for EKS cluster administration"

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect   = "Allow",
        Action   = [
          "eks:*",
          "ec2:Describe*",
          "iam:ListRoles",
          "iam:PassRole",
          "logs:*"
        ],
        Resource = "*"
      }
    ]
  })
}
