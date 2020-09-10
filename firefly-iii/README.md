# Firefly III

1. Create namespace

    ```bash
    kubectl apply -f namespace.yaml
    ```

2. Create pv and pvc

    On your node create peristent directories:

    ```bash
    sudo mkdir /mnt/firefly_iii/export /mnt/firefly_iii/upload /mnt/firefly_iii/db
    ```

    Create pv and pvc:

    ```bash
    kubectl apply -f db-pv.yaml
    kubectl apply -f db-pvc.yaml
    kubectl apply -f firefly-iii-export-pv.yaml
    kubectl apply -f firefly-iii-export-pvc.yaml
    kubectl apply -f firefly-iii-upload-pv.yaml
    kubectl apply -f firefly-iii-upload-pvc.yaml
    ```

3. Create secrets

    ```bash
    kubectl create secret generic mysql --from-literal=password={PASSWORD} -n=firefly-iii
    kubectl create secret generic firefly-iii --from-literal=app_key='{APP-KEY}'  -n=firefly-iii
    ```

4. Create db deployment and service

    ```bash
    kubectl apply -f db-deployment.yaml
    kubectl apply -f db-service.yaml
    ```

5. Create firefly deployment and service

    ```bash
    kubectl apply -f firefly-iii-deployment.yaml
    kubectl apply -f firefly-iii-service.yaml
    ```

6. Create https ingress

    ```bash
    kubectl apply -f issuer.yaml
    kubectl apply -f ingress.yaml
    ```
