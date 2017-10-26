local k = import "ksonnet.beta.2/k.libsonnet";
local deployment = k.apps.v1beta1.deployment;
local container = deployment.mixin.spec.template.spec.containersType;
local containerPort = container.portsType;
local volumeMount = container.volumeMountsType;
local volume = deployment.mixin.spec.template.spec.volumesType;

local registryContainer =
  container.new("registry", )