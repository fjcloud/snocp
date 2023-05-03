# Assisted deployment of Single Node OpenShift

This Ansible role will permits you to deploy with https://cloud.redhat.com a SNO.

## Requirements

- Ansible >= 2.10
- Terraform >= 1.2.6

## Authentication

Create auth.yml file :

> Get offline token on https://console.redhat.com/openshift/token

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

Finish install on OCM URL given in ouput of Ansible Playbook

## Remove SNO

```shell
$ ansible-playbook deploy_snocp.yml -e snocp_tf_state=absent
```
