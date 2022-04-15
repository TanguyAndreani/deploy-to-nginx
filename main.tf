terraform {
  required_providers {
    digitalocean = {
      source = "digitalocean/digitalocean"
    }
    namecheap = {
      source = "namecheap/namecheap"
      version = ">= 2.0.0"
    }
  }
}

provider "digitalocean" {
  token = var.do_token
}


provider "namecheap" {
  user_name = var.nc_user
  api_user = var.nc_user
  api_key = var.nc_apikey
  client_ip = var.nc_clientip
  use_sandbox = false
}


resource "digitalocean_droplet" "web" {
  image      = var.droplet_image
  name       = "personal-nginx"
  region     = var.droplet_region
  size       = var.droplet_size
  backups    = false
  monitoring = true
  ssh_keys = [
    var.ssh_fingerprint
  ]
}

resource "namecheap_domain_records" "domain" {
  domain = var.nc_domain
  mode = "MERGE"

  record {
    hostname = "ftp"
    type = "A"
    address = digitalocean_droplet.web.ipv4_address
  }
}