# terraform-local-boolean

[![CircleCI](https://circleci.com/gh/devops-workflow/terraform-local-boolean.svg?style=svg)](https://circleci.com/gh/devops-workflow/terraform-local-boolean)

## Terraform module to simplify and expand boolean use

Since Terraform currently doesn't have a boolean variable type, this provides a
consistent handling. The list of true values is also expanded.

Designed to simplify the use of booleans (especially where 1 variable is tested
many times) and the using count to enable/disable resources.

* Will handle any capitalization of the input value.
* Will return 1 for any true value, 0 for anything else.
* Current true values: true, t, 1, on, enable

All [devops-workflow](https://registry.terraform.io/search?q=devops-workflow&verified=false)
modules will eventually use this.

**NOTE:** `local` refers to this using [locals](https://www.terraform.io/docs/configuration/locals.html)
and does not create any resources. It just builds new variables.

[This module at Terraform registry](https://registry.terraform.io/modules/devops-workflow/boolean/local)

### Example: If

```hcl
module "boolean" {
  source  = "devops-workflow/boolean/local"
  value   = "${var.boolean}"
}

var = "${module.boolean.value ? "true setting" : "false setting"}"
```

### Example: count for enabling/disabling a resource

```hcl
module enabled" {
  source  = "devops-workflow/boolean/local"
  value   = "${var.enabled}"
}

resource "resource_type" "resource_name" {
  count = "${module.enabled.value}"
}
```
