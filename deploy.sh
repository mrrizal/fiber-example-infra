#/bin/bash
alias k="sudo k3s kubectl"

k create ns development

k config set-context --current --namespace development

k apply -f development-networkpolicy.yaml

k apply -f postgres-secret.yaml
k apply -f postgres-claim0-persistentvolumeclaim.yaml
k apply -f postgres-deployment.yaml
k apply -f postgres-service.yaml

k apply -f elasticsearch-claim0-persistentvolumeclaim.yaml
k apply -f elasticsearch-deployment.yaml
k apply -f elasticsearch-service.yaml

k apply -f kibana-deployment.yaml
k apply -f kibana-service.yaml

k apply -f apm-server-deployment.yaml
k apply -f apm-server-service.yaml

k apply -f api-configmap.yaml
k apply -f api-secret.yaml
k apply -f api-deployment.yaml
k apply -f api-service.yaml
k apply -f api-autoscale.yaml

k config set-context --current --namespace default

k apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.4.0/aio/deploy/recommended.yaml
k apply -f kubernetes-dashboard/service-account.yaml
k apply -f kubernetes-dashboard/role.yaml
