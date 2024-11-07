## Networking Commands with Possible Exam Tasks

As we dive into the **Networking Commands** section, we'll expand on important networking concepts such as CIDR notation, IP routing, and essential considerations when configuring networks. Each command will include a description, common options (between five and ten), at least five examples, and possible exam tasks with answers provided in collapsible sections.

---

## 6. Networking Commands

### **6.1 `ping` - Check Network Connectivity**

Sends ICMP ECHO_REQUEST packets to network hosts to test connectivity.

- **Common Options:**
  - `-c [COUNT]`: Stop after sending and receiving COUNT ECHO_REQUEST packets.
  - `-i [INTERVAL]`: Wait INTERVAL seconds between sending each packet.
  - `-w [DEADLINE]`: Specify a timeout, in seconds, before ping exits.
  - `-s [PACKET_SIZE]`: Specify the number of data bytes to be sent.
  - `-t [TTL]`: Set the IP Time to Live.
  - `-q`: Quiet output. Only display summary.
  - `-4`: Use IPv4 only.
  - `-6`: Use IPv6 only.
  - `-f`: Flood ping. Sends packets as fast as possible (requires root).
  - `-a`: Audible ping. Beep when a packet is received.

- **Examples:**
  1. **Ping a host indefinitely:**
     ```bash
     ping example.com
     ```
  2. **Ping a host 5 times:**
     ```bash
     ping -c 5 8.8.8.8
     ```
  3. **Ping with a specified interval of 0.5 seconds:**
     ```bash
     ping -i 0.5 example.com
     ```
  4. **Ping using IPv6:**
     ```bash
     ping -6 ipv6.google.com
     ```
  5. **Ping with a packet size of 100 bytes:**
     ```bash
     ping -s 100 example.com
     ```
  6. **Set a timeout of 10 seconds:**
     ```bash
     ping -w 10 example.com
     ```
  7. **Quiet output, only display summary:**
     ```bash
     ping -c 5 -q example.com
     ```
  8. **Flood ping a host (use with caution):**
     ```bash
     sudo ping -f 8.8.8.8
     ```
  9. **Ping and beep on response:**
     ```bash
     ping -a example.com
     ```
  10. **Set the Time to Live to 64:**
      ```bash
      ping -t 64 example.com
      ```

#### **Possible Exam Tasks:**

1. **Task:** Ping `192.168.1.1` exactly 3 times and display only the summary.

2. **Task:** Perform a ping to `example.com` with a 2-second interval between packets.

3. **Task:** Use `ping` to test connectivity to `google.com` using IPv6.

4. **Task:** Ping `example.com` and set the packet size to 200 bytes.

5. **Task:** Set a ping deadline of 5 seconds to `192.168.0.1`.

<details>
<summary><strong>Answers:</strong></summary>

1. **Answer:**
   ```bash
   ping -c 3 -q 192.168.1.1
   ```
2. **Answer:**
   ```bash
   ping -i 2 example.com
   ```
3. **Answer:**
   ```bash
   ping -6 google.com
   ```
4. **Answer:**
   ```bash
   ping -s 200 example.com
   ```
5. **Answer:**
   ```bash
   ping -w 5 192.168.0.1
   ```

</details>

---

### **6.2 `ip` - Network Interface Configuration**

Modern utility for network interface management and configuration.

- **Common `ip` Subcommands:**
  - `ip addr`: Manage IP addresses.
  - `ip link`: Manage network interfaces.
  - `ip route`: Manage routing table.
  - `ip neigh`: Manage neighbor cache (ARP table).
  - `ip addr show [INTERFACE]`: Show addresses for interfaces.
  - `ip route show`: Show routing table.
  - `ip -s link`: Show interface statistics.
  - `ip tunnel`: Manage tunnels.
  - `ip maddr`: Manage multicast addresses.

- **Common Options:**
  - `add`: Add an address or route.
  - `del`: Delete an address or route.
  - `show` or `list`: Display information.
  - `set`: Change interface properties.
  - `flush`: Remove addresses or routes.
  - `-4`: Use IPv4.
  - `-6`: Use IPv6.

- **Examples:**
  1. **Show all network interfaces and their IP addresses:**
     ```bash
     ip addr show
     ```
  2. **Bring up an interface `eth0`:**
     ```bash
     ip link set eth0 up
     ```
  3. **Assign an IP address to an interface:**
     ```bash
     ip addr add 192.168.1.10/24 dev eth0
     ```
  4. **Delete an IP address from an interface:**
     ```bash
     ip addr del 192.168.1.10/24 dev eth0
     ```
  5. **Show the routing table:**
     ```bash
     ip route show
     ```
  6. **Add a default gateway:**
     ```bash
     ip route add default via 192.168.1.1
     ```
  7. **Flush all IP addresses on `eth0`:**
     ```bash
     ip addr flush dev eth0
     ```
  8. **Display neighbor (ARP) table:**
     ```bash
     ip neigh show
     ```
  9. **Set MTU size on an interface:**
     ```bash
     ip link set dev eth0 mtu 1400
     ```
  10. **Rename a network interface from `eth0` to `net0`:**
      ```bash
      ip link set eth0 name net0
      ```

#### **CIDR Notation and IP Configuration**

- **CIDR (Classless Inter-Domain Routing)** notation specifies an IP address and its associated network mask.
  - Format: `IP_ADDRESS/CIDR_PREFIX`
  - Example: `192.168.1.10/24` means the first 24 bits are the network part, corresponding to a subnet mask of `255.255.255.0`.

#### **Possible Exam Tasks:**

1. **Task:** Assign the IP address `10.0.0.5` with a subnet mask of `255.255.255.0` to interface `eth1`.

2. **Task:** Add a default route via gateway `192.168.1.1`.

3. **Task:** Bring down the interface `eth0`.

4. **Task:** Display the neighbor cache (ARP table).

5. **Task:** Flush all IP addresses from interface `eth1`.

<details>
<summary><strong>Answers:</strong></summary>

1. **Answer:**
   ```bash
   ip addr add 10.0.0.5/24 dev eth1
   ```
2. **Answer:**
   ```bash
   ip route add default via 192.168.1.1
   ```
3. **Answer:**
   ```bash
   ip link set eth0 down
   ```
4. **Answer:**
   ```bash
   ip neigh show
   ```
5. **Answer:**
   ```bash
   ip addr flush dev eth1
   ```

</details>

---

### **6.3 `netstat` and `ss` - Network Statistics**

- **Note:** `netstat` is deprecated in favor of `ss`.

#### **6.3.1 `ss` - Socket Statistics**

Displays information about sockets (network connections).

- **Common Options:**
  - `-t`: Display TCP sockets.
  - `-u`: Display UDP sockets.
  - `-l`: Show listening sockets.
  - `-p`: Show process using the socket.
  - `-n`: Don't resolve service names (show ports numerically).
  - `-a`: Display all sockets.
  - `-s`: Display summary statistics.
  - `-r`: Resolve host names.
  - `-o`: Display timer information.
  - `-e`: Display extended information.

- **Examples:**
  1. **List all listening TCP sockets:**
     ```bash
     ss -tl
     ```
  2. **List all listening ports with associated processes:**
     ```bash
     ss -tulnp
     ```
  3. **Display all established SSH connections:**
     ```bash
     ss -o state established '( dport = :ssh or sport = :ssh )'
     ```
  4. **Show summary statistics:**
     ```bash
     ss -s
     ```
  5. **List all UDP sockets:**
     ```bash
     ss -u -a
     ```
  6. **Display all sockets (TCP and UDP) with numeric ports:**
     ```bash
     ss -tun
     ```
  7. **Show connections to a specific port (e.g., port 80):**
     ```bash
     ss -t dst :80
     ```
  8. **List all sockets with extended information:**
     ```bash
     ss -e -a
     ```
  9. **Display all UNIX domain sockets:**
     ```bash
     ss -x -a
     ```
  10. **List all connections from a specific IP address:**
      ```bash
      ss -t src 192.168.1.100
      ```

#### **Possible Exam Tasks:**

1. **Task:** List all listening TCP ports with numeric port numbers.

2. **Task:** Display all established connections and the processes using them.

3. **Task:** Show summary statistics of all socket connections.

4. **Task:** List all UDP listening sockets.

5. **Task:** Find all established connections to port 22 (SSH).

<details>
<summary><strong>Answers:</strong></summary>

1. **Answer:**
   ```bash
   ss -tln
   ```
2. **Answer:**
   ```bash
   ss -tunap
   ```
3. **Answer:**
   ```bash
   ss -s
   ```
4. **Answer:**
   ```bash
   ss -ul
   ```
5. **Answer:**
   ```bash
   ss -o state established '( dport = :22 or sport = :22 )'
   ```

</details>

---

### **6.3.2 `netstat` - Network Statistics**

Although deprecated, still used in some systems.

- **Common Options:**
  - `-t`: Display TCP connections.
  - `-u`: Display UDP connections.
  - `-l`: Show listening sockets.
  - `-p`: Show the PID and name of the program to which each socket belongs.
  - `-n`: Show numerical addresses instead of resolving hosts.
  - `-a`: Display all sockets.
  - `-r`: Display the kernel routing table.
  - `-e`: Display extended information.
  - `-s`: Display summary statistics.

- **Examples:**
  1. **List all listening ports:**
     ```bash
     netstat -tuln
     ```
  2. **Display routing table:**
     ```bash
     netstat -rn
     ```
  3. **Show all established connections:**
     ```bash
     netstat -tuna
     ```
  4. **Display connections with program names:**
     ```bash
     netstat -tulpn
     ```
  5. **Display extended information:**
     ```bash
     netstat -e
     ```
  6. **Display network interface statistics:**
     ```bash
     netstat -i
     ```
  7. **Display summary statistics:**
     ```bash
     netstat -s
     ```
  8. **Show multicast group membership:**
     ```bash
     netstat -g
     ```
  9. **List all UNIX domain sockets:**
     ```bash
     netstat -xa
     ```
  10. **Display kernel interface table:**
      ```bash
      netstat -ie
      ```

#### **Possible Exam Tasks:**

1. **Task:** List all listening TCP and UDP ports with numerical addresses.

2. **Task:** Display the system's routing table.

3. **Task:** Show all established network connections.

4. **Task:** Display network interface statistics.

5. **Task:** List all listening services along with their associated programs.

<details>
<summary><strong>Answers:</strong></summary>

1. **Answer:**
   ```bash
   netstat -tuln
   ```
2. **Answer:**
   ```bash
   netstat -rn
   ```
3. **Answer:**
   ```bash
   netstat -tuna
   ```
4. **Answer:**
   ```bash
   netstat -i
   ```
5. **Answer:**
   ```bash
   netstat -tulpn
   ```

</details>

---

### **6.4 `traceroute` - Trace Network Path to a Host**

Displays the route packets take to reach a network host.

- **Common Options:**
  - `-n`: Do not resolve hostnames (display numerical addresses only).
  - `-m [MAX_TTL]`: Set the max number of hops (max time-to-live value).
  - `-p [PORT]`: Use the specified destination port.
  - `-I`: Use ICMP ECHO for probes (like Windows tracert).
  - `-T`: Use TCP SYN for probes.
  - `-w [WAIT]`: Set the time (in seconds) to wait for a response.
  - `-q [NQUERIES]`: Set the number of probes per hop.
  - `-f [FIRST_TTL]`: Set the initial time-to-live value.
  - `--help`: Display help information.

- **Examples:**
  1. **Trace route to `example.com`:**
     ```bash
     traceroute example.com
     ```
  2. **Trace route without resolving hostnames:**
     ```bash
     traceroute -n example.com
     ```
  3. **Use ICMP ECHO for probes:**
     ```bash
     traceroute -I 8.8.8.8
     ```
  4. **Set maximum hops to 15:**
     ```bash
     traceroute -m 15 example.com
     ```
  5. **Set wait time to 2 seconds:**
     ```bash
     traceroute -w 2 example.com
     ```
  6. **Start tracing from hop 5:**
     ```bash
     traceroute -f 5 example.com
     ```
  7. **Use TCP SYN probes on port 80:**
     ```bash
     traceroute -T -p 80 example.com
     ```
  8. **Send 2 probes per hop:**
     ```bash
     traceroute -q 2 example.com
     ```
  9. **Display help information:**
     ```bash
     traceroute --help
     ```
  10. **Trace route to an IP address:**
      ```bash
      traceroute 192.168.1.1
      ```

#### **Possible Exam Tasks:**

1. **Task:** Trace the network path to `google.com` without resolving hostnames.

2. **Task:** Use `traceroute` to send ICMP ECHO requests to `8.8.4.4`.

3. **Task:** Limit the maximum number of hops to 10 when tracing `example.com`.

4. **Task:** Start tracing from hop number 3 to `example.com`.

5. **Task:** Use TCP SYN probes on port 443 to trace `example.com`.

<details>
<summary><strong>Answers:</strong></summary>

1. **Answer:**
   ```bash
   traceroute -n google.com
   ```
2. **Answer:**
   ```bash
   traceroute -I 8.8.4.4
   ```
3. **Answer:**
   ```bash
   traceroute -m 10 example.com
   ```
4. **Answer:**
   ```bash
   traceroute -f 3 example.com
   ```
5. **Answer:**
   ```bash
   traceroute -T -p 443 example.com
   ```

</details>

---

### **6.5 `dig` and `nslookup` - DNS Lookup Utilities**

#### **6.5.1 `dig` - Domain Information Groper**

Performs DNS lookups and displays detailed responses.

- **Common Options:**
  - `[DOMAIN]`: Specify the domain to query.
  - `[TYPE]`: Specify the query type (e.g., A, MX, TXT).
  - `+short`: Display a terse answer.
  - `+trace`: Trace the delegation path to the name server.
  - `@SERVER`: Query a specific DNS server.
  - `+noall +answer`: Show only the answer section.
  - `+stats`: Display statistics at the end.
  - `+time=[SECONDS]`: Set the query timeout.

- **Examples:**
  1. **Query the A record for `example.com`:**
     ```bash
     dig example.com
     ```
  2. **Query MX records:**
     ```bash
     dig example.com MX
     ```
  3. **Display only the answer section:**
     ```bash
     dig +noall +answer example.com
     ```
  4. **Use a specific DNS server:**
     ```bash
     dig @8.8.8.8 example.com
     ```
  5. **Display a short answer:**
     ```bash
     dig +short example.com
     ```
  6. **Trace the DNS path:**
     ```bash
     dig +trace example.com
     ```
  7. **Query the TXT record:**
     ```bash
     dig example.com TXT
     ```
  8. **Set query timeout to 2 seconds:**
     ```bash
     dig +time=2 example.com
     ```
  9. **Display DNS query statistics:**
     ```bash
     dig +stats example.com
     ```
  10. **Query reverse DNS for an IP address:**
      ```bash
      dig -x 8.8.8.8
      ```

#### **Possible Exam Tasks:**

1. **Task:** Use `dig` to find the MX records for `example.com`.

2. **Task:** Perform a reverse DNS lookup for IP `8.8.4.4`.

3. **Task:** Display only the IP address of `example.com` using `dig`.

4. **Task:** Use `dig` to query the DNS server at `8.8.8.8` for `example.com`.

5. **Task:** Trace the DNS delegation path for `example.com`.

<details>
<summary><strong>Answers:</strong></summary>

1. **Answer:**
   ```bash
   dig example.com MX
   ```
2. **Answer:**
   ```bash
   dig -x 8.8.4.4
   ```
3. **Answer:**
   ```bash
   dig +short example.com
   ```
4. **Answer:**
   ```bash
   dig @8.8.8.8 example.com
   ```
5. **Answer:**
   ```bash
   dig +trace example.com
   ```

</details>

#### **6.5.2 `nslookup` - Query Internet Name Servers**

An older utility for DNS queries.

- **Common Options:**
  - `[DOMAIN]`: Specify the domain to query.
  - `[SERVER]`: Specify the DNS server to use.
  - `-type=[TYPE]`: Specify the query type.
  - `-timeout=[SECONDS]`: Set query timeout.
  - `-debug`: Print debugging information.
  - `set [OPTION]`: Set options interactively.

- **Examples:**
  1. **Query A record for `example.com`:**
     ```bash
     nslookup example.com
     ```
  2. **Use a specific DNS server:**
     ```bash
     nslookup example.com 8.8.8.8
     ```
  3. **Query MX records:**
     ```bash
     nslookup -type=MX example.com
     ```
  4. **Set timeout to 2 seconds:**
     ```bash
     nslookup -timeout=2 example.com
     ```
  5. **Interactive mode:**
     ```bash
     nslookup
     > set type=TXT
     > example.com
     ```
  6. **Debug mode:**
     ```bash
     nslookup -debug example.com
     ```
  7. **Reverse DNS lookup:**
     ```bash
     nslookup 8.8.8.8
     ```
  8. **Specify a different port:**
     ```bash
     nslookup -port=53 example.com
     ```
  9. **Query NS records:**
     ```bash
     nslookup -type=NS example.com
     ```
  10. **Exit interactive mode:**
      ```bash
      > exit
      ```

#### **Possible Exam Tasks:**

1. **Task:** Use `nslookup` to find the NS records for `example.com`.

2. **Task:** Perform a reverse DNS lookup for IP `8.8.8.8` using `nslookup`.

3. **Task:** Query the TXT records for `example.com` in interactive mode.

4. **Task:** Use `nslookup` to query `example.com` using the DNS server at `8.8.4.4`.

5. **Task:** Set the query type to `AAAA` (IPv6 address) and find records for `example.com`.

<details>
<summary><strong>Answers:</strong></summary>

1. **Answer:**
   ```bash
   nslookup -type=NS example.com
   ```
2. **Answer:**
   ```bash
   nslookup 8.8.8.8
   ```
3. **Answer:**
   ```bash
   nslookup
   > set type=TXT
   > example.com
   ```
4. **Answer:**
   ```bash
   nslookup example.com 8.8.4.4
   ```
5. **Answer:**
   ```bash
   nslookup -type=AAAA example.com
   ```

</details>

---

### **6.6 `iptables` and `nftables` - Configure Packet Filtering Rules**

#### **6.6.1 `iptables` - IPv4 Packet Filtering**

- **Note:** `iptables` is being replaced by `nftables` in many distributions.

- **Common Options:**
  - `-L`: List rules.
  - `-A`: Append a rule.
  - `-D`: Delete a rule.
  - `-I`: Insert a rule.
  - `-F`: Flush all rules.
  - `-P`: Set default policy.
  - `-t [TABLE]`: Specify the table (`filter`, `nat`, `mangle`).
  - `-s [SOURCE]`: Specify source address.
  - `-d [DESTINATION]`: Specify destination address.
  - `-p [PROTOCOL]`: Specify protocol (`tcp`, `udp`, `icmp`).
  - `--dport [PORT]`: Specify destination port.
  - `-j [TARGET]`: Specify the target (`ACCEPT`, `DROP`, `REJECT`).

- **Examples:**
  1. **List all rules:**
     ```bash
     iptables -L
     ```
  2. **Allow incoming SSH connections:**
     ```bash
     iptables -A INPUT -p tcp --dport 22 -j ACCEPT
     ```
  3. **Block incoming traffic from IP `192.168.1.100`:**
     ```bash
     iptables -A INPUT -s 192.168.1.100 -j DROP
     ```
  4. **Set default policy to DROP for incoming traffic:**
     ```bash
     iptables -P INPUT DROP
     ```
  5. **Flush all rules:**
     ```bash
     iptables -F
     ```
  6. **Allow outgoing traffic:**
     ```bash
     iptables -A OUTPUT -j ACCEPT
     ```
  7. **Reject incoming ICMP ping requests:**
     ```bash
     iptables -A INPUT -p icmp --icmp-type echo-request -j REJECT
     ```
  8. **Insert a rule at the beginning:**
     ```bash
     iptables -I INPUT 1 -p tcp --dport 80 -j ACCEPT
     ```
  9. **Delete a specific rule:**
     ```bash
     iptables -D INPUT -p tcp --dport 22 -j ACCEPT
     ```
  10. **Save iptables rules (varies by distribution):**
      ```bash
      iptables-save > /etc/iptables/rules.v4
      ```

#### **Possible Exam Tasks:**

1. **Task:** List all current iptables rules.

2. **Task:** Add a rule to allow incoming HTTP (port 80) traffic.

3. **Task:** Block all incoming traffic from the IP `10.0.0.5`.

4. **Task:** Set the default policy for the `INPUT` chain to `DROP`.

5. **Task:** Flush all iptables rules.

<details>
<summary><strong>Answers:</strong></summary>

1. **Answer:**
   ```bash
   iptables -L
   ```
2. **Answer:**
   ```bash
   iptables -A INPUT -p tcp --dport 80 -j ACCEPT
   ```
3. **Answer:**
   ```bash
   iptables -A INPUT -s 10.0.0.5 -j DROP
   ```
4. **Answer:**
   ```bash
   iptables -P INPUT DROP
   ```
5. **Answer:**
   ```bash
   iptables -F
   ```

</details>

---

### **6.7 Networking Concepts**

#### **6.7.1 Understanding CIDR Notation**

- **CIDR** notation specifies an IP address and its associated network mask.
  - **Example:** `192.168.1.0/24` indicates a network with IP addresses from `192.168.1.0` to `192.168.1.255`.
  - The `/24` means the first 24 bits are the network portion.

#### **6.7.2 Subnet Masks**

- **Subnet Mask** determines which portion of the IP address refers to the network and which part refers to the host.
  - **Example:** A subnet mask of `255.255.255.0` corresponds to `/24` in CIDR notation.

#### **6.7.3 Default Gateway**

- **Default Gateway** is the IP address of the router that packets are sent to when the destination IP is not on the local subnet.
  - Configured using `ip route` commands.

#### **6.7.4 Routing Tables**

- The **Routing Table** determines where packets are forwarded.
  - View routing table with `ip route show`.
  - Default routes can be added or modified using `ip route`.

#### **Possible Exam Tasks:**

1. **Task:** Explain what the `/24` represents in the IP address `192.168.0.1/24`.

2. **Task:** Determine the subnet mask for a CIDR notation of `/16`.

3. **Task:** Configure a default gateway with IP `192.168.1.1`.

4. **Task:** Add a static route to the network `10.0.0.0/8` via gateway `192.168.1.254`.

5. **Task:** Display the current routing table.

<details>
<summary><strong>Answers:</strong></summary>

1. **Answer:**
   - The `/24` indicates that the first 24 bits are the network portion, corresponding to a subnet mask of `255.255.255.0`.

2. **Answer:**
   - A `/16` CIDR notation corresponds to a subnet mask of `255.255.0.0`.

3. **Answer:**
   ```bash
   ip route add default via 192.168.1.1
   ```
4. **Answer:**
   ```bash
   ip route add 10.0.0.0/8 via 192.168.1.254
   ```
5. **Answer:**
   ```bash
   ip route show
   ```

</details>

---

## Tips for Networking on the RHCSA Exam

- **Understand Networking Fundamentals:**
  - Be familiar with IP addressing, subnetting, and CIDR notation.
  - Know how to configure network interfaces and routing.

- **Practice with `ip` Commands:**
  - Since `ifconfig` is deprecated, focus on using `ip` for network configuration.
  - Be comfortable adding, deleting, and modifying IP addresses and routes.

- **Firewall Configuration:**
  - Understand how to use `iptables` or `firewalld` to manage firewall rules.
  - Know how to allow or block traffic based on ports, protocols, and IP addresses.

- **Troubleshooting Tools:**
  - Use tools like `ping`, `traceroute`, `dig`, and `ss` to diagnose network issues.
  - Be able to interpret the output of these tools to identify connectivity problems.

- **DNS Configuration:**
  - Know how to perform DNS lookups and understand DNS records.
  - Be familiar with configuring DNS settings in `/etc/resolv.conf`.

- **Network Services:**
  - Be aware of common network services and their default ports (e.g., SSH on port 22, HTTP on port 80).

- **Network Scripts and Configuration Files:**
  - Understand where network configuration files are located (e.g., `/etc/sysconfig/network-scripts/` in RHEL-based systems).
  - Know how to edit these files to persistently configure network interfaces.

---

By expanding the Networking Commands section with additional options, examples, and possible exam tasks, you can deepen your understanding of these essential networking concepts and commands for the RHCSA exam.

# Updated Study Guide: Networking Commands with `nmcli` and Modifying Network Configuration Files

As requested, I've added sections **6.8** and **6.9** covering `nmcli` and modifying network configuration files, respectively. Each section includes descriptions, common options, examples, and possible exam tasks with answers provided in collapsible sections.

---

## 6. Networking Commands (Continued)

### **6.8 `nmcli` - Command Line Interface for NetworkManager**

`nmcli` is a command-line tool for controlling NetworkManager and reporting network status. It can be used to create, display, edit, delete, activate, and deactivate network connections, as well as control and display network device status.

- **Common Commands and Options:**
  - **General Commands:**
    - `nmcli general status`: Show overall status of NetworkManager.
    - `nmcli networking on|off`: Enable or disable networking.
    - `nmcli radio wifi on|off`: Enable or disable Wi-Fi.
  - **Connection Commands:**
    - `nmcli connection show`: List all network connections.
    - `nmcli connection up [CON_NAME]`: Activate a connection.
    - `nmcli connection down [CON_NAME]`: Deactivate a connection.
    - `nmcli connection add`: Add a new network connection.
    - `nmcli connection edit`: Interactively edit a connection.
    - `nmcli connection delete [CON_NAME]`: Delete a connection.
    - `nmcli connection modify [CON_NAME] [PARAMETERS]`: Modify a connection.
  - **Device Commands:**
    - `nmcli device status`: Show status of devices.
    - `nmcli device show [DEVICE]`: Show detailed information about a device.
    - `nmcli device connect [DEVICE]`: Connect a device.
    - `nmcli device disconnect [DEVICE]`: Disconnect a device.
  - **Options:**
    - `-p`: Pretty output format.
    - `-t`: Tabular output without headers.
    - `-a`: Ask for missing parameters (e.g., passwords).
    - `--help`: Display help information.

- **Examples:**
  1. **Display overall network status:**
     ```bash
     nmcli general status
     ```
  2. **List all network connections:**
     ```bash
     nmcli connection show
     ```
  3. **Show status of all devices:**
     ```bash
     nmcli device status
     ```
  4. **Activate a connection named `eth0`:**
     ```bash
     nmcli connection up eth0
     ```
  5. **Deactivate a connection named `eth0`:**
     ```bash
     nmcli connection down eth0
     ```
  6. **Add a new Ethernet connection with static IP:**
     ```bash
     nmcli connection add type ethernet ifname eth1 con-name static-eth1 ip4 192.168.1.10/24 gw4 192.168.1.1
     ```
  7. **Modify an existing connection to use DHCP:**
     ```bash
     nmcli connection modify eth1 ipv4.method auto
     ```
  8. **Set DNS servers for a connection:**
     ```bash
     nmcli connection modify eth1 ipv4.dns "8.8.8.8 8.8.4.4"
     ```
  9. **Delete a connection named `old-connection`:**
     ```bash
     nmcli connection delete old-connection
     ```
  10. **Create a Wi-Fi hotspot:**
      ```bash
      nmcli device wifi hotspot ifname wlan0 ssid MyHotspot password "password123"
      ```

#### **Possible Exam Tasks:**

1. **Task:** List all active network connections.

2. **Task:** Create a new Ethernet connection named `office` on interface `eth0` with a static IP `10.0.0.5/24` and gateway `10.0.0.1`.

3. **Task:** Modify the `office` connection to use DNS servers `8.8.8.8` and `8.8.4.4`.

4. **Task:** Bring down the network connection named `home`.

5. **Task:** Display detailed information about the device `eth0`.

<details>
<summary><strong>Answers:</strong></summary>

1. **Answer:**
   ```bash
   nmcli connection show --active
   ```
2. **Answer:**
   ```bash
   nmcli connection add type ethernet ifname eth0 con-name office ip4 10.0.0.5/24 gw4 10.0.0.1
   ```
3. **Answer:**
   ```bash
   nmcli connection modify office ipv4.dns "8.8.8.8 8.8.4.4"
   ```
4. **Answer:**
   ```bash
   nmcli connection down home
   ```
5. **Answer:**
   ```bash
   nmcli device show eth0
   ```

</details>

---

#### **6.8.1 Adding and Configuring Connections with `nmcli`**

- **Add a DHCP Ethernet Connection:**
  ```bash
  nmcli connection add type ethernet ifname eth0 con-name dhcp-eth0 ipv4.method auto
  ```

- **Add a Static IP Ethernet Connection:**
  ```bash
  nmcli connection add type ethernet ifname eth0 con-name static-eth0 ipv4.method manual ipv4.addresses 192.168.1.100/24 gw4 192.168.1.1
  ```

- **Add a VLAN Connection:**
  ```bash
  nmcli connection add type vlan ifname vlan10 dev eth0 id 10 ip4 192.168.10.2/24 gw4 192.168.10.1
  ```

- **Configure a Bonded Interface:**
  ```bash
  nmcli connection add type bond ifname bond0 mode active-backup
  nmcli connection add type ethernet ifname eth1 master bond0
  nmcli connection add type ethernet ifname eth2 master bond0
  ```

#### **Possible Exam Tasks:**

1. **Task:** Create a new Ethernet connection named `static-eth1` on interface `eth1` with a static IP `192.168.2.50/24` and gateway `192.168.2.1`.

2. **Task:** Add a VLAN interface `vlan20` on `eth0` with VLAN ID `20` and assign IP `192.168.20.5/24`.

3. **Task:** Configure an Ethernet connection `eth1` to use DHCP.

4. **Task:** Set up a bonded interface `bond0` in mode `balance-rr` using interfaces `eth1` and `eth2`.

<details>
<summary><strong>Answers:</strong></summary>

1. **Answer:**
   ```bash
   nmcli connection add type ethernet ifname eth1 con-name static-eth1 ipv4.method manual ipv4.addresses 192.168.2.50/24 gw4 192.168.2.1
   ```
2. **Answer:**
   ```bash
   nmcli connection add type vlan ifname vlan20 dev eth0 id 20 ip4 192.168.20.5/24
   ```
3. **Answer:**
   ```bash
   nmcli connection add type ethernet ifname eth1 con-name dhcp-eth1 ipv4.method auto
   ```
4. **Answer:**
   ```bash
   nmcli connection add type bond ifname bond0 mode balance-rr
   nmcli connection add type ethernet ifname eth1 master bond0
   nmcli connection add type ethernet ifname eth2 master bond0
   ```

</details>

---

#### **6.8.2 Editing Connections Interactively with `nmcli`**

- **Start Interactive Editing:**
  ```bash
  nmcli connection edit [CON_NAME]
  ```
- **Common Interactive Commands:**
  - `print all`: Display all settings.
  - `set [PROPERTY] [VALUE]`: Set a property value.
  - `save`: Save changes.
  - `quit`: Exit the editor.

**Example: Modify DNS Settings Interactively:**

```bash
nmcli connection edit office
nmcli> set ipv4.dns 1.1.1.1
nmcli> save
nmcli> quit
```

#### **Possible Exam Tasks:**

1. **Task:** Interactively edit the connection `office` to change the IPv4 DNS to `1.1.1.1`.

2. **Task:** Change the IPv4 gateway of the connection `home` to `192.168.0.1` using interactive mode.

<details>
<summary><strong>Answers:</strong></summary>

1. **Answer:**

   ```bash
   nmcli connection edit office
   nmcli> set ipv4.dns 1.1.1.1
   nmcli> save
   nmcli> quit
   ```

2. **Answer:**

   ```bash
   nmcli connection edit home
   nmcli> set ipv4.gateway 192.168.0.1
   nmcli> save
   nmcli> quit
   ```

</details>

---

### **6.9 Modifying Network Configuration Files**

On RHEL-based systems (like CentOS and Fedora), network interfaces are configured using files in `/etc/sysconfig/network-scripts/`. Understanding how to modify these files is essential for manual network configuration.

#### **6.9.1 Network Interface Configuration Files**

- **Location:**
  - Configuration files are located in `/etc/sysconfig/network-scripts/`.
  - Files are named `ifcfg-INTERFACE_NAME`, e.g., `ifcfg-eth0`.

- **Common Configuration Parameters:**
  - `TYPE`: Interface type (e.g., `Ethernet`).
  - `BOOTPROTO`: Boot protocol (`none`, `static`, `dhcp`).
  - `ONBOOT`: Start interface on boot (`yes`, `no`).
  - `IPADDR`: IP address.
  - `PREFIX` or `NETMASK`: Network prefix length or subnet mask.
  - `GATEWAY`: Default gateway.
  - `DNS1`, `DNS2`: DNS servers.
  - `DEVICE`: Interface name.
  - `HWADDR`: MAC address.
  - `UUID`: Universally Unique Identifier.
  - `NM_CONTROLLED`: Whether NetworkManager manages the interface (`yes`, `no`).

- **Example of a Static IP Configuration (`ifcfg-eth0`):**

  ```bash
  TYPE=Ethernet
  BOOTPROTO=none
  NAME=eth0
  DEVICE=eth0
  ONBOOT=yes
  IPADDR=192.168.1.100
  PREFIX=24
  GATEWAY=192.168.1.1
  DNS1=8.8.8.8
  DNS2=8.8.4.4
  ```

#### **6.9.2 Modifying Network Configuration Files**

- **Editing Files:**
  - Use a text editor like `vi` or `nano` to modify configuration files.
    ```bash
    sudo vi /etc/sysconfig/network-scripts/ifcfg-eth0
    ```

- **Restart Network Service:**
  - After making changes, restart the network service or bring the interface down and up.
    ```bash
    sudo systemctl restart network
    ```
    Or for a specific interface:
    ```bash
    sudo ifdown eth0
    sudo ifup eth0
    ```

#### **Possible Exam Tasks:**

1. **Task:** Configure interface `eth1` with a static IP `192.168.10.5/24`, gateway `192.168.10.1`, and DNS servers `1.1.1.1` and `1.0.0.1` by editing its configuration file.

2. **Task:** Set the interface `eth0` to start on boot.

3. **Task:** Change the boot protocol of interface `eth1` to use DHCP by editing the configuration file.

4. **Task:** Disable NetworkManager control over interface `eth0`.

5. **Task:** After modifying the network configuration files, restart the network service.

<details>
<summary><strong>Answers:</strong></summary>

1. **Answer:**

   Edit `/etc/sysconfig/network-scripts/ifcfg-eth1`:

   ```bash
   DEVICE=eth1
   TYPE=Ethernet
   BOOTPROTO=none
   ONBOOT=yes
   IPADDR=192.168.10.5
   PREFIX=24
   GATEWAY=192.168.10.1
   DNS1=1.1.1.1
   DNS2=1.0.0.1
   ```

2. **Answer:**

   In `/etc/sysconfig/network-scripts/ifcfg-eth0`, set:

   ```bash
   ONBOOT=yes
   ```

3. **Answer:**

   In `/etc/sysconfig/network-scripts/ifcfg-eth1`, change:

   ```bash
   BOOTPROTO=dhcp
   ```

4. **Answer:**

   In `/etc/sysconfig/network-scripts/ifcfg-eth0`, add or set:

   ```bash
   NM_CONTROLLED=no
   ```

5. **Answer:**

   Restart the network service:

   ```bash
   sudo systemctl restart network
   ```
   Or bring the interface down and up:

   ```bash
   sudo ifdown eth0
   sudo ifup eth0
   ```

</details>

---

#### **6.9.3 Configuring DNS Resolution**

- **Modify `/etc/resolv.conf`:**
  - Contains DNS server information.
  - **Note:** This file may be overwritten by NetworkManager; it's better to configure DNS servers in the interface configuration files or via `nmcli`.

- **Example `/etc/resolv.conf`:**

  ```bash
  nameserver 8.8.8.8
  nameserver 8.8.4.4
  ```

- **Prevent Overwriting `/etc/resolv.conf`:**

  - Set `PEERDNS=no` in the interface configuration file.

#### **Possible Exam Tasks:**

1. **Task:** Configure the system to use DNS servers `8.8.8.8` and `8.8.4.4` by editing `/etc/resolv.conf`.

2. **Task:** Prevent the network interface `eth0` from overwriting `/etc/resolv.conf`.

<details>
<summary><strong>Answers:</strong></summary>

1. **Answer:**

   Edit `/etc/resolv.conf`:

   ```bash
   nameserver 8.8.8.8
   nameserver 8.8.4.4
   ```

2. **Answer:**

   In `/etc/sysconfig/network-scripts/ifcfg-eth0`, add:

   ```bash
   PEERDNS=no
   ```

</details>

---

#### **6.9.4 Configuring Hostname and Hosts File**

- **Set the Hostname:**

  - Temporary change:

    ```bash
    sudo hostnamectl set-hostname newhostname
    ```

  - Verify:

    ```bash
    hostnamectl
    ```

- **Edit `/etc/hosts`:**

  - Map hostnames to IP addresses locally.

  - Example Entry:

    ```bash
    127.0.0.1   localhost
    192.168.1.100   myserver
    ```

#### **Possible Exam Tasks:**

1. **Task:** Set the system hostname to `server1.example.com`.

2. **Task:** Add an entry in `/etc/hosts` to map `192.168.1.200` to `dbserver`.

<details>
<summary><strong>Answers:</strong></summary>

1. **Answer:**

   ```bash
   sudo hostnamectl set-hostname server1.example.com
   ```

2. **Answer:**

   Edit `/etc/hosts` and add:

   ```bash
   192.168.1.200   dbserver
   ```

</details>

---

### **Additional Networking Configuration Tools**

#### **6.9.5 `nmtui` - NetworkManager Text User Interface**

A text-based user interface for NetworkManager.

- **Start `nmtui`:**
  ```bash
  sudo nmtui
  ```

- **Common Tasks:**
  - Edit a connection.
  - Activate a connection.
  - Set system hostname.

#### **Possible Exam Tasks:**

1. **Task:** Use `nmtui` to edit the connection `eth0` and set a static IP.

2. **Task:** Use `nmtui` to set the system hostname to `host.example.com`.

<details>
<summary><strong>Answers:</strong></summary>

1. **Answer:**

   - Run `sudo nmtui`.
   - Select "Edit a connection".
   - Choose `eth0`.
   - Modify IPv4 settings to manual and enter the static IP.
   - Save and exit.

2. **Answer:**

   - Run `sudo nmtui`.
   - Select "Set system hostname".
   - Enter `host.example.com`.
   - Save and exit.

</details>

---

## Tips for Networking Configuration on the RHCSA Exam

- **Familiarize with `nmcli`:**
  - Practice creating, modifying, and deleting connections.
  - Understand how to configure static and dynamic IP addresses.

- **Editing Configuration Files:**
  - Know the location and structure of network configuration files.
  - Be comfortable using text editors to make changes.

- **Persisting Network Settings:**
  - Remember that changes made via `ip` commands are not persistent.
  - Use `nmcli` or edit configuration files for persistent changes.

- **DNS Configuration:**
  - Configure DNS servers in connection settings or interface configuration files.
  - Avoid manual edits to `/etc/resolv.conf` unless necessary.

- **Hostname Configuration:**
  - Use `hostnamectl` to set the system hostname.
  - Update `/etc/hosts` if necessary.

- **Network Services:**
  - Understand how to restart network services to apply changes.
  - Be aware of the differences between `NetworkManager` and traditional network scripts.

---

By adding sections **6.8** and **6.9** on `nmcli` and modifying network configuration files, respectively, we've expanded the Networking Commands section to cover essential tools and concepts for network configuration. This will help you deepen your understanding and prepare for the RHCSA exam.