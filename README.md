# deploy-to-nginx

This is a repo to manage [cyberpunked.me](https://cyberpunked.me) and
most of its subdomains and servers.

Aims to be a readable repository but nothing more. Also automate things
as much as possible.

## Aim for a zero downtime setup

I'd like to make a system where I don't have to wait for DNS to
propagate to setup the SSL certificates with let's encrypt.

Let's say that the server crashes, or that I destroy it. I could
launch `terraform apply` immediately, but the Ansible playbook
in `nginx.yml` must wait for DNS records to propagate.

I could make it work with a two servers setup.