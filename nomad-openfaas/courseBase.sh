ssh root@host01 "curl -o ./install.sh https://raw.githubusercontent.com/hashicorp/katakoda/master/nomad-openfaas/assets/install.sh && chmod +x install.sh && ./install.sh"

curl -L http://assets.joinscrapbook.com/unzip -o ~/.bin/unzip
chmod +x ~/.bin/unzip

curl -L -o ~/consul.zip https://releases.hashicorp.com/consul/1.0.2/consul_1.0.2_linux_amd64.zip
unzip -d  ~/.bin/ ~/consul.zip
chmod +x ~/.bin/consul

curl -L -o ~/nomad.zip https://releases.hashicorp.com/nomad/0.7.1/nomad_0.7.1_linux_amd64.zip
unzip -d  ~/.bin/ ~/nomad.zip
chmod +x  ~/.bin/nomad

curl -L -o ~/terraform.zip https://releases.hashicorp.com/terraform/0.11.1/terraform_0.11.1_linux_amd64.zip
unzip -d ~/.bin ~/terraform.zip
chmod +x ~/.bin/terraform

curl -L -o ~/.bin/faas-cli https://github.com/openfaas/faas-cli/releases/download/0.5.0/faas-cli
chmod +x ~/.bin/faas-cli

rm ~/nomad.zip ~/consul.zip ~/terraform.zip

# Install additional packages
apt-get install -y tree

curl -L -o go1.9.2.linux-amd64.tar.gz https://dl.google.com/go/go1.9.2.linux-amd64.tar.gz
tar -C /usr/local -xzf go1.9.2.linux-amd64.tar.gz
rm go1.9.2.linux-amd64.tar.gz

GOPATH=/home/scrapbook/go /usr/local/go/bin/go get -u github.com/golang/dep/cmd/dep
mkdir -p /home/scrapbook/go/src/functions

# Setup Docker registry
docker run -d --name registry -p 5000:5000 registry:2
