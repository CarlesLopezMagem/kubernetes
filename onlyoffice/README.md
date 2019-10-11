# onlyoffice

1. Create namespace

    ```bash
    kubectl apply -f namespace.yaml
    ```

2. Create pv and pvc

    On your node create peristent directories:

    ```bash
    sudo mkdir /mnt/onlyoffice
    ```

    Create pv and pvc:

    ```bash
    kubectl apply -f of-pv.yaml
    kubectl apply -f of-pvc.yaml
    ```

3. Create onlyoffice deployment and service

    ```bash
    kubectl apply -f of-deployment.yaml
    kubectl apply -f of-service.yaml
    ```

4. Create https ingress

    ```bash
    kubectl create secret tls tlssecret --key key.pem --cert cert.pem -n onlyoffice
    kubectl apply -f ingress.yaml
    ```
