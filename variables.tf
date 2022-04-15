variable "do_token" {
  description = "DigitalOcean API token"
}

variable "ssh_fingerprint" {
  description = "Fingerprint of your SSH key"
}

variable "droplet_image" {
  description = "Imageidentifier of the OS in DigitalOcean"
  default     = "ubuntu-20-04-x64"
}

variable "droplet_region" {
  description = "Droplet region identifier"
  default     = "ams3"
}

variable "droplet_size" {
  description = "Droplet size identifier"
  default     = "s-1vcpu-1gb"
}

variable "nc_apikey" {
  description = "Namecheap API token"
}

variable "nc_user" {
  description = "Namecheap API username"
}

variable "nc_clientip" {
  description = "Namecheap API whitelisted IP"
}

variable "domain" {
  description = "Domain name to use"
}