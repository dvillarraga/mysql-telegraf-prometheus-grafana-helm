# mysql-telegraf-prometheus-grafana-helm

This is just an implementation using Helm + Kubernetes of:

1. A Grafana Cluster
2. A Prometheus Cluster
3. A Telegraf Cluster
4. A MySQL Instance with persistent storage



## It works, but how?

* MySQL has a persistent volume, so if the pod fails, the data won't get loss.
* MySQL has slow query logs enabled by default.
* Telegraf is capturing all MySQL logs (including slow queries) and it is sending the data to Prometheus.
* Prometheus is connected with Grafana
* Grafana has:
  * The connection with Prometheus: a Data Source
  * One Notification Channel: slack-alarming
  * One Dashboard with two panels, the first one includes an alert.
    * In case the count of slow queries is above 1, it will trigger the alert (slack message).



## What about the provision ?

:( Unfortunately I couldn't create the provision for EKS (<u>No enough time</u>), I would do it using **CloudFormation** probably. 

#### This project was created on Mac, using Docker Desktop + Kubernetes. 

What I had to do on my Mac was:

1. Install Docker Desktop
2. Enable Kubernetes on Docker Desktop
3. Install Homebrew

```bash
brew install helm
```

#### You want to test it?

I have created some NodePorts 

```bash
./install.sh
```

* Please open http://localhost:30300/ to access to Grafana
* You can connect to MySQL using:
  * User: root
  * Password: root
  * Port: 30006
* If you want to trigger the alert, on MySQL run twice:

```mysql
mysql> SELECT SLEEP(12);
```



#### You want to uninstall it?

```bash
./uninstall.sh
```

