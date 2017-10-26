local k = import "ksonnet.beta.2/k.libsonnet";

local service = import "./service.jsonnet";
local deployment = import "./deployment.jsonnet";

k.core.v1.list.new([
    deployment,
    service
])