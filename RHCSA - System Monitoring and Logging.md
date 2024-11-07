## System Monitoring and Logs with Possible Exam Tasks

Thank you for bringing this up. While we have covered `journalctl` in the System Services section, there are several other important tools and commands related to system monitoring and logging that are essential for the RHCSA exam. Expanding the **System Monitoring and Logs** section will help you gain a comprehensive understanding of these tools.

---

## 11. System Monitoring and Logs

### **11.1 `journalctl` - Query the Systemd Journal**

`journalctl` is used for querying and displaying logs from `journald`, the systemd logging service.

- **Common Options:**
  - `-u [UNIT]`: Show logs for a specific unit.
  - `-f`: Follow the journal (like `tail -f`).
  - `-b`: Show logs from the current boot.
  - `--since [TIME]`: Show logs since a certain time.
  - `--until [TIME]`: Show logs up to a certain time.
  - `-p [PRIORITY]`: Show messages of specified priority.
  - `-n [NUMBER]`: Show the last NUMBER lines.
  - `-k`: Show only kernel messages.
  - `--no-pager`: Do not use the pager.
  - `--disk-usage`: Show journal disk usage.
  - `--vacuum-size=[SIZE]`: Reduce disk usage to SIZE.
  - `--vacuum-time=[TIME]`: Remove journal files older than TIME.
  - `-o [FORMAT]`: Change the output format (e.g., `short`, `json`, `cat`).

- **Examples:**
  1. **View all logs:**
     ```bash
     journalctl
     ```
  2. **View logs for a specific unit (`sshd`):**
     ```bash
     journalctl -u sshd.service
     ```
  3. **Follow logs in real-time:**
     ```bash
     journalctl -f
     ```
  4. **Show logs since yesterday:**
     ```bash
     journalctl --since yesterday
     ```
  5. **Show kernel messages:**
     ```bash
     journalctl -k
     ```
  6. **Display the last 100 log entries:**
     ```bash
     journalctl -n 100
     ```
  7. **Show logs of priority `error` and higher:**
     ```bash
     journalctl -p err
     ```
  8. **Display logs between two dates:**
     ```bash
     journalctl --since "2023-01-01 00:00:00" --until "2023-01-02 00:00:00"
     ```
  9. **Check journal disk usage:**
     ```bash
     journalctl --disk-usage
     ```
  10. **Vacuum logs older than 7 days:**
      ```bash
      sudo journalctl --vacuum-time=7d
      ```

#### **Possible Exam Tasks:**

1. **Task:** View the logs of the `cron` service since the last boot.

2. **Task:** Follow the system journal in real-time, displaying new log entries as they appear.

3. **Task:** Display only warning and higher priority logs.

4. **Task:** Check how much disk space the journal is currently using.

<details>
<summary><strong>Answers:</strong></summary>

1. **Answer:**
   ```bash
   journalctl -u cron -b
   ```
2. **Answer:**
   ```bash
   journalctl -f
   ```
3. **Answer:**
   ```bash
   journalctl -p warning
   ```
4. **Answer:**
   ```bash
   journalctl --disk-usage
   ```

</details>

---

### **11.2 `dmesg` - Print Kernel Ring Buffer Messages**

`dmesg` displays messages from the kernel ring buffer. It's useful for troubleshooting hardware and driver issues.

- **Common Options:**
  - `-H` or `--human`: Enable human-readable output.
  - `-w` or `--follow`: Wait for new messages (like `tail -f`).
  - `-C` or `--clear`: Clear the ring buffer.
  - `-L` or `--color`: Colorize the output.
  - `-T` or `--ctime`: Show human-readable timestamps.
  - `-k` or `--kernel`: Only display kernel messages.
  - `-s [BUFFER_SIZE]`: Set buffer size.

- **Examples:**
  1. **View kernel messages:**
     ```bash
     dmesg
     ```
  2. **Follow new kernel messages in real-time:**
     ```bash
     dmesg -w
     ```
  3. **Display messages with human-readable timestamps:**
     ```bash
     dmesg -T
     ```
  4. **Clear the kernel ring buffer:**
     ```bash
     sudo dmesg -C
     ```
  5. **Display messages with colorized output:**
     ```bash
     dmesg -L
     ```
  6. **Display messages with human-readable output and color:**
     ```bash
     dmesg -H
     ```
  7. **Filter messages for a specific driver (e.g., `eth0`):**
     ```bash
     dmesg | grep eth0
     ```
  8. **Display only kernel messages:**
     ```bash
     dmesg -k
     ```
  9. **Set buffer size to 1MB:**
     ```bash
     dmesg -s 1048576
     ```
  10. **Redirect output to a file:**
      ```bash
      dmesg > kernel.log
      ```

#### **Possible Exam Tasks:**

1. **Task:** View kernel messages with human-readable timestamps.

2. **Task:** Clear the kernel ring buffer.

3. **Task:** Monitor kernel messages in real-time.

4. **Task:** Filter kernel messages for USB devices.

<details>
<summary><strong>Answers:</strong></summary>

1. **Answer:**
   ```bash
   dmesg -T
   ```
2. **Answer:**
   ```bash
   sudo dmesg -C
   ```
3. **Answer:**
   ```bash
   dmesg -w
   ```
4. **Answer:**
   ```bash
   dmesg | grep -i usb
   ```

</details>

---

### **11.3 `top` - Real-Time System Monitoring**

`top` provides a real-time, dynamic view of the system's running processes, including CPU and memory usage.

- **Common Keyboard Commands:**
  - `h`: Display help.
  - `q`: Quit `top`.
  - `k`: Kill a process.
  - `r`: Renice a process.
  - `P`: Sort by CPU usage.
  - `M`: Sort by memory usage.
  - `N`: Sort by PID.
  - `T`: Sort by time.
  - `u [USERNAME]`: Show processes for a user.
  - `s [SECONDS]`: Set update interval.

- **Examples:**
  1. **Start `top`:**
     ```bash
     top
     ```
  2. **Start `top` sorted by memory usage:**
     ```bash
     top -o %MEM
     ```
  3. **Start `top` showing processes of a specific user:**
     ```bash
     top -u username
     ```
  4. **Change update interval to 5 seconds:**
     - Press `s` then `5` while `top` is running.
  5. **Kill a process:**
     - Press `k`, enter the PID, and confirm.
  6. **Search for a process:**
     - Press `/`, type the process name, and press Enter.
  7. **Display thread information:**
     - Press `H` while `top` is running.
  8. **Toggle color mode:**
     - Press `z`.

#### **Possible Exam Tasks:**

1. **Task:** Use `top` to display processes sorted by memory usage.

2. **Task:** In `top`, kill a process with PID `1234`.

3. **Task:** Start `top` showing only processes for user `bob`.

4. **Task:** Change the update interval of `top` to 2 seconds.

<details>
<summary><strong>Answers:</strong></summary>

1. **Answer:**
   - Start `top` and press `M`, or start with:
     ```bash
     top -o %MEM
     ```
2. **Answer:**
   - While `top` is running, press `k`, enter `1234`, and confirm.
3. **Answer:**
   ```bash
   top -u bob
   ```
4. **Answer:**
   - While `top` is running, press `s`, then enter `2`, and press Enter.

</details>

---

### **11.4 `htop` - Enhanced Top**

`htop` is an interactive process viewer with an improved interface compared to `top`.

- **Features:**
  - Colorful and customizable interface.
  - Mouse support.
  - Vertical and horizontal scrolling.
  - Display of CPU, memory, and swap usage.
  - Ability to kill multiple processes.

- **Examples:**
  1. **Start `htop`:**
     ```bash
     htop
     ```
  2. **Search for a process:**
     - Press `/`, type the process name, and press Enter.
  3. **Kill a process:**
     - Select the process with arrow keys and press `F9`.
  4. **Sort processes:**
     - Press `F6` and choose a sorting field.
  5. **Toggle tree view:**
     - Press `F5`.

#### **Possible Exam Tasks:**

*Note: `htop` may not be installed by default; you may need to install it using `yum install htop`.*

1. **Task:** Install `htop` and start it.

2. **Task:** Use `htop` to find and kill a process named `myapp`.

<details>
<summary><strong>Answers:</strong></summary>

1. **Answer:**
   ```bash
   sudo yum install htop
   htop
   ```
2. **Answer:**
   - Start `htop`, press `/`, type `myapp`, press Enter.
   - Select the process and press `F9` to kill.

</details>

---

### **11.5 `ps` - Process Status**

Displays information about active processes.

- **Common Options:**
  - `-e`: Select all processes.
  - `-f`: Full-format listing.
  - `-u [USER]`: Show processes for a user.
  - `-a`: Select all processes except session leaders.
  - `-x`: Include processes without a controlling terminal.
  - `-o [FORMAT]`: Specify output format.
  - `-p [PID]`: Select processes by PID.
  - `--sort [KEY]`: Sort output by key.

- **Examples:**
  1. **List all processes:**
     ```bash
     ps -e
     ```
  2. **Full-format listing of all processes:**
     ```bash
     ps -ef
     ```
  3. **List processes for a specific user:**
     ```bash
     ps -u username
     ```
  4. **List all processes in a tree format:**
     ```bash
     ps -ef --forest
     ```
  5. **Display specific columns:**
     ```bash
     ps -e -o pid,cmd,%mem,%cpu
     ```
  6. **Find processes by name:**
     ```bash
     ps -ef | grep sshd
     ```
  7. **Sort processes by memory usage:**
     ```bash
     ps -e --sort -%mem
     ```
  8. **List processes without controlling terminals:**
     ```bash
     ps -x
     ```

#### **Possible Exam Tasks:**

1. **Task:** List all processes in full-format listing.

2. **Task:** Find all processes named `httpd`.

3. **Task:** Display processes sorted by CPU usage.

4. **Task:** Show processes for user `alice`.

<details>
<summary><strong>Answers:</strong></summary>

1. **Answer:**
   ```bash
   ps -ef
   ```
2. **Answer:**
   ```bash
   ps -ef | grep httpd
   ```
3. **Answer:**
   ```bash
   ps -e --sort -%cpu
   ```
4. **Answer:**
   ```bash
   ps -u alice
   ```

</details>

---

### **11.6 `free` - Display Memory Usage**

Displays the amount of free and used memory in the system.

- **Common Options:**
  - `-h`: Human-readable format.
  - `-m`: Display in megabytes.
  - `-g`: Display in gigabytes.
  - `-b`: Display in bytes.
  - `-k`: Display in kilobytes.
  - `-t`: Show total of all columns.
  - `-s [DELAY]`: Continuously display memory status at intervals.

- **Examples:**
  1. **Display memory usage in human-readable format:**
     ```bash
     free -h
     ```
  2. **Display memory usage in megabytes:**
     ```bash
     free -m
     ```
  3. **Show total memory columns:**
     ```bash
     free -t
     ```
  4. **Continuously display memory usage every 2 seconds:**
     ```bash
     free -h -s 2
     ```
  5. **Display memory usage in gigabytes:**
     ```bash
     free -g
     ```

#### **Possible Exam Tasks:**

1. **Task:** Display memory usage in human-readable format.

2. **Task:** Show memory usage every 5 seconds.

<details>
<summary><strong>Answers:</strong></summary>

1. **Answer:**
   ```bash
   free -h
   ```
2. **Answer:**
   ```bash
   free -h -s 5
   ```

</details>

---

### **11.7 `vmstat` - Report Virtual Memory Statistics**

Provides information about processes, memory, paging, block IO, traps, and CPU activity.

- **Common Options:**
  - `[DELAY]`: Update every [DELAY] seconds.
  - `-a`: Display active and inactive memory.
  - `-s`: Display event counters and memory statistics.
  - `-d`: Display disk statistics.
  - `-t`: Add timestamp to the output.
  - `-S [UNIT]`: Display units (e.g., `M` for megabytes).

- **Examples:**
  1. **Display a one-time report:**
     ```bash
     vmstat
     ```
  2. **Update every 2 seconds:**
     ```bash
     vmstat 2
     ```
  3. **Display memory statistics:**
     ```bash
     vmstat -s
     ```
  4. **Display disk statistics:**
     ```bash
     vmstat -d
     ```
  5. **Include timestamp in output:**
     ```bash
     vmstat -t
     ```
  6. **Display in megabytes:**
     ```bash
     vmstat -S M
     ```

#### **Possible Exam Tasks:**

1. **Task:** Display virtual memory statistics every 5 seconds.

2. **Task:** Show a one-time report with timestamps.

3. **Task:** Display memory statistics in megabytes.

<details>
<summary><strong>Answers:</strong></summary>

1. **Answer:**
   ```bash
   vmstat 5
   ```
2. **Answer:**
   ```bash
   vmstat -t
   ```
3. **Answer:**
   ```bash
   vmstat -S M
   ```

</details>

---

### **11.8 `iostat` - Report CPU and Disk I/O Statistics**

Monitors system input/output device loading.

- **Common Options:**
  - `[DELAY]`: Update every [DELAY] seconds.
  - `-c`: Display CPU statistics.
  - `-d`: Display disk statistics.
  - `-x`: Display extended statistics.
  - `-k`: Display statistics in kilobytes per second.
  - `-m`: Display statistics in megabytes per second.
  - `-p [DEVICE]`: Report statistics for a device or partition.

- **Examples:**
  1. **Display CPU and disk I/O statistics:**
     ```bash
     iostat
     ```
  2. **Update every 3 seconds:**
     ```bash
     iostat 3
     ```
  3. **Display extended statistics:**
     ```bash
     iostat -x
     ```
  4. **Display statistics in megabytes per second:**
     ```bash
     iostat -m
     ```
  5. **Display statistics for a specific device:**
     ```bash
     iostat -p sda
     ```

#### **Possible Exam Tasks:**

1. **Task:** Display disk I/O statistics every 2 seconds.

2. **Task:** Show extended statistics for all devices.

<details>
<summary><strong>Answers:</strong></summary>

1. **Answer:**
   ```bash
   iostat -d 2
   ```
2. **Answer:**
   ```bash
   iostat -x
   ```

</details>

---

### **11.9 `sar` - System Activity Reporter**

Collects, reports, and saves system activity information.

- **Common Options:**
  - `-u`: Report CPU utilization.
  - `-r`: Report memory usage.
  - `-d`: Report disk activity.
  - `-n [SUB_OPTION]`: Report network statistics (e.g., `DEV`, `EDEV`).
  - `-f [FILE]`: Read data from a file.
  - `-s [TIME]`: Start time.
  - `-e [TIME]`: End time.
  - `-o [FILE]`: Save data to a file.
  - `[INTERVAL] [COUNT]`: Collect data every [INTERVAL] seconds, [COUNT] times.

- **Examples:**
  1. **Report CPU utilization:**
     ```bash
     sar -u 1 3
     ```
  2. **Report memory usage:**
     ```bash
     sar -r 1 3
     ```
  3. **Report network statistics:**
     ```bash
     sar -n DEV 1 3
     ```
  4. **Save data to a file:**
     ```bash
     sar -o datafile -u 1 3
     ```
  5. **Read data from a file:**
     ```bash
     sar -f datafile
     ```
  6. **Report disk activity:**
     ```bash
     sar -d 1 3
     ```

#### **Possible Exam Tasks:**

1. **Task:** Collect CPU utilization data every second for 5 times.

2. **Task:** Report memory usage over a period.

<details>
<summary><strong>Answers:</strong></summary>

1. **Answer:**
   ```bash
   sar -u 1 5
   ```
2. **Answer:**
   ```bash
   sar -r 1 5
   ```

</details>

---

### **11.10 `tail` and `less` - Viewing Log Files**

#### **11.10.1 `tail` Command**

Displays the last part of files.

- **Common Options:**
  - `-f`: Follow the file (like `tail -f`).
  - `-n [NUMBER]`: Show the last [NUMBER] lines.
  - `-c [NUMBER]`: Output the last [NUMBER] bytes.

- **Examples:**
  1. **View the last 10 lines of a log file:**
     ```bash
     tail /var/log/messages
     ```
  2. **Follow the log file in real-time:**
     ```bash
     tail -f /var/log/messages
     ```
  3. **Show the last 50 lines:**
     ```bash
     tail -n 50 /var/log/messages
     ```
  4. **Follow multiple files:**
     ```bash
     tail -f /var/log/messages /var/log/secure
     ```

#### **11.10.2 `less` Command**

Allows backward and forward movement in a file.

- **Usage:**
  - Open a file with `less`:
    ```bash
    less /var/log/messages
    ```
  - **Common Keyboard Shortcuts:**
    - `Space`: Next page.
    - `b`: Previous page.
    - `/[PATTERN]`: Search forward.
    - `?[PATTERN]`: Search backward.
    - `n`: Next search result.
    - `N`: Previous search result.
    - `g`: Go to the beginning.
    - `G`: Go to the end.
    - `q`: Quit.

#### **Possible Exam Tasks:**

1. **Task:** View the last 20 lines of `/var/log/secure`.

2. **Task:** Follow `/var/log/messages` in real-time.

3. **Task:** Search for the word "error" in `/var/log/messages` using `less`.

<details>
<summary><strong>Answers:</strong></summary>

1. **Answer:**
   ```bash
   tail -n 20 /var/log/secure
   ```
2. **Answer:**
   ```bash
   tail -f /var/log/messages
   ```
3. **Answer:**
   ```bash
   less /var/log/messages
   ```
   - Then, within `less`, type `/error` and press Enter.

</details>

---

### **11.11 `logger` - Shell Command Interface to the Syslog System**

The `logger` command allows you to add entries to the system log (`/var/log/messages`).

- **Common Options:**
  - `-p [PRIORITY]`: Specify the message priority.
  - `-t [TAG]`: Mark each line added with the specified tag.
  - `-f [FILE]`: Log the contents of a file.
  - `-i`: Log the process ID.

- **Examples:**
  1. **Log a simple message:**
     ```bash
     logger "This is a test message."
     ```
  2. **Log a message with a specific tag:**
     ```bash
     logger -t MyScript "Script has completed."
     ```
  3. **Log a message with a priority of `warning`:**
     ```bash
     logger -p user.warning "Disk space is low."
     ```
  4. **Log the contents of a file:**
     ```bash
     logger -f /path/to/file
     ```
  5. **Include the process ID in the log:**
     ```bash
     logger -i "Process started."
     ```

#### **Possible Exam Tasks:**

1. **Task:** Log a message "Backup completed" with the tag `BackupScript`.

2. **Task:** Log a warning message "High memory usage detected".

<details>
<summary><strong>Answers:</strong></summary>

1. **Answer:**
   ```bash
   logger -t BackupScript "Backup completed"
   ```
2. **Answer:**
   ```bash
   logger -p user.warning "High memory usage detected"
   ```

</details>

---

### **11.12 `logrotate` - Rotate and Compress Log Files**

`logrotate` is used to manage log files, including rotating, compressing, and deleting old logs.

- **Configuration Files:**
  - Global configuration: `/etc/logrotate.conf`
  - Individual configurations: `/etc/logrotate.d/`

- **Common Directives:**
  - `daily`, `weekly`, `monthly`: Rotation frequency.
  - `rotate [COUNT]`: Number of rotations before deletion.
  - `compress`: Compress rotated logs.
  - `missingok`: Do not error if log file is missing.
  - `notifempty`: Do not rotate empty logs.
  - `copytruncate`: Truncate the original log file after creating a copy.
  - `postrotate`/`endscript`: Commands to execute after rotation.

- **Example Configuration:**

  ```conf
  /var/log/httpd/*.log {
      daily
      rotate 7
      compress
      missingok
      notifempty
      postrotate
          /bin/systemctl reload httpd.service > /dev/null 2>/dev/null || true
      endscript
  }
  ```

- **Examples:**
  1. **Force log rotation manually:**
     ```bash
     sudo logrotate -f /etc/logrotate.conf
     ```
  2. **Test configuration for errors:**
     ```bash
     sudo logrotate -d /etc/logrotate.conf
     ```
  3. **Rotate a specific log file:**
     ```bash
     sudo logrotate -f /etc/logrotate.d/nginx
     ```

#### **Possible Exam Tasks:**

1. **Task:** Configure `logrotate` to rotate `/var/log/myapp.log` weekly, keeping 4 rotations.

2. **Task:** Force rotation of logs as per the default configuration.

<details>
<summary><strong>Answers:</strong></summary>

1. **Answer:**

   Create `/etc/logrotate.d/myapp` with the following content:

   ```conf
   /var/log/myapp.log {
       weekly
       rotate 4
       compress
       missingok
       notifempty
   }
   ```

2. **Answer:**
   ```bash
   sudo logrotate -f /etc/logrotate.conf
   ```

</details>

---

## Tips for System Monitoring and Logs on the RHCSA Exam

- **Familiarize with Monitoring Tools:**
  - Know how to use `top`, `htop`, `ps`, `free`, `vmstat`, `iostat`, and `sar` to monitor system performance.
  - Be comfortable with filtering and sorting process lists.

- **Log Management:**
  - Understand how to view and analyze logs using `journalctl`, `dmesg`, `tail`, and `less`.
  - Know how to use `logger` to add entries to system logs.

- **System Logs and `journalctl`:**
  - Be proficient in querying system logs with `journalctl`, including filtering by time, service, and priority.
  - Know how to manage the size of the journal.

- **Process Management:**
  - Be able to find and terminate processes using `top`, `htop`, and `kill`.

- **Memory and CPU Usage:**
  - Use `free` to check memory usage.
  - Monitor CPU and memory usage of processes.

- **Log Rotation:**
  - Understand how `logrotate` works and how to configure it.
  - Be able to force log rotation and test configurations.

- **Exam Strategy:**
  - Practice using these commands to ensure efficiency during the exam.
  - Read questions carefully to determine which tool is appropriate for the task.

---

By expanding the System Monitoring and Logs section with additional commands, options, examples, and possible exam tasks, you can deepen your understanding of these essential tools and concepts for the RHCSA exam. Remember to practice using these commands in a real-world environment to become proficient and confident in your abilities.