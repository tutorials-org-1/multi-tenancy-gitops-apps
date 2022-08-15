

SEALED_SECRET_NAMESPACE=${SEALED_SECRET_NAMESPACE:-sealed-secrets}
SEALED_SECRET_CONTOLLER_NAME=${SEALED_SECRET_CONTOLLER_NAME:-sealed-secrets}

oc create secret tls mq-tls-secret --key="tls.key" --cert="tls.crt" --dry-run=client -o yaml > delete-mq-tls-secret.yaml

kubeseal -n dev  --controller-name=${SEALED_SECRET_CONTOLLER_NAME} --controller-namespace=${SEALED_SECRET_NAMESPACE} -o yaml < delete-mq-tls-secret.yaml > mq-tls-secret.yaml

rm delete-mq-tls-secret.yaml
