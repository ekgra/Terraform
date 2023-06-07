Spin up a test node


alias tf=terraform
tf plan -out p0
tf apply p0

ansible-playbook -i ./ansible/ansible_vars ./ansible/configure_om.yml