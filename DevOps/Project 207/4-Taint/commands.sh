node1=$(kubectl get no -o jsonpath="{.items[1].metadata.name}")
node2=$(kubectl get no -o jsonpath="{.items[1].metadata.name}")
node3=$(kubectl get no -o jsonpath="{.items[1].metadata.name}")
kubectl taint no $node1 env=prod:NoSchedule
kubectl taint no $node2 env=prod:NoSchedule
kubectl taint no $node3 env=prod:NoSchedule
kubectl label no $node1 env=prod
kubectl label no $node2 env=prod
kubectl label no $node3 env=prod

kubectl get no -o jsonpath="{.items[1].status.addresses}"


Exercise=kubectl get no -o jsonpath="{.items[1].status.addresses[0].address}"