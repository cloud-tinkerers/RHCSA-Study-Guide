## Firewall Configuration with Possible Exam Tasks

As requested, I've expanded the **Firewall Configuration** section to include between five and ten of the top options for each command, along with at least five examples of usage. I've also added a "Possible Exam Tasks" subsection for each command, which includes tasks that may involve using one or more commands together to achieve a specific goal, similar to what might be encountered on the RHCSA exam. The answers are provided after the questions in collapsible sections.

---

## 10. Firewall Configuration

### **10.1 `firewall-cmd` - Configure and Manage firewalld**

`firewall-cmd` is the command-line client of the `firewalld` daemon, which provides a dynamically managed firewall with support for network/firewall zones.

- **Common Options:**
  - `--state`: Check the running state of the firewall.
  - `--reload`: Reload firewall rules.
  - `--permanent`: Make changes persistent across reboots.
  - `--list-all`: List all information about the firewall configuration.
  - `--list-ports`: List all ports currently open.
  - `--list-services`: List all services currently allowed.
  - `--add-port=[PORT]/[PROTOCOL]`: Open a specific port.
  - `--remove-port=[PORT]/[PROTOCOL]`: Close a specific port.
  - `--add-service=[SERVICE]`: Allow a predefined service.
  - `--remove-service=[SERVICE]`: Disallow a predefined service.
  - `--get-services`: List all predefined services.
  - `--zone=[ZONE]`: Specify the zone to which the command applies.
  - `--add-rich-rule`: Add a rich language rule.
  - `--get-active-zones`: Show active zones and interfaces.

- **Examples:**
  1. **Check firewall status:**
     ```bash
     firewall-cmd --state
     ```
  2. **Open port 8080/tcp permanently and reload the firewall:**
     ```bash
     firewall-cmd --permanent --add-port=8080/tcp
     firewall-cmd --reload
     ```
  3. **List all open ports:**
     ```bash
     firewall-cmd --list-ports
     ```
  4. **Add a service (e.g., `http`) temporarily:**
     ```bash
     firewall-cmd --add-service=http
     ```
  5. **Remove a permanent service (e.g., `ftp`):**
     ```bash
     firewall-cmd --permanent --remove-service=ftp
     firewall-cmd --reload
     ```
  6. **List all firewall settings:**
     ```bash
     firewall-cmd --list-all
     ```
  7. **Add a rich rule to allow traffic from a specific IP:**
     ```bash
     firewall-cmd --permanent --add-rich-rule='rule family="ipv4" source address="192.168.1.100" accept'
     firewall-cmd --reload
     ```
  8. **List active zones and their interfaces:**
     ```bash
     firewall-cmd --get-active-zones
     ```
  9. **Change the default zone for a network interface:**
     ```bash
     firewall-cmd --zone=public --change-interface=eth0
     ```
  10. **Get a list of predefined services:**
      ```bash
      firewall-cmd --get-services
      ```

#### **Possible Exam Tasks:**

1. **Task:** Open port `3306/tcp` permanently and reload the firewall.

2. **Task:** Add the `https` service to the firewall rules temporarily.

3. **Task:** List all currently allowed services and open ports.

4. **Task:** Remove port `22/tcp` from the permanent configuration and reload the firewall.

5. **Task:** Allow incoming traffic from the IP address `10.0.0.5` permanently.

6. **Task:** Set the default zone to `trusted` for the interface `eth1`.

7. **Task:** Check if the firewall is active and running.

8. **Task:** List all the information about the current firewall configuration.

<details>
<summary><strong>Answers:</strong></summary>

1. **Answer:**
   ```bash
   firewall-cmd --permanent --add-port=3306/tcp
   firewall-cmd --reload
   ```
2. **Answer:**
   ```bash
   firewall-cmd --add-service=https
   ```
3. **Answer:**
   ```bash
   firewall-cmd --list-all
   ```
   Or specifically:
   ```bash
   firewall-cmd --list-services
   firewall-cmd --list-ports
   ```
4. **Answer:**
   ```bash
   firewall-cmd --permanent --remove-port=22/tcp
   firewall-cmd --reload
   ```
5. **Answer:**
   ```bash
   firewall-cmd --permanent --add-rich-rule='rule family="ipv4" source address="10.0.0.5" accept'
   firewall-cmd --reload
   ```
6. **Answer:**
   ```bash
   firewall-cmd --zone=trusted --change-interface=eth1 --permanent
   firewall-cmd --reload
   ```
7. **Answer:**
   ```bash
   firewall-cmd --state
   ```
8. **Answer:**
   ```bash
   firewall-cmd --list-all
   ```

</details>

---

### **10.2 Zones in firewalld**

Firewalld uses zones to define the trust level of network connections.

- **Common Zones:**
  - `drop`: All incoming connections are dropped.
  - `block`: Similar to `drop` but rejects incoming connections with an ICMP unreachable message.
  - `public`: For use in untrusted public areas.
  - `external`: For external networks with masquerading enabled.
  - `dmz`: For computers in a demilitarized zone.
  - `work`: For work machines.
  - `home`: For home networks.
  - `internal`: For internal networks.
  - `trusted`: All network connections are accepted.

- **Examples:**
  1. **List all available zones:**
     ```bash
     firewall-cmd --get-zones
     ```
  2. **Set the default zone to `work`:**
     ```bash
     firewall-cmd --set-default-zone=work
     ```
  3. **Add an interface `eth0` to the `internal` zone permanently:**
     ```bash
     firewall-cmd --permanent --zone=internal --add-interface=eth0
     firewall-cmd --reload
     ```
  4. **List all settings for the `public` zone:**
     ```bash
     firewall-cmd --zone=public --list-all
     ```
  5. **Change the zone of an interface temporarily:**
     ```bash
     firewall-cmd --zone=home --change-interface=eth1
     ```

#### **Possible Exam Tasks:**

1. **Task:** Add interface `eth0` to the `trusted` zone permanently.

2. **Task:** Set the default zone to `public`.

3. **Task:** List all services allowed in the `internal` zone.

4. **Task:** Remove interface `eth1` from its current zone.

5. **Task:** Temporarily change the zone of interface `eth2` to `dmz`.

<details>
<summary><strong>Answers:</strong></summary>

1. **Answer:**
   ```bash
   firewall-cmd --permanent --zone=trusted --add-interface=eth0
   firewall-cmd --reload
   ```
2. **Answer:**
   ```bash
   firewall-cmd --set-default-zone=public
   ```
3. **Answer:**
   ```bash
   firewall-cmd --zone=internal --list-services
   ```
4. **Answer:**
   ```bash
   firewall-cmd --zone=--remove-interface=eth1
   firewall-cmd --reload
   ```
5. **Answer:**
   ```bash
   firewall-cmd --zone=dmz --change-interface=eth2
   ```

</details>

---

### **10.3 `iptables` - Legacy Firewall Tool**

**Note:** `iptables` is considered a legacy tool for packet filtering and is being replaced by `nftables`. However, `iptables` is still widely used and important to understand.

- **Common Options:**
  - `-L`: List all rules in the selected chain.
  - `-F`: Flush all rules (delete).
  - `-A`: Append a rule to a chain.
  - `-D`: Delete a rule from a chain.
  - `-I`: Insert a rule at a specific position.
  - `-P`: Set default policy for a chain.
  - `-t [TABLE]`: Specify the table (`filter`, `nat`, `mangle`).
  - `-s [SOURCE]`: Specify source address.
  - `-d [DESTINATION]`: Specify destination address.
  - `-p [PROTOCOL]`: Specify protocol (`tcp`, `udp`, `icmp`).
  - `--dport [PORT]`: Specify destination port.
  - `-j [TARGET]`: Specify the target (`ACCEPT`, `DROP`, `REJECT`).
  - `-v`: Verbose output.
  - `-n`: Numeric output of addresses and ports.

- **Examples:**
  1. **List current iptables rules:**
     ```bash
     iptables -L -n -v
     ```
  2. **Flush all iptables rules:**
     ```bash
     iptables -F
     ```
  3. **Allow incoming SSH connections:**
     ```bash
     iptables -A INPUT -p tcp --dport 22 -j ACCEPT
     ```
  4. **Block all traffic from IP `192.168.1.100`:**
     ```bash
     iptables -A INPUT -s 192.168.1.100 -j DROP
     ```
  5. **Set default policy to DROP for the `INPUT` chain:**
     ```bash
     iptables -P INPUT DROP
     ```
  6. **Delete a specific rule:**
     ```bash
     iptables -D INPUT -p tcp --dport 80 -j ACCEPT
     ```
  7. **Insert a rule at the top of the chain:**
     ```bash
     iptables -I INPUT 1 -p tcp --dport 443 -j ACCEPT
     ```
  8. **Save iptables rules to a file (varies by distribution):**
     ```bash
     iptables-save > /etc/iptables/rules.v4
     ```
  9. **Restore iptables rules from a file:**
     ```bash
     iptables-restore < /etc/iptables/rules.v4
     ```
  10. **List NAT table rules:**
      ```bash
      iptables -t nat -L -n -v
      ```

#### **Possible Exam Tasks:**

1. **Task:** Append a rule to allow incoming HTTP (port 80) traffic.

2. **Task:** Block incoming traffic from IP `10.0.0.5`.

3. **Task:** Set the default policy for the `OUTPUT` chain to `ACCEPT`.

4. **Task:** Delete a rule that allows incoming SSH connections.

5. **Task:** Save the current iptables rules to `/etc/iptables/rules.v4`.

6. **Task:** List all rules in the `nat` table.

<details>
<summary><strong>Answers:</strong></summary>

1. **Answer:**
   ```bash
   iptables -A INPUT -p tcp --dport 80 -j ACCEPT
   ```
2. **Answer:**
   ```bash
   iptables -A INPUT -s 10.0.0.5 -j DROP
   ```
3. **Answer:**
   ```bash
   iptables -P OUTPUT ACCEPT
   ```
4. **Answer:**
   ```bash
   iptables -D INPUT -p tcp --dport 22 -j ACCEPT
   ```
5. **Answer:**
   ```bash
   iptables-save > /etc/iptables/rules.v4
   ```
6. **Answer:**
   ```bash
   iptables -t nat -L -n -v
   ```

</details>

---

### **10.4 `firewall-config` - Graphical Firewall Configuration Tool**

`firewall-config` is a graphical interface for configuring the firewall. It provides a user-friendly way to manage `firewalld` settings.

- **Usage:**
  - Start the tool from the terminal:
    ```bash
    firewall-config
    ```
  - Requires a graphical environment.

#### **Possible Exam Tasks:**

*Note: On the RHCSA exam, you may not have access to a graphical interface. Focus on mastering command-line tools like `firewall-cmd`.*

---

### **10.5 Using `firewalld` Rich Rules**

Rich rules provide a more detailed way to define firewall rules.

- **Syntax:**
  ```bash
  firewall-cmd --permanent --add-rich-rule='rule [conditions] [action]'
  ```
- **Examples:**
  1. **Allow SSH from a specific subnet:**
     ```bash
     firewall-cmd --permanent --add-rich-rule='rule family="ipv4" source address="192.168.1.0/24" service name="ssh" accept'
     firewall-cmd --reload
     ```
  2. **Reject ICMP ping requests:**
     ```bash
     firewall-cmd --permanent --add-rich-rule='rule protocol value="icmp" drop'
     firewall-cmd --reload
     ```
  3. **Log and drop incoming traffic to port 23 (Telnet):**
     ```bash
     firewall-cmd --permanent --add-rich-rule='rule family="ipv4" service name="telnet" log prefix="Telnet Attempt: " level="info" drop'
     firewall-cmd --reload
     ```
  4. **Limit SSH connections to 3 attempts per minute:**
     ```bash
     firewall-cmd --permanent --add-rich-rule='rule service name="ssh" limit value="3/m" accept'
     firewall-cmd --reload
     ```
  5. **Allow HTTP traffic only from a specific MAC address:**
     ```bash
     firewall-cmd --permanent --add-rich-rule='rule family="ipv4" mac address="00:11:22:33:44:55" service name="http" accept'
     firewall-cmd --reload
     ```

#### **Possible Exam Tasks:**

1. **Task:** Add a rich rule to allow SSH access from the IP `203.0.113.5`.

2. **Task:** Block all ICMP echo requests (ping) using a rich rule.

3. **Task:** Limit incoming connections to the `ftp` service to 5 per minute.

4. **Task:** Log and reject incoming traffic to port `25` (SMTP).

<details>
<summary><strong>Answers:</strong></summary>

1. **Answer:**
   ```bash
   firewall-cmd --permanent --add-rich-rule='rule family="ipv4" source address="203.0.113.5" service name="ssh" accept'
   firewall-cmd --reload
   ```
2. **Answer:**
   ```bash
   firewall-cmd --permanent --add-rich-rule='rule protocol value="icmp" icmp-type name="echo-request" drop'
   firewall-cmd --reload
   ```
3. **Answer:**
   ```bash
   firewall-cmd --permanent --add-rich-rule='rule service name="ftp" limit value="5/m" accept'
   firewall-cmd --reload
   ```
4. **Answer:**
   ```bash
   firewall-cmd --permanent --add-rich-rule='rule family="ipv4" port port="25" protocol="tcp" log prefix="SMTP Block: " level="info" reject'
   firewall-cmd --reload
   ```

</details>

---

### **10.6 Managing Services and Ports**

#### **10.6.1 Adding Services**

- **List predefined services:**
  ```bash
  firewall-cmd --get-services
  ```
- **Add a service permanently:**
  ```bash
  firewall-cmd --permanent --add-service=http
  firewall-cmd --reload
  ```
- **Remove a service permanently:**
  ```bash
  firewall-cmd --permanent --remove-service=ftp
  firewall-cmd --reload
  ```

#### **10.6.2 Adding Ports**

- **Add a port permanently:**
  ```bash
  firewall-cmd --permanent --add-port=8080/tcp
  firewall-cmd --reload
  ```
- **Remove a port permanently:**
  ```bash
  firewall-cmd --permanent --remove-port=8080/tcp
  firewall-cmd --reload
  ```

#### **Possible Exam Tasks:**

1. **Task:** Permanently allow the `dns` service.

2. **Task:** Remove port `21/tcp` from the allowed ports.

3. **Task:** List all services currently allowed in the firewall.

<details>
<summary><strong>Answers:</strong></summary>

1. **Answer:**
   ```bash
   firewall-cmd --permanent --add-service=dns
   firewall-cmd --reload
   ```
2. **Answer:**
   ```bash
   firewall-cmd --permanent --remove-port=21/tcp
   firewall-cmd --reload
   ```
3. **Answer:**
   ```bash
   firewall-cmd --list-services
   ```

</details>

---

### **10.7 Using `firewalld` Direct Rules**

Direct rules allow you to add raw iptables rules into firewalld.

- **Add a direct rule:**
  ```bash
  firewall-cmd --permanent --direct --add-rule [CHAIN] [PRIORITY] [RULE_SPEC]
  ```
- **Examples:**
  1. **Add a direct rule to allow traffic on port 5000/tcp:**
     ```bash
     firewall-cmd --permanent --direct --add-rule ipv4 filter INPUT 0 -p tcp --dport 5000 -j ACCEPT
     firewall-cmd --reload
     ```
  2. **Remove a direct rule:**
     ```bash
     firewall-cmd --permanent --direct --remove-rule ipv4 filter INPUT 0 -p tcp --dport 5000 -j ACCEPT
     firewall-cmd --reload
     ```

#### **Possible Exam Tasks:**

1. **Task:** Use a direct rule to drop all incoming traffic from IP `192.0.2.1`.

2. **Task:** List all direct rules currently configured.

<details>
<summary><strong>Answers:</strong></summary>

1. **Answer:**
   ```bash
   firewall-cmd --permanent --direct --add-rule ipv4 filter INPUT 0 -s 192.0.2.1 -j DROP
   firewall-cmd --reload
   ```
2. **Answer:**
   ```bash
   firewall-cmd --permanent --direct --get-all-rules
   ```

</details>

---

### **10.8 Saving and Restoring iptables Rules**

- **Save iptables rules:**
  ```bash
  iptables-save > /etc/iptables/rules.v4
  ```
- **Restore iptables rules:**
  ```bash
  iptables-restore < /etc/iptables/rules.v4
  ```
- **Automatically load iptables rules on boot:**
  - **On systems using `systemd`, create a service to load rules on startup.**

#### **Possible Exam Tasks:**

1. **Task:** Save the current iptables rules to `/etc/iptables/rules.v4`.

2. **Task:** Restore iptables rules from `/etc/iptables/rules.v4`.

<details>
<summary><strong>Answers:</strong></summary>

1. **Answer:**
   ```bash
   iptables-save > /etc/iptables/rules.v4
   ```
2. **Answer:**
   ```bash
   iptables-restore &lt; /etc/iptables/rules.v4 
   ```

</details>

---

## Tips for Firewall Configuration on the RHCSA Exam

- **Use `firewall-cmd` for Managing firewalld:**
  - Be comfortable adding, removing, and listing services and ports.
  - Know how to make changes permanent and reload the firewall.

- **Understand Zones and Their Uses:**
  - Know the default zones and their trust levels.
  - Practice assigning interfaces to zones and changing default zones.

- **Rich Rules:**
  - Learn how to create rich rules for more granular control.
  - Practice adding rules for specific IPs, protocols, and actions.

- **Legacy `iptables`:**
  - Although `firewalld` is preferred, understand basic `iptables` commands.
  - Be able to list, add, and delete rules using `iptables`.

- **Saving Configurations:**
  - Remember to reload the firewall after making permanent changes.
  - Know how to save and restore `iptables` rules.

- **Exam Strategy:**
  - Read questions carefully to determine whether to use `firewall-cmd` or `iptables`.
  - Ensure you understand whether changes need to be temporary or permanent.
  - Practice common tasks to ensure efficiency during the exam.

---

By expanding the Firewall Configuration section with additional options, examples, and possible exam tasks, you can deepen your understanding of these essential commands and concepts for the RHCSA exam.