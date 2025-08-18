# login
oc login --token=sha256~q7b_PyiOgziHZxRDnVdqnXEWsllyzi13vIMtD6_nHZk --server=https://api.rm2.thpm.p1.openshiftapps.com:6443

# creating the new mysql app
oc new-app mysql:latest --env=MYSQL_USER=david --env=MYSQL_PASSWORD=pwd  --env=MYSQL_DATABASE=DataLoaderDB

# creating the secret
oc apply -f C:\Users\User\Desktop\OpenShift-DataLoader\infrastructure\k8s\mysql-secret.yaml

# creating the Persistent Volume Claim
oc apply -f C:\Users\User\Desktop\OpenShift-DataLoader\infrastructure\k8s\mysql-pvc.yaml



# build the img
docker build -t  david4554545/dal-app:latest C:\Users\User\Desktop\OpenShift-DataLoader\services\data_loader

# push the img to docker hub
docker push david4554545/dal-app:latest

# create new app with the pushed img (dal-app)
oc new-app david4554545/dal-app:latest

# create the service for dal-app
oc apply -f C:\Users\User\Desktop\OpenShift-DataLoader\infrastructure\k8s\dal-app_svc.yaml

# creating the environment variables
oc set env deployment/dal-app --env=MYSQL_USER=david --env=MYSQL_PASSWORD=pwd  --env=MYSQL_DATABASE=DataLoaderDB --env=MYSQL_PORT=3306 --env=MYSQL_HOST=mysql-svc --env=TABLE_NAME=project_table

# expose the service
oc expose svc/dal-app-svc