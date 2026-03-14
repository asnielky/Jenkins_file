#!/bin/bash

echo "--- 1. Configurando Repositorio Elastic 8.x ---"
sudo tee /etc/yum.repos.d/elastic.repo <<EOF
[elastic-8.x]
name=Elastic repository for 8.x packages
baseurl=https://artifacts.elastic.co/packages/8.x/yum
gpgcheck=1
gpgkey=https://artifacts.elastic.co/GPG-KEY-elasticsearch
enabled=1
autorefresh=1
type=rpm-md
EOF

echo "--- 2. Instalando Filebeat ---"
sudo dnf clean all
sudo dnf install filebeat -y

echo "--- 3. Habilitando Módulo de Sistema ---"
sudo filebeat modules enable system

echo "--- 4. Iniciando Servicio ---"
sudo systemctl enable --now filebeat

echo "--- ESTADO FINAL ---"
sudo systemctl is-active filebeat
