# Migrate to Kubernetes

In September / October 2021, codeforphilly.org was migrated from being hosted on a legacy Emergence VM (`poplar.phl.io`) at DigitalOcean to the `cfp-live-cluster` hosted at Linode.

## Procedure

1. Configure `KUBECONFIG` to access `cfp-live-cluster`:

    ```bash
    export KUBECONFIG=~/.kube/cfp-live-cluster-kubeconfig.yaml
    ```

2. Find production Pod and store name in shell variable:

    ```bash
    pod_name=$(kubectl -n code-for-philly get pod \
        -l app.kubernetes.io/name=code-for-philly \
        -l app.kubernetes.io/instance=code-for-philly \
        --field-selector=status.phase==Running \
        -o jsonpath='{.items[0].metadata.name}'
    )
    ```

3. Get authenticated SQL dump url from <https://codeforphilly.org/site-admin> and store in a shell variable:

    ```bash
    sql_url='https://codeforphilly.org/site-admin/database/dump.sql?_session=abcdef1234567890'
    ```

4. Load database into Kubernetes host:

    ```bash
    kubectl -n code-for-philly exec "${pod_name}" -- \
        hab pkg exec codeforphilly/site-composite \
            bash -c \
                "curl '${sql_url}' | mysql"
    ```

5. Install rsync and openssh into running Kubernetes host:

    ```bash
    kubectl -n code-for-philly exec "${pod_name}" -- \
        hab pkg install --binlink --force core/rsync core/openssh
    ```

6. Copy SSH key into Kubernetes host that can connect to legacy VM:

    ```bash
    kubectl -n code-for-philly cp .scratch/id_rsa "${pod_name}:/root/"
    ```

7. User rsync to synchronize data files from legacy VM to Kubernetes host:

    ```bash
    kubectl -n code-for-philly exec "${pod_name}" -- \
        rsync \
            -e 'ssh -i /root/id_rsa -o "StrictHostKeyChecking no"' \
            -av \
            --chown hab:hab \
            --exclude '*.log' \
            --exclude 'git/' \
            --exclude 'media/*x*/' \
            'root@poplar.phl.io:/emergence/sites/code-for-philly/site-data/' \
            '/hab/svc/site/data/'
    ```
