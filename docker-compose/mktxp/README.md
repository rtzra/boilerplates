# MKTXP is a Prometheus Exporter for Mikrotik RouterOS devices

It gathers and exports a rich set of metrics across multiple routers, all easily configurable via built-in CLI interface.

## Mikrotik Device Config

For the purpose of RouterOS device monitoring, it's best to create a dedicated user with minimal required permissions. MKTXP only needs API and Read, so at that point you can go to your router's terminal and type:

```
/user group add name=mktxp_group policy=api,read
/user add name=mktxp_user group=mktxp_group password=mktxp_user_password
```

## Exporting to Prometheus

For getting your routers' metrics into an existing Prometheus installation, we basically just need to connect MKTXP to it. Let's do just that via editing the Prometheus config file:

❯ nano /etc/prometheus/prometheus.yml

and simply add:
```
  - job_name: 'mktxp'
    scrape_timeout: 30s
    static_configs:
      - targets: ['mktxp_machine_IP:49090']
```

## Grafana dashboard

Now with your RouterOS metrics being exported to Prometheus, it's easy to visualize them with this Grafana dashboard: https://grafana.com/grafana/dashboards/13679-mikrotik-mktxp-exporter/

## Config files

Save sample config files, edit for you settings.
