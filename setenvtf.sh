# Update system packages and install prerequisites
sudo apt-get update -y && sudo apt-get install -y gnupg software-properties-common curl unzip

# Install HashiCorp Terraform
wget -O- https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt-get update -y && sudo apt-get install -y terraform

# Install AWS CLI v2
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install

# Clean up installer zip and extracted folder
sudo rm -rf awscliv2.zip aws

# Set default AWS region for CLI & Terraform
export AWS_DEFAULT_REGION="ap-south-1"
export AWS_REGION="ap-south-1"

# Make runtf.sh executable and run it
chmod +x runtf.sh
./runtf.sh

echo "now trigger the new file that will run this terraform file"
./runtf.sh 
