# Sticky Session POC #

Steps to run the sample:

1. Create infrastructure (see scripts/deploy_insfra.sh)
2. Create namespaces for 3 customers (see scripts/namespaces.sh)
3. Deploy environment per customer (see manifests/customer1-3.yaml). Be aware: you have to change the HOST name for the ingress definitions to match your custom URL

Check: Hit the environments via http://<CUSTOM_URL>/customer1, http://<CUSTOM_URL>/customer2, http://<CUSTOM_URL>/customer3 

Outcome: each customer gets its own dedicated environment, including sticky sessions.
