variable "do_token" {
    description = "The DigitalOcean token"
    type = string
}

variable "k8s_config" {
    description = "The k8s config file"
    type = string
    default =  "k8s-config.yaml"
}

variable "k8s_name" {
    description = "The name of the cluster"
    type = string
    default =  "k8s-devops-labs"
}

variable "k8s_size" {
    description = "The size of the cluster"
    type = string
    default =  "s-2vcpu-4gb"
}

variable "k8s_region" {
    description = "The region of the cluster"
    type = string
    default =  "nyc3"
}

variable "k8s_node_count" {
    description = "The number of nodes in the cluster"
    type = number
    default =  3
}

variable "k8s_auto_scale" {
    description = "The auto scale of the cluster"
    type = bool
    default =  true
}

variable "k8s_min_nodes" {
    description = "The minimum number of nodes"
    type = number
    default =  3
}

variable "k8s_max_nodes" {
    description = "The maximum number of nodes"
    type = number
    default =  5
}
