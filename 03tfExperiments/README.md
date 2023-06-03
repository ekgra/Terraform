In main.tf,

Change
    resource "random_pet" "bucket_name" {
    length    = 3                         # <<<<<<<<<<
    separator = "-"
    prefix    = "learning"
    }
to 
    resource "random_pet" "bucket_name" {
    length    = 5                         # <<<<<<<<<<
    separator = "-"
    prefix    = "learning"
    }

$ terraform plan
would destroy and recreate bucket and all dependent resources

$ terraform plan -target="random_pet.bucket_name"
only changes the bucket name

$ terraform apply -target="random_pet.bucket_name"