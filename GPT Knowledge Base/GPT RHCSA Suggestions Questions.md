# RHCSA - Suggested Questions

## Basic Commands

- **How do I manage files and directories in Linux using commands like `ls`, `cp`, `mv`, and `rm`?**
- **What are the differences between `cp`, `mv`, and `rm`, and when should each be used?**
- **How do you navigate the filesystem using absolute and relative paths?**
- **How do you use wildcards and globbing patterns to manipulate multiple files at once?**
- **What are hard and symbolic links, and how do you create them?**

## Permissions & Ownership

- **How can I change file permissions and ownership using `chmod`, `chown`, and `chgrp`?**
- **How do I assign special permissions like `setuid`, `setgid`, and the sticky bit?**
- **What is the difference between symbolic and numeric modes in `chmod`, and how do you use them?**
- **How does the `umask` setting affect default file creation permissions?**
- **How do you set and manage Access Control Lists (ACLs) on files and directories?**

## User & Group Management

- **How do I create a new user with specific properties (UID, GID, home directory, shell)?**
- **How do I assign a user to a group, including supplementary groups?**
- **What is the difference between `usermod` and `groupmod`, and when would you use each?**
- **How do you lock and unlock user accounts?**
- **What are the purposes of the `/etc/passwd`, `/etc/shadow`, and `/etc/group` files?**
- **How do you manage user privileges and sudo access?**

## System Management

- **How do I check system uptime, kernel version, and hardware information?**
  - *Commands: `uptime`, `uname -a`, `lshw`, `lspci`, `lsusb`*
- **How can I manage processes using `ps`, `top`, `htop`, and `kill`?**
- **How do you manage services using `systemctl`, and what are the differences between service states like active, enabled, and masked?**
- **How do you view and analyze system logs using `journalctl`?**
- **How do you modify kernel parameters at runtime and persistently using `sysctl`?**
- **How do you manage the system boot process and GRUB2 configurations?**

## Networking Configuration

- **How do I configure static IP addresses in Linux using `nmcli` or by editing network configuration files?**
- **What tools can I use to troubleshoot network issues, such as `ping`, `traceroute`, `ss`, `tcpdump`, and `nmap`?**
- **How do you configure hostname resolution using `/etc/hosts` and DNS settings?**
- **What is NetworkManager, and how does it interact with traditional network configuration files?**
- **How do you view and manage network interfaces using `ip` and `ifconfig`?**

## Storage Management

- **How do I create and mount partitions using `fdisk` or `parted`?**
- **How can I manage Logical Volume Manager (LVM) in Linux, including creating and resizing volumes?**
- **How do you format partitions with filesystems and mount them persistently using `/etc/fstab`?**
- **How do you create and enable swap space in Linux?**
- **What are the differences between primary, extended, and logical partitions?**

## SELinux

- **How can I check the status of SELinux using `sestatus` and `getenforce`?**
- **How do I configure SELinux policies and rules for a specific service?**
- **What are SELinux contexts, and how do you view and modify them using `ls -Z`, `chcon`, and `restorecon`?**
- **How do you manage SELinux booleans with `getsebool` and `setsebool`?**
- **How do you troubleshoot and resolve SELinux denials using `audit2why` and `audit2allow`?**

## Firewall Configuration

- **How do I set up basic firewall rules using `firewalld` and `firewall-cmd`?**
- **What is the difference between zones in `firewalld`, and how do you assign interfaces to zones?**
- **How do you add, remove, and list services and ports in the firewall configuration?**
- **What is the difference between permanent and runtime configurations in `firewalld`?**
- **How do you configure masquerading and port forwarding with `firewalld`?**

## Automating Tasks

- **How do I schedule recurring jobs using `cron`, and what is the syntax of a crontab entry?**
- **What are `at` and `anacron`, and when should I use them?**
- **How do you edit the system-wide crontab versus a user's crontab?**
- **How do you schedule one-time tasks using `at` and `batch`?**
- **How do you write and schedule scripts for task automation?**

## Core Areas of Focus

### File and Directory Management

- **Understanding basic commands like `ls`, `cp`, `mv`, and `rm`**
- **Handling file and directory permissions with `chmod`, `chown`, and `chgrp`**
- **Creating and using hard and symbolic links**
- **Using wildcards and globbing patterns for file manipulation**

### User and Group Management

- **Adding, modifying, and deleting users and groups**
- **Managing user privileges and sudo access**
- **Understanding system files related to user and group information**

### System Monitoring & Process Management

- **Checking system logs and resource usage**
- **Managing services with `systemctl`**
- **Monitoring processes with tools like `ps`, `top`, `htop`, and `vmstat`**
- **Controlling processes using `kill`, `pkill`, and `killall`**

### Networking

- **Configuring IP addresses and network interfaces**
- **Troubleshooting network issues using `ping`, `netstat`, `ss`, `ip`, and `traceroute`**
- **Configuring hostname resolution and DNS settings**

### Storage and LVM

- **Partitioning disks and mounting filesystems**
- **Working with LVM to create and manage physical volumes, volume groups, and logical volumes**
- **Resizing logical volumes and filesystems**

### Security

- **Configuring firewall rules with `firewalld`**
- **Managing SELinux policies and handling security contexts**
- **Securing SSH access and implementing password policies**

### Automating Core Tasks

- **Setting up scheduled tasks using `cron`, `at`, and `anacron`**
- **Writing simple Bash scripts for task automation**
- **Automating system administration tasks**

## Additional Topics

### Kernel and Boot Process

- **How do you modify GRUB2 boot parameters and manage the boot loader configuration?**
- **How do you recover from a forgotten root password using single-user mode?**
- **How do you manage kernel modules and understand the boot process?**

### Virtualization and Containers

- **What are the basic commands to create and manage virtual machines using KVM and `virsh`?**
- **How do you manage containers using Podman, including creating, running, and removing containers?**

### Security Best Practices

- **How do you configure SSH for key-based authentication and disable root login over SSH?**
- **What steps can you take to secure a server, including setting password policies and keeping software updated?**
- **How do you implement firewall and SELinux policies to enhance system security?**

### Scripting and Automation

- **How do you write and execute simple shell scripts in Bash?**
- **How do you use variables, conditionals, loops, and functions in shell scripts?**
- **How do you automate system tasks using scripts and scheduling tools?**

---
