resource "helm_release" "this" {
  #namespaces should be handled at the cluster level so it includes annota
  #CRDs should be handled at the cluster level since CRDs are cluster scope
  create_namespace = false
  skip_crds        = true

  count     = var.create_helm_release == true ? 1 : 0
  name      = var.release_name
  chart     = var.chart
  namespace = var.namespace

  #optionals
  repository              = var.repository
  repository_ca_file      = var.repository_ca_file
  repository_cert_file    = var.repository_cert_file
  repository_key_file     = var.repository_key_file
  repository_password     = var.repository_password
  repository_username     = var.repository_username
  devel                   = var.devel
  version                 = var.chart_version
  wait                    = var.wait
  timeout                 = var.timeout
  atomic                  = var.atomic
  cleanup_on_fail         = var.cleanup_on_fail
  disable_webhooks        = var.disable_webhooks
  force_update            = var.force_update
  recreate_pods           = var.recreate_pods
  reset_values            = var.reset_values
  reuse_values            = var.reuse_values
  max_history             = var.max_history
  render_subchart_notes   = var.render_subchart_notes
  verify                  = var.verify
  keyring                 = var.keyring
  disable_openapi_validation = var.disable_openapi_validation
  wait_for_jobs           = var.wait_for_jobs
  replace                 = var.replace
  values                  = var.values
  description             = var.description
  lint                    = var.lint
  pass_credentials        = var.pass_credentials
  dependency_update       = var.dependency_update

  dynamic "postrender" {
    for_each = var.postrender
    content {
      binary_path = postrender.value.binary_path
      args        = postrender.value.args
    }
  }
}