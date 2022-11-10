sudo kubeadm init \
--apiserver-advertise-address=10.0.0.2 \
--apiserver-cert-extra-sans=10.0.0.2 \
--pod-network-cidr 192.168.0.0/16 \
--kubernetes-version 1.24.0

# make kubernetes admin.conf available for vagrant-user
mkdir ~vagrant/.kube
cp /etc/kubernetes/admin.conf ~vagrant/.kube/config
chown -R vagrant:vagrant ~vagrant/.kube
