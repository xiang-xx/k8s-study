# 在集群中安装 Dashboard
kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.5.0/aio/deploy/recommended.yaml
# 获取 dashboard 的资源对象
kubectl get all -n kubernetes-dashboard


kubectl apply -f serviceaccount.yaml
kubectl apply -f clusterrolebinding.yaml

# kubectl -n kubernetes-dashboard create token admin-user
kubectl -n kubernetes-dashboard describe secret $(kubectl -n kubernetes-dashboard get secret | grep admin-user | awk '{print $1}')

kubectl proxy
# http://localhost:8001/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy/
