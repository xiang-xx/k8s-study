# 删除现在的集群
kind delete cluster --name wslk8s
# 创建一个3节点集群的配置文件
cat << EOF > kind-3nodes.yaml
kind: Cluster
apiVersion: kind.x-k8s.io/v1alpha4
nodes:
  - role: control-plane
  - role: worker
  - role: worker
EOF
# 使用配置文件创建新的集群
kind create cluster --name wslkindmultinodes --config ./kind-3nodes.yaml
# 获取集群节点
kubectl get nodes