# creating the secret
oc apply -f C:\Users\User\Desktop\OpenShift-DataLoader\infrastructure\k8s\mysql-secret.yaml

# creating the Persistent Volume Claim
oc apply -f C:\Users\User\Desktop\OpenShift-DataLoader\infrastructure\k8s\mysql-pvc.yaml


