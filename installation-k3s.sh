curl -sfL https://get.k3s.io | INSTALL_K3S_CHANNEL=v1.27 sh -s

#Install Helm
curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
chmod 700 get_helm.sh
./get_helm.sh

#Create symbolic link for kubeconfig
mkdir -p ~/.kube
ln -s /etc/rancher/k3s/k3s.yaml ~/.kube/config

#Install cert-manager CRDs
kubectl apply -f https://github.com/cert-manager/cert-manager/releases/download/v1.14.4/cert-manager.crds.yaml

# Add the Jetstack Helm repository
helm repo add jetstack https://charts.jetstack.io

# Update your local Helm chart repository cache
helm repo update

# Install the cert-manager Helm chart
helm install cert-manager jetstack/cert-manager \
  --namespace cert-manager \
  --create-namespace \

#Install Rancher manager
helm install rancher rancher-stable/rancher \
  --namespace cattle-system \
  --create-namespace \
  --set hostname=rancherman.geeko.ninja \
  --set bootstrapPassword=geeko \
  --set replicas=1