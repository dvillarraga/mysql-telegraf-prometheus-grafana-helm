#!/bin/bash
set -e -u
helm install -f mysql.yaml mysql ./mysql
helm install telegraf ./telegraf
helm install prometheus ./prometheus
helm install grafana ./grafana
