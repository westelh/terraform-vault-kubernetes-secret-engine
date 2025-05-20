variable "path" {
  type = string
  default = "kubernetes"
}

variable "description" {
  type = string
  description = "Description for secret backend"
}

variable "roles" {
  type = map(list(string))
}

variable "cluster_roles" {
  type = map(list(string))
  default = {
    "admin" = [ "*" ]
    "edit" = [ "*" ]
    "view" = [ "*" ]
  }
}

variable "extra_annotations" {
  type = map(string)
  default = {}
}

variable "extra_labels" {
  type = map(string)
  default = {}
}

