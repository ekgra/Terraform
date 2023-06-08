# Creates MongoDB Ops Manager deployment on AWS EC2 machines
Spins up a 3 node OM deployment

## Spin up the OM Infra
The following creates the infra via Terraform and the runs an Ansible playbook to configure the OM setup

    alias tf=terraform
    tf plan -out p0
    tf apply p0

## How to re-run the Ansible playbook
Once Infra is created by Terraform, the terraform resource that runs the ansible playbook can be marked as tainted, and on next apply it will recreate that resource. SInce it is a null resource, it won't impact any Infra in cloud.

    tf taint null_resource.execute-ansible-playbook
    tf apply -auto-approve