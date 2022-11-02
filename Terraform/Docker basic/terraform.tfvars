# .tfvars files only define the values of variables unlike variables.tf which defines the properties as well.
# terraform.tfvars is used automatically. If it's named something else then it'll need to be specified using -var-file= flag during plan / apply.
secret_key = "TOPSECRET"
