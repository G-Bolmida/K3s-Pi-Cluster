# K3s-Pi-Cluster
Kubernetes Cluster using 5x Raspberry Pi 4 4GB.

# Setup Procedure
1. Flash 64-bit Ubuntu-Server image to SD card.

2. Add empty 'ssh' file to 'system-boot' partition.

3. Boot once, let it fully boot (wait about 2 minutes) then shut it down.

4. Mount SD card and populate 'writable/netplan/{plan name}.yml with:

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

6. On the computer you are connecting from, copy your SSH key over to the newly provisioned Pi with ssh-copy-id.

7. Note: You may need to wait 10-15 minutes for the auto update task to finish and release dpkg before running the next step.

7. Add the IP of your node or all nodes to ansible inventory file and run the included Ansible playbook to finish provisioning the node.