variable "path" {
  type = string
  default = "kubernetes"
}

variable "description" {
  type = string
  description = "Description for secret backend"
}

variable "unique_service_accounts" {
  type = map(string)
  description = "A map where each key is the name of a Kubernetes ServiceAccount, and each corresponding value is the namespace in which that ServiceAccount is defined."
}

variable "roles_and_allowed_ns" {
  type = map(list(string))
}

variable "cluster_roles" {
  type = map(list(string))
}

variable "extra_annotations" {
  type = map(string)
}

variable "extra_labels" {
  type = map(string)
}

