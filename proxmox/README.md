# Templates for Proxmox VE

This scripts download & create template for Proxmox VE

How to use:
1. Clone repository to your Proxmox host
2. Edit pve-templates.sh for images - remove/add what your want
3. Edit create_template.sh for
    1. ssh_keyfile - file with your authorized keys
    2. username - your username for VM
    3. storage - name of your Proxmox storage
4. Make both scripts executable: chmod +x *.sh
5. Run ./pve-templates.sh
6. Wait a while, it depends of your internet connection speed
7. Check new templates
8. Clone Template to VM
9. Edit Hardware (CPU/Memory/Disk/etc) of your new VM
10. Start VM, check is started and OK
11. Enjoy
