local users = [
    "ben",
    "pbayer"
];

{
    kind: "RoleBinding",
    apiVersion: "rbac.authorization.k8s.io/v1",
    metadata: {
        name: "users-write",
        namespace: "default"
    },
    subjects: [{kind: "User", name: user, apiGroup: "rbac.authorization.k8s.io"} for user in users],
    roleRef: {
        kind: "Role",
        name: "edit",
        apiGroup: "rbac.authorization.k8s.io"
    },
}