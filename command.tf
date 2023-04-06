# terraform  init
# terraform validate
# terraform plan
# terraform apply
// terraform apply --auto-approve
# terraform destroy
// terraform destroy --auto-approve
# terraform fmt
# terraform refresh
# terraform import

// maintain terraform state file on remote

/*
terraform {
    backend "s3" {
        bucket = "s3 bucket name"
        key = "where we store state file that path"
        region = "region name"
    }
}
*/