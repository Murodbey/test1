variable "cluster_name" {
  type = string
}

variable "cluster_endpoint" {
  type = string
}

variable "cluster_certificate_authority_data" {
  type = string
}

variable "create_helm_release" {
  type = bool
  default = true
}

variable "release_name" {
  type = string
}

variable "chart" {
  type = string
}

variable "namespace" {
  type = string
}

variable "region" {
  type = string

  validation {
    condition = var.region == "us-east-1" || var.region == "us-east-2"
    error_message = "Region mus be us-east-1 or us-east-2"
  }
}

variable "description" {
  type = string
}

variable "repository" {
  type = string
  default = null
}

variable "repository_ca_file" {
  type = string
  description = "The repository certificate authority file."
  default = null
}

variable "repository_cert_file" {
  type = string
  description = "The repository certificate file."
  default = null
}

variable "repository_key_file" {
  type = string
  description = "The repository key file."
  default = null
}

variable "repository_password" {
  type = string
  description = "The password for chart repository."
  default = null
  sensitive = true
}

variable "repository_username" {
  type = string
  description = "The username for chart repository."
  default = null
}

variable "devel" {
  type = bool
  description = "Use the latest version of the chart development stream instead of the stable version"
  default = null
}

variable "chart_version" {
  type = string
  description = "Specify the exact chart version to install. If this is not specified, the latest version is installed."
  default = null
}

variable "wait" {
  type = bool
  description = "Will wait until all annotations are present in the namespace."
  default = true
}

variable "timeout" {
  type = number
  description = "Time in seconds to wait for any individual kubernetes operation (like Jobs for hooks)."
  default = 300
}

variable "atomic" {
  type = bool
  description = "If set, installation process purges chart on fail. The wait flag will be set automatically if atomic is true."
  default = false
}

variable "cleanup_on_fail" {
  type = bool
  description = "Allow deletion of new resources created in this release when helm install fails."
  default = false
}

variable "disable_webhooks" {
  type = bool
  description = "Prevent hooks from running during install/upgrade."
  default = false
}

variable "force_update" {
  type = bool
  description = "Force resource updates through a replacement strategy."
  default = false
}

variable "recreate_pods" {
  type = bool
  description = "Perform pods restart during upgrade/rollback."
  default = false
}

variable "reset_values" {
  type = bool
  description = "When upgrading, reset the values to the ones built into the chart."
  default = false
}

variable "reuse_values" {
  type = bool
  description = "When upgrading, reuse the last release's values and merge and overrides from the command line via --values and --set. If 'reset_values' is specified, this is ignored"
  default = false
}

variable "max_history" {
  type = number
  description = "Limit the maximum number of revisions saved per release. Use 0 for no limit."
  default = null
}

variable "render_subchart_notes" {
  type = bool
  description = "If set, render subchart notes along with the parent chart."
  default = true
}

variable "verify" {
  type = bool
  description = "Verify the package before installing it."
  default = false
}

variable "keyring" {
  type = string
  description = "Location of public keys used for verification."
  default = null
}

variable "disable_openapi_validation" {
  type = bool
  description = "If set, the install process will not validate rendered templates against the Kubernetes OpenAPI schema."
  default = false
}

variable "wait_for_jobs" {
  type = bool
  description = "If set and wait is enabled, will wait for jobs to complete before marking the release as successful."
  default = false
}

variable "replace" {
  type = bool
  description = "By default, either an install or upgrade can be performed. When this flag is set, it will enforce an install or replace action."
  default = false
}

variable "values" {
  type = list(string)
  description = "List of paths to .yaml files or a list of Terraform expressions to be processed for values."
  default = []
}

variable "lint" {
  type = bool
  description = "Run helm lint on the chart before installing"
  default = false
}

variable "pass_credentials" {
  type = bool
  description = "Pass credentials to all domains configured for fetching charts"
  default = false
}

variable "dependency_update" {
  type = bool
  description = "Update dependencies from the charts dir to the vendor dir before installing"
  default = false
}

variable "postrender" {
  type = list(object({
    binary_path = string
    args        = list(string)
  }))
  description = "List of post-rendering transformations to apply."
  default = []
}