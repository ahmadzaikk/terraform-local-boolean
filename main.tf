#
# Terraform module to simplify and expand boolean use
#

locals {
  l = lower(var.value)

  value = {
    local.l == "true" ||
    local.l == "t" ||
    local.l == "1" ||
    local.l == "on" ||
    local.l == "enable"
    ? 1 : 0}
}
