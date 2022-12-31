kubectl scale deployment/my-application --replicas=2
kubectl scale deployment/my-application --replicas=10
kubectl set image deployment/my-application myapp=ozgurozturknet/k8s:v2
# ama yaml dosyasindan bu islemleri yapmak daha saglikli