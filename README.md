# awesome-datadog

[![Awesome](https://awesome.re/badge-flat2.svg)](https://awesome.re)

![awesome-datadog-logo](https://user-images.githubusercontent.com/17363579/199892152-799ce2c9-cb98-40f1-aa0b-753120ad76f1.png)

See Datadog docs for [exporting and importing monitors](https://docs.datadoghq.com/monitors/create/#exporting-and-importing-monitors).

## Monitors

- [Azure](./azure/monitors/)
  - [Azure Container Service Managed Clusters Node Disk Usage Percentage](./azure/monitors/containerservice-managedclusters-nodediskusagepercentage.json)
  - [Azure SQL Server Database Log Write Percent](./azure/monitors/sqlserverdatabases-logwritepercent.json)
  - [Azure SQL Server Database Physical Data Read Percent](./azure/monitors/sqlserverdatabases-physicaldatareadpercent.json)
  - [Azure SQL Server Database Storage Percent](./azure/monitors/sqlserverdatabases-storagepercent.json)
  - [Azure SQL Server Database Workers Percent](./azure/monitors/sqlserverdatabases-workerspercent.json)
- [.NET](./dotnet/monitors/)
  - [ASP.NET Core Request Queue Length](./dotnet/monitors/aspnetcore-requests-queuelength.json)
- [Kubernetes](./kubernetes/monitors/)
  - [Kubernetes Container CPU Usage](./kubernetes/monitors/container-cpu-usage.json)
  - [Kubernetes Container Memory Usage](./kubernetes/monitors/container-memory-usage.json)
  - [Kubernetes Deployments Replica Not Available](./kubernetes/monitors/deployment-replicas-available.json)
  - [Kubernetes Namespace Status Failed](./kubernetes/monitors/namespace-pods.json)
  - [Kubernetes Nodes Unschedulable](./kubernetes/monitors/nodes-unschedulable/)
  - [Kubernetes Pod CrashloopBackOff](./kubernetes/monitors/pod-crashloopbackoff/)
  - [Kubernetes Pod ImagePullBackOff](./kubernetes/monitors/pod-imagepullbackoff/)
  - [Kubernetes Statefulset Replicas Ready](./kubernetes/monitors/statefulset-replicas-ready.json)
- Pull requests welcome 😊. See [contributing](#contributing).

## Dashboards

- Pull requests welcome 😊. See [contributing](#contributing).

## Contributing

Pull requests welcome! Please suggest improvements to the monitors, troubleshooting guides, etc.

See Datadog docs for [exporting and importing monitors](https://docs.datadoghq.com/monitors/create/#exporting-and-importing-monitors).

For monitors:

1. Export the monitor from Datadog and name the monitor file `<title-of-monitor>.json`.
2. Create a folder or find an existing folder related to the service or technology you are monitoring.
3. If you are providing a troubleshooting guide (TSG), then create a folder `title-of-monitor` with a `README.md` and the monitor file `<title-of-monitor>.json`. Put the TSG in the `README.md`.
4. Link to your monitor from this page.

For dashboards:

1. Export the dashboard from Datadog and name the dashboard file `<title-of-dashboard>.json`.
2. Create a folder or find an existing folder related to the service or technology for your dashboard.
3. Create or find a `dashboards` folder in the service or technology folder.
4. Create a folder for your new dashboard named `<title-of-dashboard>`.
5. Add your dashboard template inside the `<title-of-dashboard>` folder.
6. Create a `README.md` inside the `<title-of-dashboard>` folder with pictures and an explanation of the dashboard.
7. Link to your dashboard folder from this page.
