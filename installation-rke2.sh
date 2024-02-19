
sudo bash -c 'curl -sfL https://get.rke2.io | \
INSTALL_RKE2_CHANNEL="v1.24" \
sh -'

sudo mkdir -p /etc/rancher/rke2

sudo bash -c 'echo "write-kubeconfig-mode: \"0644\"" > /etc/rancher/rke2/config.yaml'