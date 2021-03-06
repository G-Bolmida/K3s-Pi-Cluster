# K3s-Pi-Cluster
K3s Kubernetes Cluster with highly available etcd datastore using Ansible - made with Raspberry Pi or 'arm64' nodes in mind.

# Pi Setup Procedure
1. Flash 64-bit Ubuntu-Server 20.10 image to SD card.

2. Add empty 'ssh' file to 'system-boot' partition.

3. Mount SD card and modify 'system-boot/network-config' file to reflect the below text :

        version: 2
        ethernets:
          eth0:
            dhcp4: no
            addresses:
            # Enter the address you would like with a CIDR network mask
              - 0.0.0.0/24
            # Enter the default gateway address you would like to use
            gateway4: 0.0.0.0
            nameservers:
            # Enter the DNS lookup addresses you would like to use  
              addresses: [0.0.0.0, 0.0.0.0]

5. Boot up and attempt to login via SSH with the 'ubuntu' user account, default password is 'ubuntu'. Node will prompt you to change default password and will exit SSH session once changed.

6. SSH back into the node Set a new sudo password on the node and log off the SSH session.

7. On the computer you are connecting from, copy your SSH key over to the newly provisioned node with ssh-copy-id.

8. Repeat these steps for each node.

# etcd and K3s Installation
1. Add the IPs, hostnames, and variables of all your nodes to the 'inventory.yml' Ansible inventory file. Make sure to check the inventory file for the right CPU architecture or the playbooks will not work, default is 'arm64'.

2. Before running the etcd-playbook make sure to have golang-cfssl installed on your local machine.

NOTE: These playbooks make use of community ansible plugins, ensure community.general is installed by "ansible-galaxy collection install community.general" before running.