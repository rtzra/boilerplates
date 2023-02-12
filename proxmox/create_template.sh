#!/bin/bash

# Script create template for Proxmox Virtual Environment
# Run script as:
#   ./create_template.sh ID TEMPLATE_NAME IMAGE_NAME

### Settings

# Path to your ssh authorized_keys file
ssh_keyfile=/root/.ssh/authorized_keys-cloudinit

# Username to create for VM template
username=fireball

# Name of your Proxmox storage
storage=raid1

# Default folder for ISO files
templates_home=/var/lib/vz/template/iso

### Start script
echo " ===>>> Creating template $2 $1 from $3" 

# Destroy template if exist
qm destroy $1

# Create template
qm create $1 --name $2

# Import image
qm importdisk $1 $templates_home/$3 $storage

# Set storage settings
qm set $1 --scsihw virtio-scsi-pci --scsi0 $storage:vm-$1-disk-0,discard=on
qm set $1 --boot c --bootdisk scsi0

# Set memory, cpu, type
qm set $1 --memory 2048 --cores 2 --cpu host

# Set OS type
qm set $1 --ostype=l26

# Enable start at boot
qm set $1 -onboot 1

# Set networking to default bridge
qm set $1 --net0 virtio,bridge=vmbr0

# Set display to serial
qm set $1 --serial0 socket --vga serial0

# Add rng0 to system 
qm set $1 --rng0=/dev/urandom

# Enable Qemu guest agent
qm set $1 --agent enabled=1,fstrim_cloned_disks=1

# Add cloud-init device
qm set $1 --ide2 ${storage}:cloudinit

# Add the user
qm set $1 --ciuser ${username}

# If you want password-based authentication
# qm set $1 --cipassword password

# Import the ssh keyfile
qm set $1 --sshkeys ${ssh_keyfile}

# Set CI ip config
qm set $1 --ipconfig0 "ip=dhcp"

# Resize the disk to 8G, a reasonable minimum. You can expand it more later.
qm resize $1 scsi0 8G

# Make it a template
qm template $1

# Remove image file when done
rm $3
