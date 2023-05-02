# Assisted deployment of Single Node OpenShift with terraform

This Ansible role will permits you to deploy with assisted installer SNO.

## Requirements

- Ansible >= 2.10
- Terraform >= 1.2.6

```shell
$ ansible-galaxy install -r requirements.yml
```

## Deployment on Hetzner

Export HCLOUD_TOKEN

```shell
$ export HCLOUD_TOKEN=xxxxxxxxxxxxxxxxxxxxxxxx
```

Deploy SNO

```shell
$ ansible-playbook deploy_snocp.yml
``
