# GNGForms

1. Publish docker image

    GNGForms hasn't any publish image and before all you must register it:

    ```bash
    cd register_image
    sh register_image.sh
    ```

2. Create namespace

    ```bash
    kubectl apply -f namespace.yaml
    ```

3. Create pv and pvc

    On your node create peristent directories:

    ```bash
    sudo mkdir /mnt/gngforms /mnt/gngforms/db
    ```

    Create pv and pvc:

    ```bash
    kubectl apply -f db-pv.yaml
    kubectl apply -f db-pvc.yaml
    ```

4. Create db deployment and service

    ```bash
    kubectl apply -f db-deployment.yaml
    kubectl apply -f db-service.yaml
    ```

5. Create gngforms deployment and service

    Create configMap of your own 'config.cfg':

    ```bash
    kubectl create configmap gngforms-config --from-file=config.cfg -n gngforms
    ```

    ```bash
    kubectl apply -f gngforms-deployment.yaml
    kubectl apply -f gngforms-service.yaml
    ```
