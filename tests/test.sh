#!/bin/bash -eux

# Destroy every previous vagrant box
vagrant destroy -f

# Create new one(s)
vagrant up
sleep 5

# Check the role syntax correction
ansible-playbook --syntax-check -vv test.yml

# Applied the role
ansible-playbook -vv test.yml

# Verify the idempotence of the role
ansible-playbook -vv test.yml

# Destroy every leaved vagrant box
vagrant destroy -f