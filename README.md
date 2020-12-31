# K3s-Pi-Cluster
K3s Kubernetes Cluster with highly available etcd datastore using Ansible - made with Raspberry Pi or 'arm64' nodes in mind.

# Pi Setup Procedure
1. Flash 64-bit Ubuntu-Server 20.04.1 image to SD card.

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

8. Note: You may need to wait 10-15 minutes for the unattended upgrade task to finish and release dpkg before running the next step. If it gets stuck you will need to force a reboot and run the suggested 'sudo dpkg --configure -a' command to ensure leftover package installations finish before proceeding.

9. Repeat these steps for each node.

# etcd and K3s Installation
1. Add the IPs, hostnames, and variables of all your nodes to the 'inventory.yml' Ansible inventory file. Make sure to check the inventory file for the right CPU architecture or the playbooks will not work, default is 'arm64'.

