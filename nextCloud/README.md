# ownCloud

1. Create namespace

    ```bash
    kubectl apply -f namespace.yaml
    ```

2. Create pv and pvc

    On your node create peristent directories:

    ```bash
    sudo mkdir /mnt/nextCloud /mnt/nextCloud/nc /mnt/nextCloud/db
    ```

    Create pv and pvc:

    ```bash
    kubectl apply -f db-pv.yaml
    kubectl apply -f db-pvc.yaml
    kubectl apply -f nc-pv.yaml
    kubectl apply -f nc-pvc.yaml
    ```

3. Create secrets

    ```bash
    kubectl create secret generic mysql --from-literal=password={PASSWORD} -n=nextcloud
    kubectl create secret generic nextcloud --from-literal=password={PASSWORD} -n=nextcloud
    ```

4. Create db deployment and service

    ```bash
    kubectl apply -f db-deployment.yaml
    kubectl apply -f db-service.yaml
    ```

5. Create nextcloud deployment and service

    ```bash
    kubectl apply -f nc-deployment.yaml
    kubectl apply -f nc-service.yaml
    ```

6. Create nginx deployment and service

    ```bash
    kubectl create configmap nginx-conf --from-file=nginx.conf=nginx.conf -n=nextcloud
    kubectl apply -f nginx-deployment.yaml
    kubectl apply -f nginx-service.yaml
    ```

7. Create ingress

    ```bash
    kubectl apply -f ingress.yaml
    ```
