# curl -L http://assets.joinscrapbook.com/unzip -o ~/.bin/unzip
# chmod +x ~/.bin/unzip

curl -L -o ~/consul.zip https://releases.hashicorp.com/consul/1.6.1/consul_1.6.1_linux_amd64.zip
unzip -d  ~/.bin/ ~/consul.zip
chmod +x ~/.bin/consul

curl -L -o ~/nomad.zip https://releases.hashicorp.com/nomad/0.9.6/nomad_0.9.6_linux_amd64.zip
unzip -d  ~/.bin/ ~/nomad.zip
chmod +x  ~/.bin/nomad

curl -L -o ~/terraform.zip https://releases.hashicorp.com/terraform/0.12.12/terraform_0.12.12_linux_amd64.zip
unzip -d ~/.bin ~/terraform.zip
chmod +x ~/.bin/terraform

curl -L -o ~/vault.zip https://releases.hashicorp.com/vault/1.2.3/vault_1.2.3_linux_amd64.zip
unzip -d ~/.bin ~/vault.zip
chmod +x ~/.bin/vault

rm ~/nomad.zip ~/consul.zip ~/terraform.zip ~/vault.zip


