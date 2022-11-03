#!/bin/bash

__HOSTNAME="$(hostname)"
__IP_ADDRESS="$(ip -f inet addr show eth1 | sed -En -e 's/.*inet ([0-9.]+).*/\1/p')"


#Install Docker, Nomad, Consul
source /etc/os-release # Get VERSION_CODENAME env.var which is "buster" at time of writing

# Apt Hashistack
wget -qO- https://apt.releases.hashicorp.com/gpg | apt-key add -
echo "deb [arch=amd64] https://apt.releases.hashicorp.com ${VERSION_CODENAME} main" > /etc/apt/sources.list.d/apt_releases_hashicorp_com.list
# Install
apt-get update -y
apt-get install -y docker.io nomad consul


cat > /etc/consul.d/client.hcl << EOF
node_name = "$__HOSTNAME"
datacenter = "dev-cec"
data_dir = "/opt/consul"
retry_join = ["10.10.10.3", "10.10.10.4", "10.10.10.5"]
client_addr = "$__IP_ADDRESS"
advertise_addr = "$__IP_ADDRESS"
connect {
  enabled = true
}
limits {
  http_max_conns_per_client = 500
}
#encrypt = "<replace with encryption key>"
EOF


cat > /etc/nomad.d/nomad.hcl << EOF
name = "$__HOSTNAME"
datacenter = "dev-cec"
data_dir = "/opt/nomad/data"

bind_addr = "0.0.0.0"

advertise {
  http = "$__IP_ADDRESS"
  rpc = "$__IP_ADDRESS"
  serf = "$__IP_ADDRESS"
}

client {
  enabled = true
  servers = ["10.10.10.3", "10.10.10.4", "10.10.10.5"]
}
consul {
  address = "${__IP_ADDRESS}:8500"
}
telemetry {
  publish_allocation_metrics = true
  prometheus_metrics = true
}
plugin "docker" {
  config {
    volumes {
      enabled = true
    }
    allow_privileged = true
  }
}
EOF

cat > /etc/systemd/system/consul.service << EOF
[Unit]
Description=Consul Client
Wants=network-online.target
After=network-online.target
[Service]
User=root
ExecStart=/usr/bin/consul agent -config-file /etc/consul.d/client.hcl
Restart=always
RestartSec=10
[Install]
WantedBy=multi-user.target
EOF

cat > /etc/systemd/system/nomad.service << EOF
[Unit]
Description=Nomad Client
Wants=network-online.target
After=network-online.target
[Service]
User=root
ExecStart=/usr/bin/nomad agent -config /etc/nomad.d/nomad.hcl
Restart=always
RestartSec=10
[Install]
WantedBy=multi-user.target
EOF

# manually pass encrypt key and start consul then...
systemctl start nomad
systecmtl enable nomad
