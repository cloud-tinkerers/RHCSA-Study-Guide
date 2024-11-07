## System Services with Possible Exam Tasks

As requested, I've expanded the **System Services** section to include between five and ten of the top options for each command, along with at least five examples of usage. I've also added a "Possible Exam Tasks" subsection for each command, which includes tasks that may involve using one or more commands together to achieve a specific goal, similar to what might be encountered on the RHCSA exam. The answers are provided after the questions in collapsible sections.

---

## 8. System Services

### **8.1 `systemctl` - Control the System and Service Manager**

`systemctl` is the primary tool to manage systemd services, units, and the system state.

- **Common Options and Commands:**
  - `start [UNIT]`: Start (activate) a unit immediately.
  - `stop [UNIT]`: Stop (deactivate) a unit immediately.
  - `restart [UNIT]`: Restart a unit.
  - `reload [UNIT]`: Reload the configuration of a unit without stopping it.
  - `enable [UNIT]`: Enable a unit to be started at boot time.
  - `disable [UNIT]`: Disable a unit from starting at boot time.
  - `status [UNIT]`: Show runtime status information about a unit.
  - `is-active [UNIT]`: Check if a unit is active.
  - `is-enabled [UNIT]`: Check if a unit is enabled.
  - `daemon-reload`: Reload systemd manager configuration.
  - `list-units`: List loaded units.
  - `list-unit-files`: List installed unit files.
  - `mask [UNIT]`: Completely disable a unit by linking it to /dev/null.
  - `unmask [UNIT]`: Unmask a unit.

- **Examples:**
  1. **Start the `sshd` service:**
     ```bash
     systemctl start sshd
     ```
  2. **Enable `sshd` to start on boot:**
     ```bash
     systemctl enable sshd
     ```
  3. **Check the status of `firewalld`:**
     ```bash
     systemctl status firewalld
     ```
  4. **Restart the `httpd` service:**
     ```bash
     systemctl restart httpd
     ```
  5. **Reload the `nginx` service configuration:**
     ```bash
     systemctl reload nginx
     ```
  6. **Disable the `bluetooth` service from starting on boot:**
     ```bash
     systemctl disable bluetooth
     ```
  7. **Check if `crond` service is active:**
     ```bash
     systemctl is-active crond
     ```
  8. **List all loaded units:**
     ```bash
     systemctl list-units
     ```
  9. **Reload systemd manager configuration after creating a new unit file:**
     ```bash
     systemctl daemon-reload
     ```
  10. **Mask a service to prevent it from being started:**
      ```bash
      systemctl mask httpd
      ```
  11. **Unmask a previously masked service:**
      ```bash
      systemctl unmask httpd
      ```
  12. **List all installed unit files:**
      ```bash
      systemctl list-unit-files
      ```

#### **Possible Exam Tasks:**

1. **Task:** Start the `httpd` service and enable it to start on boot.

2. **Task:** Stop the `firewalld` service and prevent it from starting on boot.

3. **Task:** Reload the configuration of the `sshd` service without interrupting existing connections.

4. **Task:** Verify if the `crond` service is active and enabled.

5. **Task:** List all services that are currently failed.

6. **Task:** Mask the `postfix` service to prevent it from being started manually or automatically.

<details>
<summary><strong>Answers:</strong></summary>

1. **Answer:**
   ```bash
   systemctl start httpd
   systemctl enable httpd
   ```
2. **Answer:**
   ```bash
   systemctl stop firewalld
   systemctl disable firewalld
   ```
3. **Answer:**
   ```bash
   systemctl reload sshd
   ```
4. **Answer:**
   ```bash
   systemctl is-active crond
   systemctl is-enabled crond
   ```
5. **Answer:**
   ```bash
   systemctl --failed
   ```
6. **Answer:**
   ```bash
   systemctl mask postfix
   ```

</details>

---

### **8.2 `journalctl` - Query the systemd Journal**

`journalctl` is used for querying and displaying logs from journald, the systemd logging service.

- **Common Options:**
  - `-u [UNIT]`: Show logs for a specific unit.
  - `-f`: Follow the journal (like `tail -f`).
  - `-b`: Show logs from the current boot.
  - `-k`: Show only kernel messages.
  - `--since [TIME]`: Show logs since a certain time.
  - `--until [TIME]`: Show logs up to a certain time.
  - `-p [PRIORITY]`: Show messages of specified priority.
  - `-n [NUMBER]`: Show the last NUMBER lines.
  - `--no-pager`: Do not use the pager.
  - `--disk-usage`: Show journal disk usage.
  - `--vacuum-size=[SIZE]`: Reduce disk usage to SIZE.
  - `--vacuum-time=[TIME]`: Remove journal files older than TIME.
  - `-o [FORMAT]`: Change the output format (e.g., `short`, `json`, `cat`).

- **Examples:**
  1. **Show all logs since last boot:**
     ```bash
     journalctl -b
     ```
  2. **Follow logs in real-time:**
     ```bash
     journalctl -f
     ```
  3. **Show logs for the `sshd` service:**
     ```bash
     journalctl -u sshd
     ```
  4. **Show logs since yesterday:**
     ```bash
     journalctl --since yesterday
     ```
  5. **Show logs between two dates:**
     ```bash
     journalctl --since "2023-01-01 00:00:00" --until "2023-01-01 23:59:59"
     ```
  6. **Show only error and higher priority logs:**
     ```bash
     journalctl -p err
     ```
  7. **Show kernel messages:**
     ```bash
     journalctl -k
     ```
  8. **Show the last 50 log entries:**
     ```bash
     journalctl -n 50
     ```
  9. **Check journal disk usage:**
     ```bash
     journalctl --disk-usage
     ```
  10. **Clear journal logs older than 2 weeks:**
      ```bash
      sudo journalctl --vacuum-time=2weeks
      ```

#### **Possible Exam Tasks:**

1. **Task:** View the logs for the `httpd` service.

2. **Task:** Follow the system journal in real-time.

3. **Task:** Display only critical and higher priority logs since the last boot.

4. **Task:** Show kernel messages from the current boot.

5. **Task:** Clean up journal logs to reduce disk usage to below 500M.

<details>
<summary><strong>Answers:</strong></summary>

1. **Answer:**
   ```bash
   journalctl -u httpd
   ```
2. **Answer:**
   ```bash
   journalctl -f
   ```
3. **Answer:**
   ```bash
   journalctl -b -p crit
   ```
4. **Answer:**
   ```bash
   journalctl -k -b
   ```
5. **Answer:**
   ```bash
   sudo journalctl --vacuum-size=500M
   ```

</details>

---

### **8.3 `systemd-analyze` - Analyze System Boot-up Performance**

Used to determine the time taken by the kernel, initrd, and userspace during boot.

- **Common Commands:**
  - `systemd-analyze time`: Show overall system boot time.
  - `systemd-analyze blame`: List units ordered by time to initialize.
  - `systemd-analyze critical-chain`: Show time-critical chain of units.
  - `systemd-analyze plot > boot.svg`: Generate an SVG graphical summary.
  - `systemd-analyze verify [UNIT]`: Check unit files for errors.
  - `systemd-analyze dot > systemd.dot`: Generate a dependency graph.

- **Examples:**
  1. **Show overall system boot time:**
     ```bash
     systemd-analyze time
     ```
  2. **List units ordered by time to initialize:**
     ```bash
     systemd-analyze blame
     ```
  3. **Show time-critical chain of units:**
     ```bash
     systemd-analyze critical-chain
     ```
  4. **Generate an SVG plot of boot sequence:**
     ```bash
     systemd-analyze plot > boot.svg
     ```
  5. **Verify unit files for errors:**
     ```bash
     systemd-analyze verify myservice.service
     ```

#### **Possible Exam Tasks:**

1. **Task:** Display the total time taken for the system to boot.

2. **Task:** List systemd units in order of time taken to initialize.

3. **Task:** Generate an SVG file showing the boot sequence.

<details>
<summary><strong>Answers:</strong></summary>

1. **Answer:**
   ```bash
   systemd-analyze time
   ```
2. **Answer:**
   ```bash
   systemd-analyze blame
   ```
3. **Answer:**
   ```bash
   systemd-analyze plot > boot.svg
   ```

</details>

---

### **8.4 Creating and Managing systemd Unit Files**

#### **8.4.1 Creating a Custom Service**

- **Unit File Location:**
  - System-wide unit files: `/usr/lib/systemd/system/`
  - Custom unit files: `/etc/systemd/system/`

- **Unit File Structure:**
  - `[Unit]`: General information about the unit.
  - `[Service]`: Service-specific parameters.
  - `[Install]`: Installation parameters for `systemctl enable`.

- **Example Custom Service (`/etc/systemd/system/myservice.service`):**

```ini
  [Unit]
  Description=My Custom Service
  After=network.target

  [Service]
  ExecStart=/usr/local/bin/myapp
  Restart=on-failure

  [Install]
  WantedBy=multi-user.target
```

- **Steps to Create and Enable a Custom Service:**

  1. Create the unit file in `/etc/systemd/system/`.
  2. Reload systemd manager configuration:
     ```bash
     systemctl daemon-reload
     ```
  3. Start the service:
     ```bash
     systemctl start myservice
     ```
  4. Enable the service to start on boot:
     ```bash
     systemctl enable myservice
     ```

#### **Possible Exam Tasks:**

1. **Task:** Create a systemd service called `myapp` that runs `/usr/local/bin/myapp` on startup.

2. **Task:** Reload systemd configuration and start the `myapp` service.

<details>
<summary><strong>Answers:</strong></summary>

1. **Answer:**

   Create `/etc/systemd/system/myapp.service` with the following content:

   ```ini
   [Unit]
   Description=MyApp Service
   After=network.target

   [Service]
   ExecStart=/usr/local/bin/myapp
   Restart=on-failure

   [Install]
   WantedBy=multi-user.target
   ```

2. **Answer:**

   ```bash
   systemctl daemon-reload
   systemctl start myapp
   systemctl enable myapp
   ```

</details>

---

### **8.5 Managing Service Dependencies and Targets**

- **Targets:**
  - Targets are similar to runlevels in SysV init.
  - Common targets include:
    - `graphical.target`: Multi-user system with GUI.
    - `multi-user.target`: Multi-user system without GUI.
    - `rescue.target`: Single-user mode with basic services.

- **Changing the Default Target:**
  ```bash
  systemctl set-default multi-user.target
  ```

- **Switching to a Different Target:**
  ```bash
  systemctl isolate rescue.target
  ```

- **Listing Available Targets:**
  ```bash
  systemctl list-unit-files --type=target
  ```

#### **Possible Exam Tasks:**

1. **Task:** Change the default system target to multi-user mode.

2. **Task:** Switch the current system to rescue mode.

3. **Task:** List all available system targets.

<details>
<summary><strong>Answers:</strong></summary>

1. **Answer:**
   ```bash
   systemctl set-default multi-user.target
   ```
2. **Answer:**
   ```bash
   systemctl isolate rescue.target
   ```
3. **Answer:**
   ```bash
   systemctl list-unit-files --type=target
   ```

</details>

---

### **8.6 Managing System State with `systemctl`**

- **Power Management Commands:**
  - Reboot the system:
    ```bash
    systemctl reboot
    ```
  - Shut down the system:
    ```bash
    systemctl poweroff
    ```
  - Suspend the system:
    ```bash
    systemctl suspend
    ```
  - Hibernate the system:
    ```bash
    systemctl hibernate
    ```
  - Hybrid-sleep (suspend to RAM and disk):
    ```bash
    systemctl hybrid-sleep
    ```

#### **Possible Exam Tasks:**

1. **Task:** Reboot the system using `systemctl`.

2. **Task:** Shut down the system using `systemctl`.

<details>
<summary><strong>Answers:</strong></summary>

1. **Answer:**
   ```bash
   systemctl reboot
   ```
2. **Answer:**
   ```bash
   systemctl poweroff
   ```

</details>

---

### **8.7 Understanding systemd Units**

- **Types of Units:**
  - **Service Units (`.service`):** Define how to start and manage services.
  - **Socket Units (`.socket`):** Define socket activation.
  - **Device Units (`.device`):** Represent devices in the system.
  - **Mount Units (`.mount`):** Control mount points.
  - **Automount Units (`.automount`):** Automount functionality.
  - **Swap Units (`.swap`):** Define swap devices.
  - **Target Units (`.target`):** Group other units.
  - **Timer Units (`.timer`):** Schedule service activation.
  - **Path Units (`.path`):** Monitor file system paths.
  - **Slice Units (`.slice`):** Organize processes in a hierarchy.
  - **Scope Units (`.scope`):** External processes started by something other than systemd.

- **Listing Units by Type:**
  ```bash
  systemctl list-units --type=service
  ```

#### **Possible Exam Tasks:**

1. **Task:** List all active service units.

2. **Task:** Explain what a `.target` unit is in systemd.

<details>
<summary><strong>Answers:</strong></summary>

1. **Answer:**
   ```bash
   systemctl list-units --type=service
   ```
2. **Answer:**

   A `.target` unit in systemd is used to group other units together. Targets are used to start or stop multiple services at once, similar to runlevels in the traditional init system.

</details>

---

## Tips for System Services Management on the RHCSA Exam

- **Using `systemctl`:**
  - Be comfortable starting, stopping, restarting, enabling, and disabling services.
  - Know how to check the status of services and whether they are enabled at boot.

- **Analyzing Logs with `journalctl`:**
  - Understand how to filter logs by service, time, and priority.
  - Know how to follow logs in real-time and how to manage journal size.

- **Creating and Managing Unit Files:**
  - Be able to create custom service unit files.
  - Understand the structure of unit files and common directives.

- **System Targets and Runlevels:**
  - Know how to change the default system target.
  - Be familiar with different system targets and their purposes.

- **Power Management:**
  - Use `systemctl` commands to reboot, shut down, or change the system state.

- **Exam Strategy:**
  - Pay attention to whether the question specifies using a particular tool.
  - Practice common tasks to ensure efficiency during the exam.

---

By expanding the System Services section with additional options, examples, and possible exam tasks, you can deepen your understanding of these essential commands for the RHCSA exam.