data "aws_ssm_parameter" "name" {
  name = var.github_name
}

data "aws_ssm_parameter" "token" {
  name = var.github_token
}

resource "helm_release" "argocd" {
  name             = "argocd"
  repository       = "https://argoproj.github.io/argo-helm"
  chart            = "argo-cd"
  namespace        = "argocd"
  version          = var.chart_version
  create_namespace = true
  values = [<<EOF
configs:
  credentialTemplates:
    https-creds:
      url: https://github.com/thearmanv/argocd.git
      password: "${data.aws_ssm_parameter.token.value}"
      username: "${data.aws_ssm_parameter.name.value}"
EOF
]

}

resource "helm_release" "app" {
  name             = "appofapps"
  repository       = "https://argoproj.github.io/argo-helm"
  chart            = "argocd-apps"
  namespace        = "argocd"
  version          = "1.6.2"
  create_namespace = true
  values           = var.app_values
  depends_on       = [helm_release.argocd]
}