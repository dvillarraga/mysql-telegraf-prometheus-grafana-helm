#!/bin/bash
set -e -u
helm uninstall mysql
helm uninstall telegraf
helm uninstall prometheus
helm uninstall grafana
