12_01 Helm Basics - Retail Store UI Application (Basic Demo)
Step-00: Helm Introduction
Why Helm?
Why Helm?

Helm Benefits
Helm Benefits

Helm Workflow
Why Helm

Step-01: Introduction
In this demo, we will learn Helm basics using our Retail Store UI Application.

How to install a Helm chart from OCI
How to list and inspect Helm releases
How to upgrade and rollback Helm releases
How to override application values
How to view chart values and rendered manifests
How to uninstall a release
Step-02: Explore Helm Chart Source
Search for Helm Charts at Artifacthub.io
Retail Store UI Chart is published as an OCI Helm Chart in AWS Public ECR.
Retail Store UI Helm Chart
👉 Since this is an OCI-based chart, we don’t add it with helm repo add.
Instead, we install it directly from the oci:// URL.

Step-03: Install Retail UI Helm Chart (Default Settings)
By default, the chart installs with its own service configuration.

# Authenticate to Public ECR
## Helm needs a valid authentication token to pull OCI charts from Amazon ECR Public.
aws ecr-public get-login-password --region us-east-1 | helm registry login -u AWS --password-stdin public.ecr.aws


# Install Retail UI Helm Chart (version 1.0.0)
helm install ui oci://public.ecr.aws/aws-containers/retail-store-sample-ui-chart \
  --version 1.0.0
Step-04: List Helm Releases
# List Helm releases (default table output)
helm list
helm ls

# List Helm releases in YAML or JSON
helm list --output=yaml
helm list --output=json

# List Helm releases for a specific namespace (if not using default)
helm list -n default
Step-05: Verify Kubernetes Resources
After Helm installs the chart, Kubernetes resources are created automatically.

# List Pods created by the 'ui' release
kubectl get pods

# List Services created by the 'ui' release
kubectl get svc
👉 By default, the Retail UI chart exposes a ClusterIP service. To access it from your local machine, use port-forward:

# Port-forward to access the application locally (adjust service name if different)
kubectl port-forward svc/ui 30080:80

# Access the Retail UI application
http://localhost:30080
Tip: If the service name isn’t exactly ui, find it via label:

kubectl get svc -l app.kubernetes.io/instance=ui
Step-06: Upgrade Retail UI Release
Retail UI - Documentation
# Upgrade to a new chart version (1.2.4) and change app theme (example)
helm upgrade ui oci://public.ecr.aws/aws-containers/retail-store-sample-ui-chart \
  --version 1.2.4 \
  --set app.theme=orange

# Check release history
helm history ui

# Watch Pods during rollout
kubectl get pods -w

# (If service is ClusterIP) Port-forward again to access the app
kubectl port-forward svc/ui 30080:80
# Then browse:
# http://localhost:30080
Step-07: Print Helm Values & Manifests
To verify which values are in effect and what Kubernetes resources were created:

# Print only overridden values
helm get values ui

# Print all values (defaults + overrides)
helm get values ui --all

# Print rendered Kubernetes manifests (Deployment, Service, etc.)
helm get manifest ui
Step-08: Rollback to Previous Release
# Show release history
helm history ui

# Roll back to revision 1
helm rollback ui 1

# Verify rollback
helm list
helm history ui
kubectl get pods -w

# (If service is ClusterIP) Port-forward to access the application
kubectl port-forward svc/ui 30080:80
# http://localhost:30080
Pro Tips

helm rollback ui → rolls back to the last successful release.
helm rollback ui 1 --dry-run → preview rollback without applying.
Step-09: Update Application Theme
You can update application values (like theme) during an upgrade.

👉 Pods may not restart automatically because ConfigMap/env changes don’t always trigger a rollout. If that happens, restart the Deployment manually.

# First Upgrade to latest version
helm upgrade ui oci://public.ecr.aws/aws-containers/retail-store-sample-ui-chart \
  --version 1.3.0
  
# Change theme to green (stays on chart version 1.3.0)
helm upgrade ui oci://public.ecr.aws/aws-containers/retail-store-sample-ui-chart \
  --version 1.3.0 \
  --set app.theme=green

# If pods don't restart automatically, trigger a rollout:
kubectl rollout restart deployment/ui

# Verify pods
kubectl get pods

# (If service is ClusterIP) Port-forward to access the app
kubectl port-forward svc/ui 30080:80
# http://localhost:30080
Step-10: Uninstall Retail UI Release
# List Helm releases
helm ls

# Uninstall the 'ui' release
helm uninstall ui
Helm Chart Referece
Retail Store Helm Chart - UI App
