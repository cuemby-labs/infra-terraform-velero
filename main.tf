#
# Velero Resources
#

resource "kubernetes_namespace" "velero" {
  metadata {
    name = var.namespace_name
  }
}

resource "kubernetes_secret" "cloud_credentials" {
  metadata {
    name      = "cloud-credentials"
    namespace = var.namespace_name
  }

  data = {
    cloud = <<EOF
[default]
aws_access_key_id = ${var.aws_access_key_id}
aws_secret_access_key = ${var.aws_secret_access_key}
EOF
  }

  type = "Opaque"
}


resource "helm_release" "velero" {
  name       = "velero"
  repository = "https://vmware-tanzu.github.io/helm-charts/"
  chart      = "velero"
  version    = var.chart_version
  namespace  = var.namespace_name

  values = [
    templatefile("${path.module}/values.yaml.tpl", {
      velero_image    = var.velero_image,
      velero_bucket   = var.velero_bucket,
      velero_provider = var.velero_provider,
      s3url           = var.s3url
    })
  ]
}

resource "kubectl_manifest" "velero_daily_schedule" {
  yaml_body = <<EOF
apiVersion: velero.io/v1
kind: Schedule
metadata:
  name: daily-schedule
  namespace: velero
spec:
  schedule: "${var.velero_schedule}"
  template:
    ttl: 336h0m0s
    includedNamespaces:
      - '*'
    includeClusterResources: true
    defaultVolumesToFsBackup: true
    snapshotMoveData: true
    storageLocation: default
  useOwnerReferencesInBackup: false
EOF
}

#
# Walrus Information
#

locals {
  context = var.context
}