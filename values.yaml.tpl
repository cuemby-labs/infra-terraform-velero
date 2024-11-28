initContainers:
  - name: velero-plugin-for-aws
    image: ${velero_image}
    imagePullPolicy: IfNotPresent
    volumeMounts:
      - mountPath: /target
        name: plugins
  - name: openebs-velero-plugin
    image: openebs/velero-plugin:latest
    imagePullPolicy: IfNotPresent
    volumeMounts:
      - mountPath: /target
        name: plugins
configuration:
  backupSyncPeriod: 1h
  features: EnableCSI
  defaultVolumeSnapshotLocations: "velero.io/aws:velero-aws"
  defaultSnapshotMoveData: true
  backupStorageLocation:
  - name: default
    provider: ${velero_provider}
    bucket: ${velero_bucket}
    #prefix: dev-backup
    credential:
      # Key within the secret data which contains the cloud credentials
      key: cloud
      # Name of the secret containing the credentials
      name: cloud-credentials
    config:
      region: minio
      s3ForcePathStyle: "true"
      s3Url: ${s3url}
  volumeSnapshotLocation:
    - name: default
      provider: ${velero_provider}
      credential:
        # Key within the secret data which contains the cloud credentials
        key: cloud
        # Name of the secret containing the credentials
        name: cloud-credentials
deployNodeAgent: true
resources:
  requests:
    cpu: 1000m
    memory: 2000Mi
  limits:
    cpu: 2000m
    memory: 4000Mi