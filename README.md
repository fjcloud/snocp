# Assisted deployment of Single Node OpenShift with terraform

This Ansible role will permits you to deploy with assisted installer SNO.

## Requirements

- Ansible >= 2.10
- Terraform >= 1.2.6

```shell
$ ansible-galaxy install -r requirements.yml
```

## General env

Create auth.yml file :

```
---

snocp_offline_token: "xxxxxxxxxxxxxxxxxx"

snocp_ssh_pub: "{{ lookup('file', '~/.ssh/id_rsa.pub') }}"

snocp_ssh_priv_path: "~/.ssh/id_rsa"

snocp_hcloud_token: "{{ lookup('env','HCLOUD_TOKEN') }}"

```

## Deployment on Hetzner

Export HCLOUD_TOKEN

```shell
$ export HCLOUD_TOKEN=xxxxxxxxxxxxxxxxxxxxxxxx
```

Deploy SNO

```shell
$ ansible-playbook deploy_snocp.yml
```
