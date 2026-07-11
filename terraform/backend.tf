# ---------------------------------------------------------------------------
# Remote state backend (S3)
# ---------------------------------------------------------------------------
#
# The backend is COMMENTED OUT intentionally. On a fresh project the state
# bucket does not exist yet, so a backend configured up front would fail.
#
# Bootstrap procedure:
#
#   1. First run WITHOUT a backend (local state):
#          terraform init
#          terraform apply
#      This provisions the S3 bucket + CloudFront distribution using local
#      state (terraform.tfstate on disk).
#
#   2. Create a dedicated bucket to hold Terraform state (once), e.g.:
#          aws s3api create-bucket \
#            --bucket portfolio-site-tfstate \
#            --region ap-south-1 \
#            --create-bucket-configuration LocationConstraint=ap-south-1
#          aws s3api put-bucket-versioning \
#            --bucket portfolio-site-tfstate \
#            --versioning-configuration Status=Enabled
#
#   3. Uncomment the block below and fill in the bucket/key/region.
#
#   4. Migrate local state into the remote backend:
#          terraform init -migrate-state
#      Terraform will detect the new backend and offer to copy existing
#      state up to S3. Answer "yes".
#
# ---------------------------------------------------------------------------

# terraform {
#   backend "s3" {
#     bucket       = "portfolio-site-tfstate"
#     key          = "portfolio-site/terraform.tfstate"
#     region       = "ap-south-1"
#     encrypt      = true
#     use_lockfile = true
#   }
# }
