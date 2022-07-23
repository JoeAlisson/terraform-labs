terraform {
  required_version = ">= 1.2.5"
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }
}

provider "digitalocean" {
  token =  var.do_token
}

resource "digitalocean_kubernetes_cluster" "k8s" {
  name = var.k8s_name
  region = var.k8s_region
  # Grab the latest version slug from `doctl kubernetes options versions`
  version = "1.22.11-do.0"
  tags = ["devops-labs"]

  node_pool {
    name       = "default"
    size       = var.k8s_size
    node_count = var.k8s_node_count
    auto_scale = true
    min_nodes = var.k8s_min_nodes
    max_nodes = var.k8s_max_nodes
    tags = ["devops-labs"]
  }
}

resource "local_file" "kube_config" {
  filename = "/home/joealisson/.kube/k8s-devops-labs-config.yaml"
  content  = digitalocean_kubernetes_cluster.k8s.kube_config.0.raw_config
}
