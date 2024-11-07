# Essential Linux Commands for the RHCSA Exam

This document lists the most important Linux commands covered in the study guide, serving as a quick reference or legend. These commands are essential for system administration tasks and are likely to be crucial for the RHCSA exam.

---

`sudo` - Execute commands as another user, typically the superuser (root).
```bash
sudo [options] [command]
```

`man` - Display the manual pages for commands, providing detailed documentation.
```bash
man [options] [command]
```

`info` - Read detailed Info documents for commands, often with more in-depth information than `man`.
```bash
info [options] [command]
```

`ls` - List directory contents.
```bash
ls [options] [files]
```

`cd` - Change the current working directory.
```bash
cd [directory]
```

`pwd` - Print the current working directory.
```bash
pwd
```

`mkdir` - Create directories.
```bash
mkdir [options] directory_name
```

`cp` - Copy files and directories.
```bash
cp [options] source destination
```

`mv` - Move or rename files and directories.
```bash
mv [options] source destination
```

`rm` - Remove files or directories.
```bash
rm [options] file
```

`touch` - Change file timestamps or create empty files.
```bash
touch [options] file
```

`cat` - Concatenate and display file contents.
```bash
cat [options] [file...]
```

`less` - View file contents one screen at a time.
```bash
less [file]
```

`tail` - Output the last part of files.
```bash
tail [options] [file]
```

`head` - Output the first part of files.
```bash
head [options] [file]
```

`grep` - Search text using patterns.
```bash
grep [options] pattern [file...]
```

`find` - Search for files in a directory hierarchy.
```bash
find [path] [options] [expression]
```

`tar` - Archive files into a tarball.
```bash
tar [options] [archive-file] [file or directory]
```

`gzip` / `gunzip` - Compress or decompress files using gzip.
```bash
gzip [options] file
gunzip [options] file.gz
```

`bzip2` / `bunzip2` - Compress or decompress files using bzip2.
```bash
bzip2 [options] file
bunzip2 [options] file.bz2
```

`systemctl` - Control the systemd system and service manager.
```bash
systemctl [command] [unit]
```

`journalctl` - Query the systemd journal logs.
```bash
journalctl [options]
```

`firewall-cmd` - Configure and manage the firewalld firewall.
```bash
firewall-cmd [options]
```

`crontab` - Schedule repetitive tasks with cron.
```bash
crontab [options]
```

`at` - Schedule one-time tasks.
```bash
at [options] time
```

`useradd` - Create a new user or update default new user information.
```bash
useradd [options] username
```

`usermod` - Modify a user account.
```bash
usermod [options] username
```

`groupadd` - Create a new group.
```bash
groupadd [options] groupname
```

`passwd` - Change a user's password.
```bash
passwd [options] [username]
```

`chmod` - Change file mode (permissions).
```bash
chmod [options] mode file
```

`chown` - Change file owner and group.
```bash
chown [options] owner[:group] file
```

`ps` - Report a snapshot of current processes.
```bash
ps [options]
```

`top` - Display Linux processes in real-time.
```bash
top
```

`htop` - An interactive process viewer, an enhanced version of `top`.
```bash
htop
```

`free` - Display memory usage.
```bash
free [options]
```

`df` - Report file system disk space usage.
```bash
df [options] [file]
```

`du` - Estimate file space usage.
```bash
du [options] [file]
```

`yum` / `dnf` - Package manager for installing, updating, and removing packages.
```bash
yum [options] [command]
dnf [options] [command]
```

`getenforce` - Get the current SELinux mode.
```bash
getenforce
```

`setenforce` - Set SELinux enforcing mode.
```bash
setenforce [Enforcing|Permissive|1|0]
```

`sestatus` - Display SELinux status and configuration.
```bash
sestatus
```

`chcon` - Change file SELinux security context.
```bash
chcon [options] context file
```

`restorecon` - Restore default SELinux context.
```bash
restorecon [options] file
```

`semanage` - Manage SELinux policy components.
```bash
semanage [options] object
```

`setsebool` - Set SELinux boolean values.
```bash
setsebool [options] boolean [on|off]
```

`ifconfig` / `ip` - Configure network interfaces.
```bash
ifconfig [interface] [options]
ip [options]
```

`hostname` - Show or set the system's host name.
```bash
hostname [options] [name]
```

`ping` - Send ICMP ECHO_REQUEST packets to network hosts.
```bash
ping [options] host
```

`ssh` - OpenSSH SSH client (remote login program).
```bash
ssh [options] [user@]hostname
```

`scp` - Secure copy files between hosts on a network.
```bash
scp [options] source destination
```

`su` - Switch user identity.
```bash
su [options] [user]
```

`echo` - Display a line of text.
```bash
echo [options] [string]
```

`alias` - Create an alias for a command.
```bash
alias name='command'
```

`history` - Display or manipulate the shell command history.
```bash
history [options]
```

`which` - Locate a command.
```bash
which [command]
```

`whereis` - Locate the binary, source, and manual page files for a command.
```bash
whereis [options] command
```

---

These commands represent the core tools and utilities essential for system administration tasks and are likely to be important for the RHCSA exam. Familiarity with their usage, options, and common applications will aid in effective system management and exam preparation.