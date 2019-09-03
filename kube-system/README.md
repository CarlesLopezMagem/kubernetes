# kube-system

## Init dashboard and dns

```bash
microk8s.enable dns dashboard
```

## Create ingress

### Create tls secret with openssl

```bash
openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout key.pem -out cert.pem -subj "/CN=kube.lesquerra.cat/O=kube.lesquerra.cat"
kubectl create secret tls tlssecret --key key.pem --cert cert.pem -n kube-system
```

### Set ingress

```bash
kubectl apply -f ingress.yaml
```
