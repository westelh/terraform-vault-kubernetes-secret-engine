resource "vault_kubernetes_secret_backend" "main" {
  allowed_managed_keys = []
  audit_non_hmac_request_keys  = []
  audit_non_hmac_response_keys = []
  description                  = var.description
  disable_local_ca_jwt         = false
  external_entropy_access      = false
  local                        = false
  options                      = {}
  path                         = var.path
  seal_wrap                    = false
}

resource "vault_kubernetes_secret_backend_role" "role" {
  for_each = var.roles

  backend = vault_kubernetes_secret_backend.main.path
  kubernetes_role_type = "Role"

  name = "auto-sa-bound-to-role-${each.key}"
  kubernetes_role_name = each.key
  allowed_kubernetes_namespaces = each.value

  extra_labels = var.extra_labels
  extra_annotations = var.extra_annotations
}

resource "vault_kubernetes_secret_backend_role" "clusterrole" {
  for_each = var.cluster_roles

  backend = vault_kubernetes_secret_backend.main.path
  kubernetes_role_type = "ClusterRole"

  name = "auto-sa-bound-to-clusterrole-${each.key}"
  kubernetes_role_name = each.key
  allowed_kubernetes_namespaces = each.value

  extra_labels = var.extra_labels
  extra_annotations = var.extra_annotations
}
