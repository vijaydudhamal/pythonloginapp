sudo apt update && \
sudo apt install -y curl unzip jq apt-transport-https lsb-release gnupg && \
curl -fsSL https://aka.ms/InstallAzureCLIDeb | sudo bash && \
curl -fsSL https://releases.hashicorp.com/terraform/1.8.5/terraform_1.8.5_linux_amd64.zip -o terraform.zip && \
unzip terraform.zip && sudo mv terraform /usr/local/bin/ && rm terraform.zip && \
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" && \
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl && \
curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash
