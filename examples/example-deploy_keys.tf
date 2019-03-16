module "repository_deploy_keys" {
  source = "../"

  name = "example"

  description = "My example codebase"

  deploy_keys = [
    {
      title = "example-key"
      key   = "ssh-rsa AAAAB3NzaC1yc2EAAA..."

      read_only = true
    },
  ]
}
