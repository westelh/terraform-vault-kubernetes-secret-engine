output "path" {
   value = vault_kubernetes_secret_backend.main.path
   description = "Mount path of generated backend"
}
