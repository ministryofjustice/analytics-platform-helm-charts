# Cluster-AutoScaler

The [Cluster Autoscaler](https://github.com/kubernetes/autoscaler/tree/master/cluster-autoscaler) on AWS scales worker nodes within any specified autoscaling group. It will run as a Deployment in the cluster.

See: [configuration flags](https://github.com/kubernetes/autoscaler/blob/master/cluster-autoscaler/FAQ.md#what-are-the-parameters-to-ca)

## Dependencies

This chart requires the following IAM permissions.  More information can be found [here](https://github.com/kubernetes/autoscaler/tree/master/cluster-autoscaler/cloudprovider/aws#permissions).

```json
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "autoscaling:DescribeAutoScalingGroups",
                "autoscaling:DescribeAutoScalingInstances",
                "autoscaling:SetDesiredCapacity",
                "autoscaling:TerminateInstanceInAutoScalingGroup"
            ],
            "Resource": "*"
        }
    ]
}
```

### Installing/Upgrading chart

```shell
helm upgrade cluster-autoscaler mojanalytics/cluster-autoscaler --namespace=default -f ../analytics-platform-config/chart-env-config/$ENV/cluster-autoscaler.yaml --install
```

Contrary to online documentation it's best for us to ensure this chart is installed in a namespace other than `kube-system`, as opposed to modifying the `kube-system` namespace.
This is because we use [kube2iam](https://github.com/jtblin/kube2iam), which imposes namespace restrictions and can prevent
the [Cluster Autoscaler](https://github.com/kubernetes/autoscaler/tree/master/cluster-autoscaler) from functioning correctly.

### Configuration

| Parameter  | Description      | Default |
| ---------- | ---------------  | ------- |
| `autoscalingGroups.name` | The name of the autoscaling group to managed |   ""  |
| `autoscalingGroups.min` | The minimum number of worker instances to remain provisioned | `3` |
| `autoscalingGroups.max` | The maximum number of worker instances that can be provisioned | `10` |
| `env` | The environment being deployed to. i.e. `dev` or `alpha` | "" |
| `aws_region` | The AWS region your cluster resides in | "" |
| `pdb.key` | The key of the target pod's label you wish to create a PodDisruptionBudget for | "" |
| `pdb.val` | The value of the target Pod's label you wish to create a PodDisruptionBudget for | "" |


By default [Cluster Autoscaler](https://github.com/kubernetes/autoscaler/tree/master/cluster-autoscaler) ignores nodes that contain `pods`
in the `kube-system` namespace.  It is likely that this behaviour will lead to underutilised nodes remaining after a scale down operation.
[Cluster Autoscaler](https://github.com/kubernetes/autoscaler/tree/master/cluster-autoscaler) uses the eviction API and respects [PodDisruptionBudgets](https://kubernetes.io/docs/concepts/workloads/pods/disruptions/).
Implementing [PodDisruptionBudgets](https://kubernetes.io/docs/concepts/workloads/pods/disruptions/), allows [Cluster Autoscaler](https://github.com/kubernetes/autoscaler/tree/master/cluster-autoscaler) to evict `pods` in the
`kube-system` namespace.
