# Wordpress

1. Create namespace

    ```bash
    kubectl apply -f namespace.yaml
    ```

2. Create pv and pvc

    ```bash
    kubectl apply -f db-pv.yaml
    kubectl apply -f db-pvc.yaml
    kubectl apply -f wp-pv.yaml
    kubectl apply -f wp-pvc.yaml
    ```

3. Create secrets

    ```bash
    kubectl create secret generic mysql --from-literal=password={PASSWORD} -n=wordpress
    ```

4. Create db deployment and service

    ```bash
    kubectl apply -f db-deployment.yaml
    kubectl apply -f db-service.yaml
    ```

5. Create wordpress deployment and service

    ```bash
    kubectl apply -f wp-deployment.yaml
    kubectl apply -f wp-service.yaml
    ```

6. Create https ingress

    Create self-service certificate (optional)

    ```bash
    openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout key.pem -out cert.pem -subj "/CN=lesquerra.cat/O=lesquerra.cat"
    ```

    ```bash
    kubectl create secret tls tlssecret --key key.pem --cert cert.pem -n wordpress
    kubectl apply -f ingress.yaml
    ```
