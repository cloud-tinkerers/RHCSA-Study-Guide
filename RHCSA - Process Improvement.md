## Process Management with Possible Exam Tasks

As per your request, I've split the **Process Management** section into two parts:

1. **Primary Process Management Commands**: Covering `ps`, `top`, `kill`, and other essential commands.
2. **Additional Process Management Commands**: Covering secondary commands.

Each command includes a description, top options (between five and ten), at least five examples, and possible exam tasks with answers provided in collapsible sections.

---

## 4. Process Management - Primary Commands

### **4.1 `ps` - Report Process Status**

Displays information about active processes.

- **Common Options:**
  - `-e`: Select all processes.
  - `-f`: Full-format listing.
  - `-u [USER]`: Display processes for a specific user.
  - `-p [PID]`: Select processes by PID.
  - `-a`: Show processes of all users.
  - `-x`: Include processes without a controlling terminal.
  - `--forest`: Display process hierarchy.
  - `-o [FORMAT]`: User-defined format.
  - `--sort`: Sort output.
  - `--help`: Display help information.

- **Examples:**
  1. **View all running processes:**
     ```bash
     ps -e
     ```
  2. **Display processes in full-format listing:**
     ```bash
     ps -ef
     ```
  3. **Show processes for a specific user (e.g., `root`):**
     ```bash
     ps -u root
     ```
  4. **Display a process by its PID:**
     ```bash
     ps -p 1234
     ```
  5. **View processes in a hierarchical tree:**
     ```bash
     ps -ef --forest
     ```
  6. **Show all processes including those without a terminal:**
     ```bash
     ps -aux
     ```
  7. **Custom output format (PID, user, and command):**
     ```bash
     ps -e -o pid,user,cmd
     ```
  8. **Sort processes by memory usage:**
     ```bash
     ps -e --sort=-%mem
     ```
  9. **Display help information:**
     ```bash
     ps --help
     ```
  10. **Show all processes except session leaders:**
      ```bash
      ps -e -N
      ```

#### **Possible Exam Tasks:**

1. **Task:** Display all processes running on the system in full-format listing.

2. **Task:** Show all processes owned by the user `alice`.

3. **Task:** Display the process hierarchy in a tree format.

4. **Task:** Find the PID and command of processes consuming the most memory.

5. **Task:** List all processes without a controlling terminal.

<details>
<summary><strong>Answers:</strong></summary>

1. **Answer:**
   ```bash
   ps -ef
   ```
2. **Answer:**
   ```bash
   ps -u alice
   ```
3. **Answer:**
   ```bash
   ps -ef --forest
   ```
4. **Answer:**
   ```bash
   ps -e -o pid,cmd,%mem --sort=-%mem
   ```
5. **Answer:**
   ```bash
   ps -x
   ```

</details>

---

### **4.2 `top` - Display Real-Time Process Information**

Provides a dynamic, real-time view of running processes.

- **Common Interactions:**
  - **`h`**: Display help within `top`.
  - **`q`**: Quit `top`.
  - **`P`**: Sort by CPU usage.
  - **`M`**: Sort by memory usage.
  - **`N`**: Sort by PID.
  - **`T`**: Sort by running time.
  - **`k`**: Kill a process.
  - **`u`**: Display processes for a specific user.
  - **`f`**: Edit fields displayed.
  - **`d`**: Change refresh interval.
  - **`s`**: Change the delay between updates.

- **Common Options:**
  - `-b`: Batch mode operation (useful for sending output to other programs or files).
  - `-n [NUMBER]`: Number of iterations before exiting.
  - `-u [USER]`: Show only processes of a given user.
  - `-p [PID]`: Monitor specific PIDs.
  - `-d [SECONDS]`: Delay between updates.
  - `-c`: Toggle display of command line and program name.

- **Examples:**
  1. **Start `top`:**
     ```bash
     top
     ```
  2. **Sort processes by memory usage:**
     - Press `M` while `top` is running.
  3. **Display processes for user `bob`:**
     ```bash
     top -u bob
     ```
  4. **Run `top` in batch mode for 1 iteration and output to a file:**
     ```bash
     top -b -n 1 > top_output.txt
     ```
  5. **Monitor specific processes with PIDs 1234 and 5678:**
     ```bash
     top -p 1234,5678
     ```
  6. **Change refresh interval to 5 seconds:**
     - Press `d`, then enter `5`.
  7. **Kill a process from within `top`:**
     - Press `k`, enter the PID, and confirm.
  8. **Toggle display of command line and program name:**
     - Press `c`.
  9. **Exit `top`:**
     - Press `q`.
  10. **Get help within `top`:**
      - Press `h`.

#### **Possible Exam Tasks:**

1. **Task:** Use `top` to display processes sorted by memory usage.

2. **Task:** Run `top` in batch mode and save the output to `processes.txt`.

3. **Task:** Within `top`, filter to show only processes owned by `alice`.

4. **Task:** Change the update interval in `top` to 2 seconds.

5. **Task:** Kill a process with PID 4321 from within `top`.

<details>
<summary><strong>Answers:</strong></summary>

1. **Answer:**
   - Start `top` and press `M`.
2. **Answer:**
   ```bash
   top -b -n 1 > processes.txt
   ```
3. **Answer:**
   ```bash
   top -u alice
   ```
4. **Answer:**
   - Within `top`, press `d`, then enter `2`.
5. **Answer:**
   - Within `top`, press `k`, enter `4321`, and confirm.

</details>

---

### **4.3 `kill` - Terminate Processes**

Sends signals to processes by PID.

- **Common Options:**
  - `[PID]`: PID of the process to signal (default signal is `TERM`).
  - `-s [SIGNAL] [PID]`: Send the specified signal.
  - `-l`: List all signal names.
  - `-L`: List all signal names and numbers.
  - `-9 [PID]`: Send `SIGKILL` signal to forcefully terminate.
  - `-15 [PID]`: Send `SIGTERM` signal to gracefully terminate.
  - `--help`: Display help information.

- **Examples:**
  1. **Terminate a process with PID 1234:**
     ```bash
     kill 1234
     ```
  2. **Forcefully kill a process:**
     ```bash
     kill -9 1234
     ```
  3. **Send a specific signal (e.g., `HUP`):**
     ```bash
     kill -s HUP 1234
     ```
  4. **List all signal names:**
     ```bash
     kill -l
     ```
  5. **Gracefully terminate a process:**
     ```bash
     kill -15 1234
     ```
  6. **Kill multiple processes:**
     ```bash
     kill 1234 5678 9012
     ```
  7. **Send `SIGSTOP` to pause a process:**
     ```bash
     kill -s STOP 1234
     ```
  8. **Resume a stopped process with `SIGCONT`:**
     ```bash
     kill -s CONT 1234
     ```
  9. **Display help information:**
     ```bash
     kill --help
     ```
  10. **Terminate a process using signal number:**
      ```bash
      kill -15 1234
      ```

#### **Possible Exam Tasks:**

1. **Task:** Gracefully terminate a process with PID 5678.

2. **Task:** Forcefully kill a non-responsive process with PID 4321.

3. **Task:** Send a hang-up signal to process 3456 to trigger a configuration reload.

4. **Task:** List all available signals that can be sent with `kill`.

5. **Task:** Pause and then resume a process with PID 7890.

<details>
<summary><strong>Answers:</strong></summary>

1. **Answer:**
   ```bash
   kill -15 5678
   ```
2. **Answer:**
   ```bash
   kill -9 4321
   ```
3. **Answer:**
   ```bash
   kill -s HUP 3456
   ```
4. **Answer:**
   ```bash
   kill -l
   ```
5. **Answer:**
   ```bash
   kill -s STOP 7890
   kill -s CONT 7890
   ```

</details>

---

### **4.4 `killall` - Kill Processes by Name**

Terminates all processes with the given name.

- **Common Options:**
  - `[NAME]`: Name of the process to kill.
  - `-u [USER]`: Kill only processes owned by the specified user.
  - `-e [NAME]`: Require an exact match for the process name.
  - `-I`: Ignore case distinctions in process names.
  - `-s [SIGNAL]`: Send the specified signal.
  - `-v`: Verbose mode.
  - `-i`: Interactive mode; ask for confirmation before killing.
  - `--help`: Display help information.

- **Examples:**
  1. **Kill all processes named `httpd`:**
     ```bash
     killall httpd
     ```
  2. **Forcefully kill all processes named `java`:**
     ```bash
     killall -9 java
     ```
  3. **Kill processes named `mysqld` owned by `mysql` user:**
     ```bash
     killall -u mysql mysqld
     ```
  4. **Require exact match for process name:**
     ```bash
     killall -e nginx
     ```
  5. **Ignore case when matching process names:**
     ```bash
     killall -I firefox
     ```
  6. **Interactive mode:**
     ```bash
     killall -i python
     ```
  7. **Verbose output:**
     ```bash
     killall -v chrome
     ```
  8. **Send a specific signal:**
     ```bash
     killall -s HUP sshd
     ```
  9. **Kill all processes named `vim` except those owned by `root`:**
     ```bash
     sudo killall -u $(whoami) vim
     ```
  10. **Display help information:**
      ```bash
      killall --help
      ```

#### **Possible Exam Tasks:**

1. **Task:** Kill all instances of the `apache2` process.

2. **Task:** Forcefully kill all `node` processes.

3. **Task:** Interactively kill all `python` processes, confirming each one.

4. **Task:** Kill all processes named `ssh-agent` for user `bob`.

5. **Task:** Send a `SIGHUP` signal to all `nginx` processes.

<details>
<summary><strong>Answers:</strong></summary>

1. **Answer:**
   ```bash
   killall apache2
   ```
2. **Answer:**
   ```bash
   killall -9 node
   ```
3. **Answer:**
   ```bash
   killall -i python
   ```
4. **Answer:**
   ```bash
   killall -u bob ssh-agent
   ```
5. **Answer:**
   ```bash
   killall -s HUP nginx
   ```

</details>

---

### **4.5 `pkill` - Kill Processes Based on Name and Other Attributes**

Terminates processes based on a pattern matching.

- **Common Options:**
  - `[PATTERN]`: Pattern to match process names or attributes.
  - `-u [USER]`: Match processes owned by the specified user.
  - `-t [TERMINAL]`: Match processes running on the specified terminal.
  - `-f`: Match against the full command line.
  - `-9`: Send `SIGKILL` signal.
  - `-x`: Require an exact match of the process name.
  - `-c`: Count of matching processes.
  - `-l`: List the names of matching processes.
  - `-n`: Kill the newest matching process.
  - `-o`: Kill the oldest matching process.
  - `-s [SIGNAL]`: Send the specified signal.
  - `--help`: Display help information.

- **Examples:**
  1. **Kill processes matching `ssh`:**
     ```bash
     pkill ssh
     ```
  2. **Kill all processes owned by `alice` matching `python`:**
     ```bash
     pkill -u alice python
     ```
  3. **Forcefully kill processes matching `java`:**
     ```bash
     pkill -9 java
     ```
  4. **Kill processes with exact name `mysqld`:**
     ```bash
     pkill -x mysqld
     ```
  5. **Match against the full command line:**
     ```bash
     pkill -f "/usr/bin/python script.py"
     ```
  6. **Kill the newest process matching `vim`:**
     ```bash
     pkill -n vim
     ```
  7. **List matching processes without killing:**
     ```bash
     pkill -l apache
     ```
  8. **Send a specific signal to matching processes:**
     ```bash
     pkill -s HUP sshd
     ```
  9. **Kill processes running on terminal `pts/0`:**
     ```bash
     pkill -t pts/0
     ```
  10. **Count the number of matching processes:**
      ```bash
      pkill -c cron
      ```

#### **Possible Exam Tasks:**

1. **Task:** Kill all processes matching `chrome` owned by the current user.

2. **Task:** Forcefully kill the oldest `bash` process.

3. **Task:** Kill processes that have `/opt/app/run.sh` in their command line.

4. **Task:** Kill the most recently started `mysql` process.

5. **Task:** List all processes matching `java` without killing them.

<details>
<summary><strong>Answers:</strong></summary>

1. **Answer:**
   ```bash
   pkill chrome
   ```
2. **Answer:**
   ```bash
   pkill -9 -o bash
   ```
3. **Answer:**
   ```bash
   pkill -f "/opt/app/run.sh"
   ```
4. **Answer:**
   ```bash
   pkill -n mysql
   ```
5. **Answer:**
   ```bash
   pkill -l java
   ```

</details>

---

### **4.6 `pgrep` - List Processes Based on Name and Other Attributes**

Lists PIDs of processes based on a pattern matching.

- **Common Options:**
  - `[PATTERN]`: Pattern to match process names or attributes.
  - `-u [USER]`: Match processes owned by the specified user.
  - `-t [TERMINAL]`: Match processes running on the specified terminal.
  - `-f`: Match against the full command line.
  - `-x`: Require an exact match of the process name.
  - `-c`: Count of matching processes.
  - `-l`: List PID and process name.
  - `-a`: Include arguments in the output.
  - `-n`: Return the newest matching process.
  - `-o`: Return the oldest matching process.
  - `--help`: Display help information.

- **Examples:**
  1. **List PIDs of processes matching `ssh`:**
     ```bash
     pgrep ssh
     ```
  2. **List processes owned by `bob` matching `python`:**
     ```bash
     pgrep -u bob python
     ```
  3. **List PIDs with exact name `nginx`:**
     ```bash
     pgrep -x nginx
     ```
  4. **Match against the full command line:**
     ```bash
     pgrep -f "/usr/bin/python script.py"
     ```
  5. **Count matching processes:**
     ```bash
     pgrep -c cron
     ```
  6. **List PID and process name:**
     ```bash
     pgrep -l mysql
     ```
  7. **Include arguments in the output:**
     ```bash
     pgrep -a java
     ```
  8. **Get the PID of the newest `bash` process:**
     ```bash
     pgrep -n bash
     ```
  9. **Get the PID of the oldest `sshd` process:**
     ```bash
     pgrep -o sshd
     ```
  10. **Display help information:**
      ```bash
      pgrep --help
      ```

#### **Possible Exam Tasks:**

1. **Task:** List all PIDs of processes named `httpd`.

2. **Task:** Count the number of `cron` processes running.

3. **Task:** Find the PID of the most recently started `mysql` process.

4. **Task:** List PIDs and names of processes owned by `alice` matching `vim`.

5. **Task:** Find PIDs of processes with `/usr/bin/python` in their command line.

<details>
<summary><strong>Answers:</strong></summary>

1. **Answer:**
   ```bash
   pgrep httpd
   ```
2. **Answer:**
   ```bash
   pgrep -c cron
   ```
3. **Answer:**
   ```bash
   pgrep -n mysql
   ```
4. **Answer:**
   ```bash
   pgrep -u alice -l vim
   ```
5. **Answer:**
   ```bash
   pgrep -f "/usr/bin/python"
   ```

</details>

---

### **4.7 `nice` and `renice` - Set Process Priority**

- **`nice`**: Run a program with modified scheduling priority.
- **`renice`**: Alter priority of running processes.

- **Common Options for `nice`:**
  - `-n [ADJUSTMENT]`: Set the nice value (default is 10).
  - `--help`: Display help information.

- **Examples for `nice`:**
  1. **Run a command with default increased niceness:**
     ```bash
     nice command
     ```
  2. **Run a command with specific niceness (e.g., 15):**
     ```bash
     nice -n 15 command
     ```
  3. **Run a command with negative niceness (requires root):**
     ```bash
     sudo nice -n -5 command
     ```
  4. **Display help information:**
     ```bash
     nice --help
     ```

- **Common Options for `renice`:**
  - `-n [ADJUSTMENT]`: Set the nice value.
  - `-p [PID]`: Target processes by PID.
  - `-u [USER]`: Target all processes owned by user.
  - `-g [PGID]`: Target processes by process group ID.
  - `--help`: Display help information.

- **Examples for `renice`:**
  1. **Change priority of a process with PID 1234 to 10:**
     ```bash
     renice -n 10 -p 1234
     ```
  2. **Increase priority (lower nice value) of process (requires root):**
     ```bash
     sudo renice -n -5 -p 1234
     ```
  3. **Change priority of all processes owned by `bob`:**
     ```bash
     renice -n 15 -u bob
     ```
  4. **Change priority of processes in a group:**
     ```bash
     renice -n 5 -g 1000
     ```
  5. **Display help information:**
     ```bash
     renice --help
     ```

#### **Possible Exam Tasks:**

1. **Task:** Run `backup.sh` with a niceness of 15.

2. **Task:** Change the niceness of process with PID 5678 to -5 (requires root).

3. **Task:** Increase the niceness of all processes owned by `alice` to 10.

4. **Task:** Start `data_process` with a lower priority.

5. **Task:** Adjust the priority of a process group with PGID 2000 to 5.

<details>
<summary><strong>Answers:</strong></summary>

1. **Answer:**
   ```bash
   nice -n 15 ./backup.sh
   ```
2. **Answer:**
   ```bash
   sudo renice -n -5 -p 5678
   ```
3. **Answer:**
   ```bash
   renice -n 10 -u alice
   ```
4. **Answer:**
   ```bash
   nice data_process
   ```
5. **Answer:**
   ```bash
   renice -n 5 -g 2000
   ```

</details>

---

### **4.8 `htop` - Interactive Process Viewer (if available)**

An enhanced version of `top` with more features (may need to be installed).

- **Common Features:**
  - Colorful display.
  - Mouse support.
  - Horizontal and vertical scrolling.
  - Easy process management (kill, renice).
  - Filtering and sorting options.
  - Tree view of processes.

- **Common Interactions:**
  - **`F1`**: Help.
  - **`F2`**: Setup.
  - **`F3`**: Search for a process.
  - **`F4`**: Filter processes.
  - **`F5`**: Tree view.
  - **`F6`**: Sort by criteria.
  - **`F9`**: Kill a process.
  - **`F10`**: Quit `htop`.

- **Examples:**
  1. **Start `htop`:**
     ```bash
     htop
     ```
  2. **Search for a process by name:**
     - Press `F3`, type the process name.
  3. **Filter processes:**
     - Press `F4`, enter filter criteria.
  4. **Kill a process:**
     - Select process, press `F9`, choose signal.
  5. **Sort processes by memory usage:**
     - Press `F6`, select `%MEM`.

#### **Possible Exam Tasks:**

1. **Task:** Use `htop` to display processes in a tree view.

2. **Task:** Find and kill a process named `test_app` using `htop`.

3. **Task:** Sort processes by CPU usage in `htop`.

4. **Task:** Filter processes to show only those owned by `root`.

5. **Task:** Exit `htop`.

<details>
<summary><strong>Answers:</strong></summary>

1. **Answer:**
   - Start `htop`, press `F5`.
2. **Answer:**
   - Start `htop`, press `F3`, type `test_app`, select the process, press `F9`, choose signal.
3. **Answer:**
   - Press `F6`, select `%CPU`.
4. **Answer:**
   - Press `F4`, type `root`.
5. **Answer:**
   - Press `F10` or `q`.

</details>

---
### **4.9 `jobs` - List Active Jobs**

Displays status of jobs started in the current shell session.

- **Examples:**
  1. **List all active jobs:**
     ```bash
     jobs
     ```
  2. **List jobs with process IDs:**
     ```bash
     jobs -l
     ```
  3. **Bring a job to the foreground:**
     ```bash
     fg %1
     ```
  4. **Send a job to the background:**
     ```bash
     bg %1
     ```
  5. **Start a command in the background:**
     ```bash
     command &
     ```

### **4.10 `pstree` - Display a Tree of Processes**

Shows processes in a tree format.

- **Examples:**
  1. **Display all processes in a tree:**
     ```bash
     pstree
     ```
  2. **Show PIDs along with process names:**
     ```bash
     pstree -p
     ```
  3. **Display processes for a specific user:**
     ```bash
     pstree alice
     ```
  4. **Highlight running tasks:**
     ```bash
     pstree -H $$  # Highlights current shell
     ```
  5. **Visual ASCII lines:**
     ```bash
     pstree -A
     ```

### **4.11 `lsof` - List Open Files**

Lists information about files opened by processes.

- **Examples:**
  1. **List all open files:**
     ```bash
     lsof
     ```
  2. **List files opened by a specific process:**
     ```bash
     lsof -p 1234
     ```
  3. **Find processes using a specific file:**
     ```bash
     lsof /var/log/syslog
     ```
  4. **List open network connections:**
     ```bash
     lsof -i
     ```
  5. **List files opened by a user:**
     ```bash
     lsof -u alice
     ```

---

## Tips for Process Management:

- **Understanding Signals:** Familiarize yourself with common signals like `SIGTERM` (15), `SIGKILL` (9), and `SIGHUP` (1).
- **Process Identification:** Know how to find processes by name, PID, and user.
- **Process Control:** Practice starting, stopping, pausing, and resuming processes.
- **Monitoring Tools:** Be comfortable using both `top` and `htop` for real-time monitoring.
- **Priority Adjustment:** Understand how to use `nice` and `renice` to adjust process priorities.

---

By splitting the Process Management section and expanding on each command with additional options, examples, and possible exam tasks, you can deepen your understanding of these essential commands for the RHCSA exam.