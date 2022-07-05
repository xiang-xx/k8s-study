# 在集群中安装 Dashboard
kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.0.1/aio/deploy/recommended.yaml
# 获取 dashboard 的资源对象
kubectl get all -n kubernetes-dashboard

kubectl proxy
# http://localhost:8001/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy/

# 创建一个新的 ServiceAccount
# kubectl apply -f - <<EOF
# apiVersion: v1
# kind: ServiceAccount
# metadata:
#   name: admin-user
#   namespace: kubernetes-dashboard
# EOF
# # 将上面的 SA 绑定到系统的 cluster-admin 这个集群角色上
# kubectl apply -f - <<EOF
# apiVersion: rbac.authorization.k8s.io/v1
# kind: ClusterRoleBinding
# metadata:
#   name: admin-user
# roleRef:
#   apiGroup: rbac.authorization.k8s.io
#   kind: ClusterRole
#   name: cluster-admin
# subjects:
# - kind: ServiceAccount
#   name: admin-user
#   namespace: kubernetes-dashboard
# EOF

kubectl apply -f serviceaccount.yaml
kubectl apply -f clusterrolebinding.yaml

kubectl -n kubernetes-dashboard create token admin-user
# kubectl -n kubernetes-dashboard describe secret $(kubectl -n kubernetes-dashboard get secret | grep admin-user | awk '{print $1}')
