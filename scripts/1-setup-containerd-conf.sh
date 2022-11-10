# disable swap
swapoff -a
sed -i '/ swap / s/^/#/' /etc/fstab


sudo mkdir -p /etc/modules-load.d/
sudo cat <<EOF | sudo tee /etc/modules-load.d/containerd.conf
overlay
br_netfilter
EOF

sudo modprobe overlay
sudo modprobe br_netfilter
