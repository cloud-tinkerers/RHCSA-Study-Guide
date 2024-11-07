## Red Hat Certified System Administrator (RHCSA) Study Guide

This study guide covers essential system applications and commands that are likely to be included in the RHCSA exam. Each section provides brief descriptions, top commands, and practical examples to help you prepare effectively.

---

## 1. Basic File System Commands

### **1.1 `ls` - List Directory Contents**

Lists files and directories within the file system.

- **Common Options:**
  - `-l`: Use a long listing format.
  - `-a`: Include hidden files (those starting with a dot).

- **Examples:**
  1. List all files and directories with detailed information:
     ```bash
     ls -la
     ```
  2. List files sorted by modification time:
     ```bash
     ls -lt
     ```

### **1.2 `cd` - Change Directory**

Changes the current working directory.

- **Examples:**
  1. Change to the `/var/log` directory:
     ```bash
     cd /var/log
     ```
  2. Move up one directory level:
     ```bash
     cd ..
     ```

### **1.3 `pwd` - Print Working Directory**

Displays the full path of the current directory.

- **Example:**
  ```bash
  pwd
  ```

### **1.4 `mkdir` - Make Directories**

Creates new directories.

- **Common Options:**
  - `-p`: Create parent directories as needed.

- **Examples:**
  1. Create a single directory:
     ```bash
     mkdir new_folder
     ```
  2. Create nested directories:
     ```bash
     mkdir -p projects/java/src
     ```

### **1.5 `rmdir` and `rm` - Remove Directories and Files**

- **`rmdir`** removes empty directories.
- **`rm`** removes files and directories.

- **Common Options for `rm`:**
  - `-r`: Recursive removal (for directories).
  - `-f`: Force removal without prompt.

- **Examples:**
  1. Remove an empty directory:
     ```bash
     rmdir old_folder
     ```
  2. Remove a directory and its contents:
     ```bash
     rm -rf unwanted_folder
     ```

### **1.6 `cp` - Copy Files and Directories**

Copies files and directories.

- **Common Options:**
  - `-r`: Copy directories recursively.
  - `-p`: Preserve file attributes.

- **Examples:**
  1. Copy a file:
     ```bash
     cp original.txt backup.txt
     ```
  2. Copy a directory and preserve attributes:
     ```bash
     cp -rp /source_dir /destination_dir
     ```

### **1.7 `mv` - Move or Rename Files and Directories**

Moves or renames files and directories.

- **Examples:**
  1. Rename a file:
     ```bash
     mv oldname.txt newname.txt
     ```
  2. Move files to another directory:
     ```bash
     mv *.txt /backup/
     ```

### **1.8 `touch` - Create Empty Files or Update Timestamps**

- **Examples:**
  1. Create a new empty file:
     ```bash
     touch newfile.txt
     ```
  2. Update the timestamp of an existing file:
     ```bash
     touch existingfile.txt
     ```

---

## 2. File Permissions and Ownership

### **2.1 `chmod` - Change File Mode Bits**

Changes the access permissions of files and directories.

- **Symbolic Modes:**
  - `u`: User
  - `g`: Group
  - `o`: Others
  - `a`: All
  - Permissions: `r` (read), `w` (write), `x` (execute)

- **Examples:**
  1. Add execute permission for the user:
     ```bash
     chmod u+x script.sh
     ```
  2. Remove write permission for others:
     ```bash
     chmod o-w file.txt
     ```

### **2.2 `chown` - Change File Owner and Group**

Changes the owner and group of files and directories.

- **Syntax:**
  ```bash
  chown [OWNER][:[GROUP]] FILE...
  ```

- **Examples:**
  1. Change the owner to `alice`:
     ```bash
     chown alice document.doc
     ```
  2. Change both owner and group:
     ```bash
     chown bob:developers project/
     ```

### **2.3 `chgrp` - Change Group Ownership**

Changes the group ownership.

- **Examples:**
  1. Change the group of a file:
     ```bash
     chgrp staff report.pdf
     ```
  2. Recursively change group ownership in a directory:
     ```bash
     chgrp -R team shared_folder/
     ```

---

## 3. Modifying Files

### **3.1 `nano` - Simple Text Editor**

A user-friendly, terminal-based text editor.

- **Examples:**
  1. Open a file in nano:
     ```bash
     nano notes.txt
     ```
  2. Create a new file:
     ```bash
     nano newfile.txt
     ```

### **3.2 `vi` / `vim` - Advanced Text Editor**

A powerful text editor with a steeper learning curve.

- **Examples:**
  1. Open a file in vi:
     ```bash
     vi config.cfg
     ```
  2. Open vi in read-only mode:
     ```bash
     vi -R important.doc
     ```

### **3.3 `cat` - Concatenate Files and Print**

Displays the contents of files.

- **Examples:**
  1. View a file's content:
     ```bash
     cat file.txt
     ```
  2. Combine two files:
     ```bash
     cat file1.txt file2.txt > combined.txt
     ```

### **3.4 `grep` - Search Text Using Patterns**

Searches for patterns within files.

- **Examples:**
  1. Find lines containing "error":
     ```bash
     grep "error" logfile.log
     ```
  2. Search recursively in directories:
     ```bash
     grep -r "TODO" /projects/
     ```

---

## 4. Process Management

### **4.1 `ps` - Report Process Status**

Displays information about active processes.

- **Examples:**
  1. View all running processes:
     ```bash
     ps -e
     ```
  2. View processes in a hierarchical tree:
     ```bash
     ps -e --forest
     ```

### **4.2 `top` - Display Real-Time Process Information**

Provides a dynamic real-time view of running processes.

- **Examples:**
  1. Start top:
     ```bash
     top
     ```
  2. Sort processes by memory usage:
     - Press `M` while top is running.

### **4.3 `kill` - Terminate Processes**

Sends signals to processes.

- **Examples:**
  1. Terminate a process with PID 1234:
     ```bash
     kill 1234
     ```
  2. Forcefully kill a process:
     ```bash
     kill -9 1234
     ```

---

## 5. User and Group Management

### **5.1 `useradd` - Add a New User**

Creates a new user account.

- **Examples:**
  1. Add a user named `dave`:
     ```bash
     useradd dave
     ```
  2. Add a user with a home directory and shell:
     ```bash
     useradd -m -s /bin/bash emily
     ```

### **5.2 `passwd` - Change User Password**

Sets or updates a user's password.

- **Examples:**
  1. Change your own password:
     ```bash
     passwd
     ```
  2. Set password for another user (as root):
     ```bash
     passwd steve
     ```

### **5.3 `groupadd` - Add a New Group**

Creates a new user group.

- **Examples:**
  1. Create a group named `developers`:
     ```bash
     groupadd developers
     ```
  2. Create a group with a specific GID:
     ```bash
     groupadd -g 1001 testers
     ```

---

## 6. Networking Commands

### **6.1 `ping` - Check Network Connectivity**

Sends ICMP ECHO_REQUEST packets to network hosts.

- **Examples:**
  1. Ping a host:
     ```bash
     ping example.com
     ```
  2. Limit the number of pings:
     ```bash
     ping -c 4 8.8.8.8
     ```

### **6.2 `ifconfig` and `ip` - Network Interface Configuration**

- **Note:** `ifconfig` is deprecated; use `ip` instead.

- **Examples with `ip`:**
  1. Show all network interfaces:
     ```bash
     ip addr
     ```
  2. Bring an interface up:
     ```bash
     ip link set eth0 up
     ```

### **6.3 `netstat` - Network Statistics**

Displays network connections, routing tables, and interface statistics.

- **Examples:**
  1. List all listening ports:
     ```bash
     netstat -tuln
     ```
  2. Display routing table:
     ```bash
     netstat -rn
     ```

---

## 7. Package Management

### **7.1 `yum` and `dnf` - Package Managers**

Used to install, update, and remove software packages.

- **Examples with `yum`:**
  1. Install a package:
     ```bash
     yum install httpd
     ```
  2. Remove a package:
     ```bash
     yum remove nginx
     ```

- **Examples with `dnf` (for newer systems):**
  1. Update all packages:
     ```bash
     dnf update
     ```
  2. Search for a package:
     ```bash
     dnf search php
     ```

### **7.2 `rpm` - RPM Package Manager**

Manages individual RPM packages.

- **Examples:**
  1. Install an RPM package:
     ```bash
     rpm -ivh package.rpm
     ```
  2. Query all installed packages:
     ```bash
     rpm -qa
     ```

---

## 8. System Services

### **8.1 `systemctl` - Control the System and Service Manager**

Manages services and system states.

- **Examples:**
  1. Start a service:
     ```bash
     systemctl start sshd
     ```
  2. Enable a service to start on boot:
     ```bash
     systemctl enable sshd
     ```
  3. Check the status of a service:
     ```bash
     systemctl status firewalld
     ```

---

## 9. Disk and File System Management

### **9.1 `df` - Disk Space Usage**

Reports file system disk space usage.

- **Examples:**
  1. Display disk space in human-readable form:
     ```bash
     df -h
     ```
  2. Show disk space of a specific file system:
     ```bash
     df -h /home
     ```

### **9.2 `du` - Disk Usage**

Estimates file space usage.

- **Examples:**
  1. Display the size of a directory:
     ```bash
     du -sh /var/log
     ```
  2. Show disk usage of files and directories:
     ```bash
     du -h /var/www
     ```

### **9.3 `mount` and `umount` - Mount and Unmount File Systems**

- **Examples:**
  1. Mount a device:
     ```bash
     mount /dev/sdb1 /mnt/usb
     ```
  2. Unmount a device:
     ```bash
     umount /mnt/usb
     ```

---

## 10. Firewall Configuration

### **10.1 `firewall-cmd` - Configure and Manage Firewalld**

Controls the system firewall.

- **Examples:**
  1. Check firewall status:
     ```bash
     firewall-cmd --state
     ```
  2. Open a port permanently:
     ```bash
     firewall-cmd --permanent --add-port=8080/tcp
     firewall-cmd --reload
     ```

### **10.2 `iptables` - Legacy Firewall Tool**

Manipulates the IP packet filter rules.

- **Examples:**
  1. List current iptables rules:
     ```bash
     iptables -L
     ```
  2. Flush all iptables rules:
     ```bash
     iptables -F
     ```

---

## 11. System Monitoring and Logs

### **11.1 `journalctl` - Query the Systemd Journal**

Views logs collected by systemd.

- **Examples:**
  1. View all logs:
     ```bash
     journalctl
     ```
  2. View logs for a specific unit:
     ```bash
     journalctl -u sshd.service
     ```

### **11.2 `dmesg` - Print Kernel Ring Buffer Messages**

Displays messages from the kernel.

- **Examples:**
  1. View kernel messages:
     ```bash
     dmesg
     ```
  2. Follow new messages:
     ```bash
     dmesg -w
     ```

---

## 12. Scheduling Tasks

### **12.1 `crontab` - Schedule Repetitive Tasks**

Schedules commands or scripts to run at specified times.

- **Examples:**
  1. Edit the current user's crontab:
     ```bash
     crontab -e
     ```
  2. List current cron jobs:
     ```bash
     crontab -l
     ```

- **Sample Cron Entries:**
  1. Run a script every day at 5 AM:
     ```
     0 5 * * * /home/user/backup.sh
     ```
  2. Run a command every Monday at 10 PM:
     ```
     0 22 * * 1 /usr/bin/weekly_report
     ```

---

## 13. File Archiving and Compression

### **13.1 `tar` - Archive Utility**

Creates and manipulates tar archives.

- **Examples:**
  1. Create a tar archive:
     ```bash
     tar -cvf archive.tar /path/to/directory
     ```
  2. Extract a tar archive:
     ```bash
     tar -xvf archive.tar
     ```

### **13.2 `gzip` and `gunzip` - Compress and Decompress Files**

- **Examples:**
  1. Compress a file:
     ```bash
     gzip file.txt
     ```
  2. Decompress a file:
     ```bash
     gunzip file.txt.gz
     ```

---

## 14. SELinux Management

### **14.1 `getenforce` and `setenforce` - Get and Set SELinux Mode**

- **Examples:**
  1. Check current SELinux mode:
     ```bash
     getenforce
     ```
  2. Set SELinux to permissive mode:
     ```bash
     setenforce 0
     ```

### **14.2 `sestatus` - SELinux Status**

Displays SELinux status and configuration.

- **Example:**
  ```bash
  sestatus
  ```

---

## 15. Miscellaneous Commands

### **15.1 `sudo` - Execute Commands as Another User**

- **Examples:**
  1. Run a command as root:
     ```bash
     sudo yum update
     ```
  2. Edit the sudoers file (as root):
     ```bash
     visudo
     ```

### **15.2 `man` - Display Manual Pages**

Provides detailed documentation for commands.

- **Examples:**
  1. View the manual for `ls`:
     ```bash
     man ls
     ```
  2. Search manual pages for a keyword:
     ```bash
     man -k "network"
     ```

### **15.3 `echo` - Display a Line of Text**

- **Examples:**
  1. Display a message:
     ```bash
     echo "Hello, World!"
     ```
  2. Append text to a file:
     ```bash
     echo "New line" >> file.txt
     ```

---

## Tips for the RHCSA Exam

- **Practice:** Set up a virtual machine with RHEL and practice these commands.
- **Understand Concepts:** Know not just the commands but also how they interact with the system.
- **Time Management:** The exam is timed, so be efficient in performing tasks.
- **Read Questions Carefully:** Ensure you understand what is being asked before starting.

---

By familiarizing yourself with these commands and their options, you'll be well-prepared for the RHCSA exam. Good luck!