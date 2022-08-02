# Terraform
This terraform module will deploy a virtual machine, ssh keys and vpc <br/>
<br/>

## Requirements
<br/>
digital ocean token<br/>
aws access key<br/>
aws secret key<br/>
<br/>

## Module Variables and Values
<br/>
Available values are listed below, along with variables. This can be configured as desired <br/>
<br/>
* vpc_name: the name of the default vpc<br/>
* key_path: the path the ansible key will be stored<br/>
* key_name: the name of the ssh private key<br/>
* vm_size: the size of the vm<br/>
* vm_image: the operating system to be deployed on the vm<br/>
* vm_name: the hostname of the vm<br/>
* region: the region the vm should be deployed<br/>
* inventory_path: reference of the path where the ansible inventory will be stored<br/>
<br/>
values.auto.tfvars<br/>
<br/>
<pre>
vpc_name       = "origin-trail"
key_path       = "../ansible/files"
key_name       = "sshkey"
vm_size        = "s-2vcpu-2gb"
vm_image       = "ubuntu-20-04-x64"
vm_name        = "node"
region         = ["fra1", "lon1", "sgp1", "ams3", "tor1"]
inventory_path = "../ansible/inventories"
</pre>

## Terraform installation
hashicorp/setup-terraform@v2<br/>
<br/>

## Deployment of the module
<pre>
terraform apply --auto-aprove -lock=false
</pre>
<br/>

## License
This project is licensed under the GPLv3 License - see the [LICENSE](LICENSE.md) file for details. For more informations: [License Article]

## MIT / BSD
