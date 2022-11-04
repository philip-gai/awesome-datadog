# awesome-datadog

[![Awesome](https://awesome.re/badge-flat2.svg)](https://awesome.re)

![awesome-datadog-logo](https://user-images.githubusercontent.com/17363579/199892152-799ce2c9-cb98-40f1-aa0b-753120ad76f1.png)

Pull requests welcome! Please suggest improvements to the monitors, troubleshooting guides, etc.

See Datadog docs for [exporting and importing monitors](https://docs.datadoghq.com/monitors/create/#exporting-and-importing-monitors).

## Monitors

- [Azure](./monitors/azure)
  - [Azure Container Service Managed Clusters Node Disk Usage Percentage](./monitors/azure/containerservice-managedclusters-nodediskusagepercentage.json)
  - [Azure SQL Server Database Log Write Percent](./monitors/azure/sqlserverdatabases-logwritepercent.json)
  - [Azure SQL Server Database Physical Data Read Percent](./monitors/azure/sqlserverdatabases-physicaldatareadpercent.json)
  - [Azure SQL Server Database Storage Percent](./monitors/azure/sqlserverdatabases-storagepercent.json)
  - [Azure SQL Server Database Workers Percent](./monitors/azure/sqlserverdatabases-workerspercent.json)
- [.NET](./monitors/dotnet)
  - [ASP.NET Core Request Queue Length](./monitors/dotnet/aspnetcore-requests-queuelength.json)
- [Kubernetes](./monitors/kubernetes/)
  - [Kubernetes Container CPU Usage](./monitors/kubernetes/container-cpu-usage.json)
  - [Kubernetes Container Memory Usage](./monitors/kubernetes/container-memory-usage.json)
  - [Kubernetes Deployments Replica Not Available](./monitors/kubernetes/deployment-replicas-available.json)
  - [Kubernetes Namespace Status Failed](./monitors/kubernetes/namespace-pods.json)
  - [Kubernetes Nodes Unschedulable](./monitors/kubernetes/nodes-unschedulable.json)
  - [Kubernetes Pod CrashloopBackOff](./monitors/kubernetes/pod-crashloopbackoff.json)
  - [Kubernetes Pod ImagePullBackOff](./monitors/kubernetes/pod-imagepullbackoff.json)
  - [Kubernetes Statefulset Replicas Ready](./monitors/kubernetes/statefulset-replicas-ready.json)

## Dashboards

- ...pull requests welcome 😊
