local k = import "ksonnet.beta.2/k.libsonnet";
local service = k.core.v1.service;
local servicePort = service.mixin.spec.portsType;

local dexServicePort =
  servicePort.newNamed("dex", 5556, 5556) +
  servicePort.nodePort(32000) +
  servicePort.protocol("TCP");

service.new("dex", { app: "dex" }, dexServicePort) +
  service.mixin.spec.type("NodePort")