## SELinux Management with Possible Exam Tasks

As requested, I've expanded the **SELinux Management** section to include between five and ten of the top options for each command, along with at least five examples of usage. I've also added a "Possible Exam Tasks" subsection for each command, which includes tasks that may involve using one or more commands together to achieve a specific goal, similar to what might be encountered on the RHCSA exam. The answers are provided after the questions in collapsible sections.

---

## 14. SELinux Management

Security-Enhanced Linux (SELinux) is a security architecture integrated into the kernel that provides mandatory access control. Understanding SELinux is crucial for the RHCSA exam.

### **14.1 `getenforce` and `setenforce` - Get and Set SELinux Mode**

- **`getenforce`**: Displays the current SELinux mode.
- **`setenforce`**: Sets the SELinux mode to enforcing or permissive.

#### **14.1.1 `getenforce` Command**

- **Usage:**
  ```bash
  getenforce
  ```
- **Output:**
  - `Enforcing`: SELinux is enforcing policies.
  - `Permissive`: SELinux logs actions that would have been denied.
  - `Disabled`: SELinux is turned off.

#### **14.1.2 `setenforce` Command**

- **Usage:**
  ```bash
  setenforce [Enforcing|Permissive|1|0]
  ```
- **Options:**
  - `Enforcing` or `1`: Set SELinux to enforcing mode.
  - `Permissive` or `0`: Set SELinux to permissive mode.

- **Note:** Changes made with `setenforce` are temporary and will be reset on reboot. To make changes persistent, you must edit the SELinux configuration file.

#### **Examples:**

1. **Check current SELinux mode:**
   ```bash
   getenforce
   ```
2. **Set SELinux to permissive mode (temporarily):**
   ```bash
   setenforce 0
   ```
   Or
   ```bash
   setenforce Permissive
   ```
3. **Set SELinux to enforcing mode (temporarily):**
   ```bash
   setenforce 1
   ```
   Or
   ```bash
   setenforce Enforcing
   ```
4. **Check if SELinux is enforcing:**
   ```bash
   if [ "$(getenforce)" = "Enforcing" ]; then echo "SELinux is enforcing"; fi
   ```
5. **Attempt to disable SELinux (not recommended and not possible with `setenforce`):**
   - **Note:** You cannot disable SELinux with `setenforce`; you must edit the configuration file and reboot.

#### **Possible Exam Tasks:**

1. **Task:** Check the current SELinux mode.

2. **Task:** Temporarily set SELinux to permissive mode.

3. **Task:** Set SELinux back to enforcing mode without rebooting.

4. **Task:** Write a command to verify if SELinux is in enforcing mode.

<details>
<summary><strong>Answers:</strong></summary>

1. **Answer:**
   ```bash
   getenforce
   ```
2. **Answer:**
   ```bash
   setenforce 0
   ```
   Or
   ```bash
   setenforce Permissive
   ```
3. **Answer:**
   ```bash
   setenforce 1
   ```
   Or
   ```bash
   setenforce Enforcing
   ```
4. **Answer:**
   ```bash
   if [ "$(getenforce)" = "Enforcing" ]; then echo "SELinux is enforcing"; fi
   ```
</details>

---

### **14.2 `sestatus` - SELinux Status**

Displays detailed SELinux status and configuration.

- **Usage:**
  ```bash
  sestatus [OPTIONS]
  ```
- **Options:**
  - `-v`: Verbose output; displays additional context.
  - `-b`: Displays the status of all SELinux booleans.

#### **Examples:**

1. **Display SELinux status:**
   ```bash
   sestatus
   ```
2. **Display SELinux status with additional information:**
   ```bash
   sestatus -v
   ```
3. **Display the status of all SELinux booleans:**
   ```bash
   sestatus -b
   ```
4. **Check if SELinux policy is loaded:**
   ```bash
   sestatus | grep "Loaded policy name"
   ```
5. **Check the current mode and policy type:**
   ```bash
   sestatus | egrep "Current mode|Policy from config file"
   ```

#### **Possible Exam Tasks:**

1. **Task:** Display the detailed status of SELinux, including booleans.

2. **Task:** Check which SELinux policy is currently loaded.

3. **Task:** Find out if SELinux is enabled and enforcing.

<details>
<summary><strong>Answers:</strong></summary>

1. **Answer:**
   ```bash
   sestatus -b
   ```
2. **Answer:**
   ```bash
   sestatus | grep "Loaded policy name"
   ```
3. **Answer:**
   ```bash
   sestatus
   ```
   - Look for "SELinux status: enabled" and "Current mode: enforcing"
</details>

---

### **14.3 Configuring SELinux Modes Permanently**

To make SELinux mode changes persistent across reboots, you need to edit the SELinux configuration file.

- **Configuration File:**
  - `/etc/selinux/config`

- **Options in `/etc/selinux/config`:**
  - `SELINUX=`
    - `enforcing`: SELinux security policy is enforced.
    - `permissive`: SELinux prints warnings instead of enforcing.
    - `disabled`: SELinux is fully disabled.
  - `SELINUXTYPE=`
    - Specifies the policy type (e.g., `targeted`, `mls`).

#### **Examples:**

1. **Edit the SELinux configuration file:**
   ```bash
   sudo vi /etc/selinux/config
   ```
2. **Set SELinux to permissive mode permanently:**
   - Change the line to:
     ```
     SELINUX=permissive
     ```
3. **Disable SELinux permanently (not recommended):**
   - Change the line to:
     ```
     SELINUX=disabled
     ```
4. **Set SELinux to enforcing mode permanently:**
   - Change the line to:
     ```
     SELINUX=enforcing
     ```
5. **Check the SELinux policy type:**
   ```bash
   grep SELINUXTYPE= /etc/selinux/config
   ```

#### **Possible Exam Tasks:**

1. **Task:** Permanently set SELinux to permissive mode.

2. **Task:** Verify the SELinux policy type configured in `/etc/selinux/config`.

3. **Task:** Permanently disable SELinux.

<details>
<summary><strong>Answers:</strong></summary>

1. **Answer:**
   - Edit `/etc/selinux/config`:
     ```bash
     sudo vi /etc/selinux/config
     ```
   - Change the line to:
     ```
     SELINUX=permissive
     ```
   - Save and exit. Reboot the system for changes to take effect.

2. **Answer:**
   ```bash
   grep SELINUXTYPE= /etc/selinux/config
   ```
3. **Answer:**
   - Edit `/etc/selinux/config`:
     ```bash
     sudo vi /etc/selinux/config
     ```
   - Change the line to:
     ```
     SELINUX=disabled
     ```
   - Save and exit. Reboot the system for changes to take effect.
   - **Note:** Disabling SELinux is generally discouraged.
</details>

---

### **14.4 `ls -Z` and `ps -Z` - View SELinux Contexts**

- **`ls -Z`**: Lists files and directories with their SELinux security contexts.
- **`ps -Z`**: Displays SELinux security contexts of processes.

#### **14.4.1 `ls -Z` Command**

- **Usage:**
  ```bash
  ls -Z [OPTIONS] [FILE]
  ```
- **Options:**
  - Standard `ls` options apply (e.g., `-l`, `-d`, `-R`).

#### **Examples:**

1. **List files with SELinux contexts:**
   ```bash
   ls -Z
   ```
2. **List detailed information including SELinux contexts:**
   ```bash
   ls -lZ
   ```
3. **List SELinux contexts of a specific file:**
   ```bash
   ls -Z /var/www/html/index.html
   ```
4. **Recursively list SELinux contexts in a directory:**
   ```bash
   ls -ZR /var/www/html
   ```
5. **List directories only with SELinux contexts:**
   ```bash
   ls -dZ */
   ```

#### **14.4.2 `ps -Z` Command**

- **Usage:**
  ```bash
  ps -eZ
  ```
- **Options:**
  - `-e`: Select all processes.
  - `-f`: Full-format listing.
  - `-Z`: Add SELinux security context.

#### **Examples:**

1. **List all processes with SELinux contexts:**
   ```bash
   ps -eZ
   ```
2. **List processes with full-format listing and SELinux contexts:**
   ```bash
   ps -efZ
   ```
3. **Filter processes by SELinux context:**
   ```bash
   ps -eZ | grep httpd
   ```
4. **Display processes of a specific user with SELinux contexts:**
   ```bash
   ps -u username -Z
   ```
5. **List SELinux contexts and PID of processes:**
   ```bash
   ps -eZ -o context,pid,cmd
   ```

#### **Possible Exam Tasks:**

1. **Task:** List all files in `/var/www/html` with their SELinux contexts.

2. **Task:** Display all running processes with their SELinux security contexts.

3. **Task:** Find the SELinux context of the `sshd` executable.

4. **Task:** List the SELinux contexts of all processes owned by `apache`.

<details>
<summary><strong>Answers:</strong></summary>

1. **Answer:**
   ```bash
   ls -lZ /var/www/html
   ```
2. **Answer:**
   ```bash
   ps -eZ
   ```
3. **Answer:**
   ```bash
   ls -Z /usr/sbin/sshd
   ```
4. **Answer:**
   ```bash
   ps -u apache -Z
   ```
</details>

---

### **14.5 `chcon` - Change SELinux Context**

Changes the SELinux security context of a file or directory.

- **Usage:**
  ```bash
  chcon [OPTIONS] CONTEXT FILE
  ```
- **Options:**
  - `-t [TYPE]`: Set the SELinux type.
  - `-u [USER]`: Set the SELinux user.
  - `-r [ROLE]`: Set the SELinux role.
  - `-l [RANGE]`: Set the SELinux level.
  - `-h`: Affect symbolic links instead of referenced files.
  - `-R`: Operate recursively on directories.

#### **Examples:**

1. **Change the SELinux type of a file:**
   ```bash
   chcon -t httpd_sys_content_t /var/www/html/index.html
   ```
2. **Recursively change the SELinux type of a directory:**
   ```bash
   chcon -R -t samba_share_t /shared/directory
   ```
3. **Change the SELinux user of a file:**
   ```bash
   chcon -u system_u /path/to/file
   ```
4. **Set the SELinux context to match another file:**
   ```bash
   chcon --reference=/var/www/html/index.html /path/to/otherfile.html
   ```
5. **Change the SELinux role and type of a file:**
   ```bash
   chcon -r object_r -t ssh_home_t ~/.ssh/id_rsa
   ```

#### **Possible Exam Tasks:**

1. **Task:** Change the SELinux context of `/var/www/html/index.html` to be accessible by Apache (`httpd_sys_content_t`).

2. **Task:** Recursively set the SELinux type of `/samba/share` to `samba_share_t`.

3. **Task:** Match the SELinux context of `/var/www/html/old.html` to `/var/www/html/new.html`.

4. **Task:** Change the SELinux user of `/secure/data` to `system_u`.

<details>
<summary><strong>Answers:</strong></summary>

1. **Answer:**
   ```bash
   chcon -t httpd_sys_content_t /var/www/html/index.html
   ```
2. **Answer:**
   ```bash
   chcon -R -t samba_share_t /samba/share
   ```
3. **Answer:**
   ```bash
   chcon --reference=/var/www/html/old.html /var/www/html/new.html
   ```
4. **Answer:**
   ```bash
   chcon -u system_u /secure/data
   ```
</details>

---

### **14.6 `restorecon` - Restore Default SELinux Context**

Restores the default SELinux security contexts of files and directories.

- **Usage:**
  ```bash
  restorecon [OPTIONS] FILE
  ```
- **Options:**
  - `-R`: Recursively restore contexts.
  - `-v`: Verbose output.
  - `-n`: Do not change any file contexts; just show what would be done.
  - `-F`: Forcefully relabel even if the context appears correct.
  - `-e [DIRECTORY]`: Exclude a directory from being relabeled.

#### **Examples:**

1. **Restore the default context of a file:**
   ```bash
   restorecon /var/www/html/index.html
   ```
2. **Recursively restore contexts of a directory:**
   ```bash
   restorecon -R /var/www/html
   ```
3. **Verbose output while restoring contexts:**
   ```bash
   restorecon -Rv /var/www/html
   ```
4. **Simulate the restore without making changes:**
   ```bash
   restorecon -Rn /var/www/html
   ```
5. **Forcefully relabel a file:**
   ```bash
   restorecon -F /path/to/file
   ```

#### **Possible Exam Tasks:**

1. **Task:** Restore the default SELinux context of `/var/www/html/index.html`.

2. **Task:** Recursively restore SELinux contexts of `/home/user` with verbose output.

3. **Task:** Simulate restoring SELinux contexts of `/data` without making changes.

4. **Task:** Forcefully restore the SELinux context of `/etc/shadow`.

<details>
<summary><strong>Answers:</strong></summary>

1. **Answer:**
   ```bash
   restorecon /var/www/html/index.html
   ```
2. **Answer:**
   ```bash
   restorecon -Rv /home/user
   ```
3. **Answer:**
   ```bash
   restorecon -Rn /data
   ```
4. **Answer:**
   ```bash
   restorecon -F /etc/shadow
   ```
</details>

---

### **14.7 `semanage` - Manage SELinux Policy Settings**

`semanage` is used to configure SELinux policy without requiring modification to or recompilation from policy sources.

- **Usage:**
  ```bash
  semanage [OPTIONS] OBJECT
  ```
- **Common Objects and Sub-Commands:**
  - `fcontext`: Manage file context definitions.
  - `port`: Manage network port type definitions.
  - `boolean`: Manage SELinux booleans.
  - `interface`: Manage network interfaces.
  - `user`: Manage SELinux users.

- **Common Options:**
  - `-a`: Add a record.
  - `-d`: Delete a record.
  - `-m`: Modify a record.
  - `-l`: List records.
  - `-E`: Extract customizable commands.

#### **Examples:**

1. **Add a custom file context:**
   ```bash
   semanage fcontext -a -t httpd_sys_content_t "/web(/.*)?"
   ```
2. **Apply the new context to files:**
   ```bash
   restorecon -R /web
   ```
3. **List all file context mappings:**
   ```bash
   semanage fcontext -l
   ```
4. **Delete a custom file context:**
   ```bash
   semanage fcontext -d "/web(/.*)?"
   ```
5. **Add a port to a service (e.g., add port 8080 for HTTP):**
   ```bash
   semanage port -a -t http_port_t -p tcp 8080
   ```
6. **List all SELinux port contexts:**
   ```bash
   semanage port -l
   ```
7. **Modify an existing port context:**
   ```bash
   semanage port -m -t ssh_port_t -p tcp 2222
   ```
8. **List SELinux booleans:**
   ```bash
   semanage boolean -l
   ```
9. **Set a SELinux boolean value:**
   ```bash
   setsebool -P httpd_can_network_connect on
   ```

#### **Possible Exam Tasks:**

1. **Task:** Configure SELinux to allow Apache to serve content from `/web` directory.

2. **Task:** Add TCP port 8080 as a valid port for HTTP service in SELinux.

3. **Task:** List all the SELinux file context mappings.

4. **Task:** Remove the custom file context mapping for `/web`.

<details>
<summary><strong>Answers:</strong></summary>

1. **Answer:**

   - Add the file context:
     ```bash
     semanage fcontext -a -t httpd_sys_content_t "/web(/.*)?"
     ```
   - Apply the context:
     ```bash
     restorecon -R /web
     ```

2. **Answer:**
   ```bash
   semanage port -a -t http_port_t -p tcp 8080
   ```
3. **Answer:**
   ```bash
   semanage fcontext -l
   ```
4. **Answer:**
   ```bash
   semanage fcontext -d "/web(/.*)?"
   ```
</details>

---

### **14.8 `setsebool` - Set SELinux Boolean Values**

SELinux booleans allow parts of SELinux policy to be changed at runtime without reloading or recompiling policy.

- **Usage:**
  ```bash
  setsebool [OPTIONS] BOOLEAN [on|off]
  ```
- **Options:**
  - `-P`: Make the change persistent across reboots.
  - `-N`: Do not reload policy after making changes.

#### **Examples:**

1. **Enable the `httpd_can_network_connect` boolean:**
   ```bash
   setsebool -P httpd_can_network_connect on
   ```
2. **Disable the `ftp_home_dir` boolean:**
   ```bash
   setsebool -P ftp_home_dir off
   ```
3. **Set multiple booleans at once:**
   ```bash
   setsebool -P httpd_can_sendmail on allow_user_exec_content on
   ```
4. **Temporarily enable a boolean (without `-P`):**
   ```bash
   setsebool httpd_enable_cgi on
   ```
5. **List all SELinux booleans and their current values:**
   ```bash
   getsebool -a
   ```

#### **Possible Exam Tasks:**

1. **Task:** Permanently enable the SELinux boolean `allow_ftpd_full_access`.

2. **Task:** Temporarily disable the `httpd_enable_cgi` boolean.

3. **Task:** List all SELinux booleans and their current states.

<details>
<summary><strong>Answers:</strong></summary>

1. **Answer:**
   ```bash
   setsebool -P allow_ftpd_full_access on
   ```
2. **Answer:**
   ```bash
   setsebool httpd_enable_cgi off
   ```
3. **Answer:**
   ```bash
   getsebool -a
   ```
</details>

---

### **14.9 Troubleshooting SELinux Denials**

SELinux denials are logged and can be analyzed to adjust policies.

#### **14.9.1 Using `audit2why`**

- **Usage:**
  ```bash
  audit2why < /var/log/audit/audit.log
  ```
- **Purpose:** Translates SELinux audit messages into a human-readable form, explaining why access was denied.

#### **14.9.2 Using `audit2allow`**

- **Usage:**
  ```bash
  audit2allow -a
  ```
- **Purpose:** Generates SELinux policy allow rules from logs of denied operations.

#### **Examples:**

1. **Check why an operation was denied:**
   ```bash
   grep AVC /var/log/audit/audit.log | audit2why
   ```
2. **Generate a policy module to allow the denied operation:**
   ```bash
   grep AVC /var/log/audit/audit.log | audit2allow -M mymodule
   ```
   - Load the module:
     ```bash
     semodule -i mymodule.pp
     ```
3. **List recent SELinux denials:**
   ```bash
   ausearch -m AVC -ts recent
   ```
4. **Use `sealert` to get detailed reports:**
   ```bash
   sealert -a /var/log/audit/audit.log
   ```

#### **Possible Exam Tasks:**

1. **Task:** Determine why SELinux is denying access to `/var/www/html/index.html`.

2. **Task:** Generate a policy module to allow a specific denied action.

3. **Task:** List all recent SELinux AVC denials.

<details>
<summary><strong>Answers:</strong></summary>

1. **Answer:**
   - Check the audit log for denials related to `index.html`:
     ```bash
     grep index.html /var/log/audit/audit.log | audit2why
     ```

2. **Answer:**
   - Generate the policy module:
     ```bash
     grep "denied" /var/log/audit/audit.log | audit2allow -M custom_module
     ```
   - Install the module:
     ```bash
     semodule -i custom_module.pp
     ```

3. **Answer:**
   ```bash
   ausearch -m AVC -ts recent
   ```
</details>

---

### **14.10 SELinux Context Labels**

An SELinux context is composed of:

- **User:** SELinux user (e.g., `system_u`, `unconfined_u`).
- **Role:** SELinux role (e.g., `object_r`, `system_r`).
- **Type:** SELinux type (e.g., `httpd_sys_content_t`).
- **Level:** MLS/MCS level (e.g., `s0`, `s0-s0:c0.c1023`).

#### **Examples:**

1. **View the context of a file:**
   ```bash
   ls -Z /var/www/html/index.html
   ```
2. **View the context of a process:**
   ```bash
   ps -eZ | grep httpd
   ```
3. **Change the type of a file:**
   ```bash
   chcon -t samba_share_t /samba/share
   ```
4. **Restore default context:**
   ```bash
   restorecon /var/www/html/index.html
   ```

#### **Possible Exam Tasks:**

1. **Task:** Explain the components of the SELinux context `system_u:object_r:httpd_sys_content_t:s0`.

2. **Task:** Identify the SELinux type that allows Apache to read files.

<details>
<summary><strong>Answers:</strong></summary>

1. **Answer:**

   - **system_u**: SELinux user.
   - **object_r**: SELinux role.
   - **httpd_sys_content_t**: SELinux type.
   - **s0**: SELinux level.

2. **Answer:**

   - The SELinux type `httpd_sys_content_t` allows Apache (`httpd`) to read files.
</details>

---

## Tips for SELinux Management on the RHCSA Exam

- **Understanding Modes:**
  - Be familiar with the different SELinux modes: Enforcing, Permissive, Disabled.
  - Know how to check and change the mode temporarily and permanently.

- **File Contexts:**
  - Understand how to view and interpret SELinux contexts using `ls -Z` and `ps -Z`.
  - Be able to change file contexts with `chcon` and restore them with `restorecon`.

- **Persistent Changes:**
  - Use `semanage` to make persistent changes to file contexts and port labels.
  - Know how to add custom file contexts and manage SELinux policies.

- **Booleans:**
  - Be able to list and change SELinux booleans with `getsebool`, `setsebool`, and `semanage boolean`.
  - Understand how booleans can enable or disable certain SELinux rules.

- **Troubleshooting:**
  - Practice troubleshooting SELinux denials using `audit2why`, `audit2allow`, and `ausearch`.
  - Know how to generate and apply custom SELinux modules if necessary.

- **Exam Strategy:**
  - Pay close attention to whether changes need to be temporary or persistent.
  - Use `man` pages and `--help` options if allowed during the exam for syntax assistance.
  - Remember that disabling SELinux is generally not recommended and may not be acceptable on the exam.

- **Practical Application:**
  - Practice common tasks such as configuring services to work with SELinux, adjusting file contexts, and managing booleans.
  - Ensure you understand the default contexts for common services like HTTP, FTP, and Samba.

---

By expanding the SELinux Management section with additional commands, options, examples, and possible exam tasks, you can deepen your understanding of these essential tools and concepts for the RHCSA exam. Remember to practice using these commands in a real-world environment to become proficient and confident in your abilities.