#!/bin/bash

# Script download image & run create script creating template for Proxmox Virtual Environment
# Run template creation as:
#   ./create_template.sh ID TEMPLATE_NAME IMAGE_NAME

templates_home="/var/lib/vz/template/iso"
download_image="wget -c -P $templates_home"

# --------------------
## Ubuntu 22.04

# 20.04 (Focal Fossa)
$download_image "https://cloud-images.ubuntu.com/focal/current/focal-server-cloudimg-amd64.img"
./create_template.sh 900 "tmplt-ubuntu-20-04" "focal-server-cloudimg-amd64.img" 

# 22.04 (Jammy Jellyfish)
$download_image "https://cloud-images.ubuntu.com/jammy/current/jammy-server-cloudimg-amd64.img"
./create_template.sh 901 "tmplt-ubuntu-22-04" "jammy-server-cloudimg-amd64.img"

# --------------------
## Debian

# 10 (Buster)
$download_image "https://cloud.debian.org/images/cloud/buster/latest/debian-10-genericcloud-amd64.qcow2"
./create_template.sh 910 "tmplt-debian-10" "debian-10-genericcloud-amd64.qcow2"

# 11 (Bullseye)
$download_image "https://cloud.debian.org/images/cloud/bullseye/latest/debian-11-genericcloud-amd64.qcow2"
./create_template.sh 911 "tmplt-debian-11" "debian-11-genericcloud-amd64.qcow2"

# --------------------
## Astra

# Special Edition 1.7.3
$download_image "https://vault.astralinux.ru/images/alse/cloud/alse-vanilla-1.7.3-cloud-max-mg9.1.2.qcow2"
./create_template.sh 915 "tmplt-astra-9-1-2" "alse-vanilla-1.7.3-cloud-max-mg9.1.2.qcow2"

# --------------------
## Rocky

# Rocky 8
$download_image "https://dl.rockylinux.org/pub/rocky/8/images/x86_64/Rocky-8-GenericCloud-Base.latest.x86_64.qcow2"
./create_template.sh 920 "tmplt-rocky-8" "Rocky-8-GenericCloud-Base.latest.x86_64.qcow2"

# Rocky 9
$download_image "https://dl.rockylinux.org/pub/rocky/9/images/x86_64/Rocky-9-GenericCloud-Base.latest.x86_64.qcow2"
./create_template.sh 921 "tmplt-rocky-9" "Rocky-8-GenericCloud-Base.latest.x86_64.qcow2"
