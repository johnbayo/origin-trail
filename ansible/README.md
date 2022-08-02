# Origin-Trail
This ansible role will install the latest Docker version, Docker Compose and setup and deploy Origin Trail nodes on Ubuntu.<br/>
<br/>

## Requirements<br/>
infrastructure deployment via terraform<br/>
ansible installation<br/>
<br/>

## Role Variables
<br/>
Available variables are listed below, along with variables <br/>
ansible/vars/main.yml<br/>
<br/>
<pre>
origin_trail_user: "root"

required_ports:
    - 22
    - 3000
    - 5278
    - 8900

cert_path: /{{ origin_trail_user }}/certs

key_size: 4096

key_type: RSA

country_name: DE

email_address: john.bayo@web.de

organization_name: origin-trail

origin_trail_image_version: release_testnet
</pre>
<br/>

## Ansible installation
ansible is installed with the help of Python Package Installer PIP in the workflow<br/>
<br/>

## Configmanagement rollout
<pre>
ansible-playbook -i inventories/inventory.yml --extra-vars="ansible_ssh_private_key_file=${PRIVATE_KEY_PATH} playbook.yml<br/>
</pre><br/>
The playbook is as shown below
<br/>
<pre>
---
- hosts: all 
  vars_files:
    - "vars/main.yml"
    - "defaults/main.yml"
  become: true
  gather_facts: true
  roles:
    - docker
    - origin-trail
</pre>
<br/>

## License
This project is licensed under the GPLv3 License - see the [LICENSE](LICENSE.md) file for details. For more informations: [License Article]

## MIT / BSD