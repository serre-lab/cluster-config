local k = import "ksonnet.beta.2/k.libsonnet";
local deployment = k.apps.v1beta1.deployment;
local container = deployment.mixin.spec.template.spec.containersType;
local containerPort = container.portsType;
local env = container.envType;
local volumeMount = container.volumeMountsType;
local volume = deployment.mixin.spec.template.spec.volumesType;
local configMapItem = volume.mixin.configMap.itemsType;


local dexContainer =
  container.new("dex", "bnavetta/dex:7d88cf44b8b581be09ad85d0f1531d8c6f7551a7-dirty") +
  container.command(["/usr/local/bin/dex", "serve", "/etc/dex/cfg/config.yaml"]) +
  container.ports(containerPort.newNamed("https", 5556)) + 
  container.env([
    env.fromSecretRef("SLACK_CLIENT_ID", "slack-login", "client-id"),
    env.fromSecretRef("SLACK_CLIENT_SECRET", "slack-login", "client-secret")
  ]) +
  container.volumeMounts([
    volumeMount.new("config", "/etc/dex/cfg"),
    volumeMount.new("tls", "/etc/dex/tls")
  ]);

local volumes = [
  volume.fromConfigMap("config", "dex", [configMapItem.new("config.yaml", "config.yaml")]),
  volume.name("tls") + volume.mixin.secret.secretName("dex.tls")
];

deployment.new("dex", 1, dexContainer, { app: "dex" }) +
  deployment.mixin.spec.template.spec.volumes(volumes) +
  deployment.mixin.spec.template.spec.nodeSelector({ "kubernetes.io/hostname": "serrep4" }) +
  deployment.mixin.metadata.labels({ app: "dex" })
