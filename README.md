# gcp-cloud-run-deploy-rust
A basic GitHub Actions/Cloud Build GCP Cloud Run deploy pipeline for a Rocket web service. This can be used as a starting point for a Rocket Cloud Run deploy strategy.

### GitHub Actions secrets

```
SA_KEY_JSON # JSON key file for a custom service account to be used by GitHub actions
PROJECT_ID # The ID for the project you are deploying to
CR_SA # The custom service account that Cloud Run will use
CR_SERVICE_NAME # The Cloud Run service name
```

### GitHub Actions custom service account

e.g. github-actions-sa@project-id.iam.gserviceaccount.com

#### Roles

- Cloud Build Service Agent

### Cloud Run custom service account

e.g. cloud-run-sa@project-id.iam.gserviceaccount.com

#### Roles

Existing roles:
- Cloud Run Invoker

Cloud Run SA Core Permissions (custom role created at the org level with permissions):
- resourcemanager.projects.get
- resourcemanager.projects.list
- secretmanager.versions.access

### Cloud Build default service account

e.g. project-number@cloudbuild.gserviceaccount.com

#### Roles

Existing roles:
- Cloud Build Service Account

Cloud Build SA Core Permissions (custom role created at the org level with permissions):
- iam.serviceAccounts.actAs
- iam.serviceAccounts.get
- iam.serviceAccounts.list
- recommender.locations.get
- recommender.locations.list
- resourcemanager.projects.get
- resourcemanager.projects.list
- run.configurations.get
- run.configurations.list
- run.locations.list
- run.operations.delete
- run.operations.get
- run.operations.list
- run.revisions.delete
- run.revisions.get
- run.revisions.list
- run.routes.get
- run.routes.list
- run.services.create
- run.services.createTagBinding
- run.services.delete
- run.services.deleteTagBinding
- run.services.get
- run.services.getIamPolicy
- run.services.list
- run.services.listEffectiveTags
- run.services.listTagBindings
- run.services.setIamPolicy
- run.services.update
- secretmanager.versions.access
