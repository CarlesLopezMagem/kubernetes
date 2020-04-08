# Jenkins

1. Create namespace

    ```bash
    kubectl apply -f namespace.yaml
    ```

2. Create pv and pvc

    ```bash
    kubectl apply -f pv.yaml
    kubectl apply -f pvc.yaml
    ```

3. Create deployment

    ```bash
    kubectl apply -f deployment.yaml
    ```

4. Create service

    ```bash
    kubectl apply -f service.yaml
    ```

5. Create ingress

    ```bash
    kubectl apply -f ingress.yaml
    ```
