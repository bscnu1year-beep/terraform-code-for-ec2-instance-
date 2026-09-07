#!/bin/bash
set -e

# 1. Update system packages and install git
apt-get update -y
apt-get install -y git

# 2. Navigate directly to the Ubuntu user's home directory
cd /home/ubuntu

# 3. Clone your GitHub repository
git clone https://github.com/bscnu1year-beep/terraform-code-for-ec2-instance-.git

# 4. Navigate into the cloned repository
cd terraform-code-for-ec2-instance-

# 5. Make deployment.sh executable and run it
chmod +x deployment.sh
chmod +x runtf.sh
chmod +x basicenv.sh
chmod +x setenvtf.sh
./deployment.sh

# 6. Change ownership back to the 'ubuntu' user so you can access it easily without sudo
chown -R ubuntu:ubuntu /home/ubuntu/terraform-code-for-ec2-instance-
