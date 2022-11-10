# Apply CNI
kubectl apply -f https://docs.projectcalico.org/manifests/calico.yaml
kubectl get nodes --watch

# Add a node
kubeadm token create --print-join-command
sudo kubeadm join 10.0.0.2:6443 --token il4gbi.r3l7alzh2zp4t5d1 --discovery-token-ca-cert-hash sha256:83de342df2a9027945dea95832f1182f214dc25f60c84eab8bd2da34cf884ab5

# Mark the node as worker
kubectl label node worker-1 node-role.kubernetes.io/worker=worker
