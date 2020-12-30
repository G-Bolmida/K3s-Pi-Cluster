#!/bin/sh

# Author: George Bolmida
# Downloads the most recent K3s install script to the directory

curl -sfL https://get.k3s.io > k3sInstall.sh
echo "Script written to 'k3sInstall.sh'"