#!/bin/bash

# Update Package Index

VPNKEY=$(openssl rand -base64 64)
SOURCE_PUBIP=$(curl http://ifconfig.me/ip)

cat >> /tmp/ipsec.secrets << EOF
# source      destination
$(echo $SOURCE_PUBIP) 1.1.1.1: PSK "$(echo $VPNKEY)"
EOF






