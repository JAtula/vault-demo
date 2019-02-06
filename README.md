# Dynamic envs for K8S from Vault

Source templates and other stuff for setting up HA vault to serve dynamic secrets to Kubernetes

## Notes

```
VAULT_SA_NAME=$(kubectl get sa vault-handler -o jsonpath="{.secrets[*]['name']}")
```

```
kubectl get secret $VAULT_SA_NAME -o jsonpath="{.data.token}" | base64 --decode; echo
```

```
kubectl get secret $VAULT_SA_NAME -o jsonpath="{.data['ca\.crt']}" | base64 --decode; echo
```
