# creating the secret
oc apply -f C:\Users\User\Desktop\OpenShift-DataLoader\infrastructure\k8s\mysql-secret.yaml

# creating the Persistent Volume Claim
oc apply -f C:\Users\User\Desktop\OpenShift-DataLoader\infrastructure\k8s\mysql-pvc.yaml

# creating the new mysql app
oc new-app mysql:latest --env=MYSQL_USER=david --env=MYSQL_PASSWORD=pwd  --env=MYSQL_DATABASE=DataLoaderDB

# creating the pvc
oc apply -f .\infrastructure\k8s\mysql-pvc.yaml


