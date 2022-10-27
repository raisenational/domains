# Web domain configuration (DNS records)

This repository contains configuration for our website domains. Using git allows us to enable self-serve changes, enforce peer-review, and store a history of our setup.

It uses [Terraform](https://www.terraform.io/) with [an unofficial GoDaddy provider](https://github.com/n3integration/terraform-provider-godaddy). On each commit to master, GitHub Actions will apply the Terraform plan to update GoDaddy.

![Diagram of how it all works](./diagram.svg)

## Making minor changes

Open up [main.tf](./main.tf), click the pencil icon, and make your changes to the configuration.

You'll probably just need to swap out the text values, or copy a record block and tweak it slightly. Please leave an informative comment so we know what the record is for in future!

## Local development

1. Generate a GoDaddy API key from https://developer.godaddy.com/keys
2. Install [Terraform](https://www.terraform.io/)
3. Clone this repository
4. Run `terraform init`
5. Run `terraform plan`

For code editing, [VS Code](https://code.visualstudio.com/) with the [Terraform extension](https://marketplace.visualstudio.com/items?itemName=HashiCorp.terraform) is recommended.

## Known limitations

Because of https://github.com/n3integration/terraform-provider-godaddy/issues/39, the plans are fairly useless for seeing what's changed. As such, we don't bother keeping track of the state as it does more harm than good in terms of understanding the diff.