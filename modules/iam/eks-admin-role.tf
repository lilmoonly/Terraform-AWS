resource "aws_iam_role" "eks_admin" {
  name = "eks-admin-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Principal = {
          AWS = "arn:aws:iam::733573665725:user/eks-admin"
        },
        Action = "sts:AssumeRole"
      }
    ]
  })
}

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

resource "aws_iam_role_policy_attachment" "eks_admin_policy" {
  role       = aws_iam_role.eks_admin.name
  policy_arn = aws_iam_policy.eks_admin_custom.arn
}

output "eks_admin_role_arn" {
  description = "ARN of the EKS admin IAM role."
  value       = aws_iam_role.eks_admin.arn
}

output "eks_admin_policy_arn" {
  description = "ARN of the EKS admin policy."
  value       = aws_iam_policy.eks_admin_custom.arn
}
