# Accessing Production

The production instance of `codeforphilly.org` is deployed via the [`cfp-live-cluster`](https://github.com/CodeForPhilly/cfp-live-cluster) via the release configured at [`cfp-live-cluster/code-for-philly`](https://github.com/CodeForPhilly/cfp-live-cluster/tree/main/code-for-philly)

## Deployment process

1. Merge one or more PRs into `develop` under the [`codeforphilly.org`](https://github.com/CodeForPhilly/codeforphilly.org) repository
    - A release PR will automatically be generated with a suggested version number in the title, a template for release notes in the description, and a copyable draft changelog in the first comment
    - The first comment with the draft changelog will be automatically updated as additional commits/PRs are added to `develop`
    - The title or description will not be automatically changed after the PR is initially created, so they are safe to manually edit
2. Copy bullet points from the generated changelog comment and use them to fill out the release notes template in the description, deleting any unused section. The suggested version number in the title will default to incrementing the patch number, and may be manually edited to switch to incrementing the minor number
3. Merge the release PR when ready
    - A GitHub release+tag will automatically get created
    - The new release/tag will kick off automatically building and tagging a new Docker container image
4. After the new image is built, edit [`code-for-philly/release-values.yaml`](https://github.com/CodeForPhilly/cfp-live-cluster/blob/main/code-for-philly/release-values.yaml) in the `cfp-live-cluster` repository to update the image tag to the new version either as a direct commit to the `main` branch or a PR (see [this example commit](https://github.com/CodeForPhilly/cfp-live-cluster/commit/67ce5a73b94ebd6e12a5aff34f2f7b02a9fd42f2))
5. Ask the Code for Philly ops team to merge your version bump PR if needed
    - A deployment PR will automatically be generated after that, previewing the pending changes to the cluster
6. Ask the Code for Philly ops team to merge the pending deployment
    - The cluster will automatically be updated and the new image deployed

## Accessing instance

The production database runs within the Kubernetes cluster, and is snapshotted every hour by `restic` to a Linode cloud storage bucket.

The database, as well as application logs and shell, can be accessed via a `KUBECONFIG` file with access to the needed resources. Ask Code for Philly ops to provide one if needed.

### Using admin service account

1. Activate the provided `KUBECONFIG` in your current terminal session:

    ```bash
    export KUBECONFIG=~/.kube/code-for-philly-admin.yaml
    ```

2. Get the name of the currently running pods and store them in shell variables:

    ```bash
    POD_NAME=$(kubectl -n code-for-philly get pod -l app.kubernetes.io/name=code-for-philly -o jsonpath='{.items[0].metadata.name}')
    ```

### Open interactive backend shell

```bash
kubectl -n code-for-philly exec -it $POD_NAME -- bash
```

### Open interactive database shell

```bash
kubectl -n code-for-philly exec -it $POD_NAME -- hab pkg exec codeforphilly/site-composite mysql
```

### Run an emergence-console command

```bash
kubectl -n code-for-philly exec -it $POD_NAME -- hab pkg exec codeforphilly/site-composite emergence-console-run migrations:execute
```

### Run an SQL query

```bash
echo 'SELECT * FROM people' | kubectl -n code-for-philly exec -i $POD_NAME -- hab pkg exec codeforphilly/site-composite mysql
```

### Dump the entire database

```bash
kubectl -n code-for-philly exec -it $POD_NAME -- hab pkg exec codeforphilly/site-composite mysqldump 'codeforphilly' > /tmp/codeforphilly.sql
```

### Forward MySQL port

```bash
kubectl -n code-for-philly port-forward pods/$POD_NAME 3306:3306
```

!!! tip "Database logins"
    Default database credentials can be found in `helm-chart/values.yaml` (typically `admin` / `admin`)
