# K3s-Pi-Cluster
Kubernetes Cluster using 5x Raspberry Pi 4 4GB.

# Setup Procedure
1. Flash 64-bit Ubuntu-Server 20.04.1 image to SD card.

2. Add empty 'ssh' file to 'system-boot' partition.

3. Mount SD card and modify file to reflect the below text 'system-boot/network-config':

        version: 2
        ethernets:
          eth0:
            dhcp4: no
            addresses:
            # Enter the address you would like with a CIDR network mask eg:"192.168.1.1/24"
              - 0.0.0.0/24
            # Enter the default gateway address you would like to use
            gateway4: 0.0.0.0
            nameservers:
            # Enter the DNS lookup addresses you would like to use  
              addresses: [1.1.1.1, 8.8.8.8]

5. Boot up and attempt to login via SSH with the 'ubuntu' user account, default password is 'ubuntu'.

6. Set a new sudo password on the node and log off the SSH session.

7. On the computer you are connecting from, copy your SSH key over to the newly provisioned Pi with ssh-copy-id.

8. Note: You may need to wait 10-15 minutes for the auto update task to finish and release dpkg before running the next step. If it gets stuck you will need to force a reboot and run the suggested command to ensure leftover package installations finish before proceeding.

9. Add the IPs and hostnames of all your nodes to ansible inventory file.

10. Run the included 'updateInstaller.sh" script to make sure you have most up to date k3s install script. 

11. ansible-playbook -i inventory.yml playbook.yml -K
