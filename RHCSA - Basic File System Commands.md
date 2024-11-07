## Basic File System Commands with Possible Exam Tasks

As per your request, I've added a "Possible Exam Tasks" subsection to each command in the **Basic File System Commands** section. Each task involves using one or more commands to achieve a specific goal, similar to what might be encountered on the RHCSA exam. The answers are provided after the questions.

---

## 1. Basic File System Commands

### **1.1 `ls` - List Directory Contents**

Lists files and directories within the file system.

- **Common Options:**
  - `-l`: Use a long listing format.
  - `-a`: Include hidden files (those starting with a dot).
  - `-h`: Display sizes in human-readable format (e.g., KB, MB).
  - `-t`: Sort by modification time, newest first.
  - `-r`: Reverse the order while sorting.
  - `-S`: Sort by file size, largest first.
  - `-R`: List subdirectories recursively.
  - `-d`: List directories themselves, not their contents.
  - `-1`: Output one entry per line.
  - `--color=auto`: Display different file types in color.

- **Examples:**
  1. **List files and directories with detailed information:**
     ```bash
     ls -l
     ```
  2. **List all files including hidden ones in human-readable format:**
     ```bash
     ls -lah
     ```
  3. **List files sorted by modification time (newest first):**
     ```bash
     ls -lt
     ```
  4. **Recursively list all files and directories:**
     ```bash
     ls -R
     ```
  5. **List only directories:**
     ```bash
     ls -d */
     ```
  6. **List files sorted by size:**
     ```bash
     ls -lS
     ```
  7. **List files in reverse order:**
     ```bash
     ls -lr
     ```
  8. **Display files with color-coded output:**
     ```bash
     ls --color=auto
     ```
  9. **List one file per line:**
     ```bash
     ls -1
     ```
  10. **List detailed information for a specific file:**
      ```bash
      ls -l myfile.txt
      ```

#### **Possible Exam Tasks:**

1. **Task:** List all files (including hidden ones) in the `/etc` directory in long format, sorted by file size, largest first.
2. **Task:** Display only the directories in the current working directory.
3. **Task:** Recursively list all files and directories in `/var/log` and save the output to a file named `log_contents.txt`.
4. **Task:** List the five most recently modified files in your home directory.
5. **Task:** Use a single command to list all files in `/usr/bin` that start with the letter 'a' and display them one per line.

<details>
<summary><strong>Answers:</strong></summary>

1. **Answer:**
   ```bash
   ls -lahS /etc
   ```
2. **Answer:**
   ```bash
   ls -d */
   ```
3. **Answer:**
   ```bash
   ls -R /var/log > log_contents.txt
   ```
4. **Answer:**
   ```bash
   ls -lt ~ | head -n 5
   ```
5. **Answer:**
   ```bash
   ls -1 /usr/bin/a*
   ```

</details>

---

### **1.2 `cd` - Change Directory**

Changes the current working directory.

- **Common Usages:**
  - `cd [directory]`: Change to the specified directory.
  - `cd`: Change to the home directory.
  - `cd ~`: Change to the home directory.
  - `cd ..`: Move up one directory level.
  - `cd -`: Switch to the previous directory.
  - `cd ../..`: Move up two directory levels.
  - `cd /`: Change to the root directory.

- **Examples:**
  1. **Change to the `/var/log` directory:**
     ```bash
     cd /var/log
     ```
  2. **Move up one directory level:**
     ```bash
     cd ..
     ```
  3. **Return to the home directory:**
     ```bash
     cd
     ```
  4. **Change to the previous directory:**
     ```bash
     cd -
     ```
  5. **Change to a directory with spaces in its name:**
     ```bash
     cd "My Documents"
     # or
     cd My\ Documents
     ```
  6. **Change to the user's Desktop directory:**
     ```bash
     cd ~/Desktop
     ```
  7. **Move up two directories:**
     ```bash
     cd ../..
     ```
  8. **Change to the root directory:**
     ```bash
     cd /
     ```
  9. **Change to a directory using an absolute path:**
     ```bash
     cd /usr/local/bin
     ```
  10. **Change to a directory using a relative path:**
      ```bash
      cd projects/java
      ```

#### **Possible Exam Tasks:**

1. **Task:** Navigate to the parent directory of your current directory.
2. **Task:** Change to the `/etc/` directory using a relative path from your home directory.
3. **Task:** Switch back to the previous directory you were in before the current one.
4. **Task:** Move up three directory levels from your current location.
5. **Task:** Change to the user's home directory without using the `~` symbol.

<details>
<summary><strong>Answers:</strong></summary>

1. **Answer:**
   ```bash
   cd ..
   ```
2. **Answer:**
   ```bash
   cd ../../etc
   ```
   *Assuming you are in `/home/user`, adjust the number of `../` as needed.*
3. **Answer:**
   ```bash
   cd -
   ```
4. **Answer:**
   ```bash
   cd ../../..
   ```
5. **Answer:**
   ```bash
   cd $HOME
   # or simply
   cd
   ```

</details>

---

### **1.3 `pwd` - Print Working Directory**

Displays the full path of the current directory.

- **Common Options:**
  - `-P`: Show the physical path, resolving symbolic links.
  - `-L`: Show the logical path (default), including symbolic links.

- **Examples:**
  1. **Display the current working directory:**
     ```bash
     pwd
     ```
  2. **Show the physical path, resolving any symlinks:**
     ```bash
     pwd -P
     ```
  3. **Show the logical path (includes symlinks):**
     ```bash
     pwd -L
     ```
  4. **Use `pwd` in a script to get the current directory:**
     ```bash
     CURRENT_DIR=$(pwd)
     echo "The script is running in $CURRENT_DIR"
     ```
  5. **Combine with other commands:**
     ```bash
     echo "You are here: $(pwd)"
     ```
  6. **Check if you are in the home directory:**
     ```bash
     if [ "$(pwd)" = "$HOME" ]; then echo "In home directory"; fi
     ```
  7. **Use with `cd` to display the path after changing directories:**
     ```bash
     cd /etc && pwd
     ```

#### **Possible Exam Tasks:**

1. **Task:** Display the full physical path of the current directory, resolving any symbolic links.
2. **Task:** Write a command that prints "Current directory is: [path]" where [path] is your current directory.
3. **Task:** Check if your current directory is `/root` and display a message if it is.
4. **Task:** Store the current directory path in a variable named `CUR_DIR`.
5. **Task:** Change to `/usr/bin` and display the new current directory in one command.

<details>
<summary><strong>Answers:</strong></summary>

1. **Answer:**
   ```bash
   pwd -P
   ```
2. **Answer:**
   ```bash
   echo "Current directory is: $(pwd)"
   ```
3. **Answer:**
   ```bash
   if [ "$(pwd)" = "/root" ]; then echo "You are in the root directory"; fi
   ```
4. **Answer:**
   ```bash
   CUR_DIR=$(pwd)
   ```
5. **Answer:**
   ```bash
   cd /usr/bin && pwd
   ```

</details>

---

### **1.4 `mkdir` - Make Directories**

Creates new directories.

- **Common Options:**
  - `-p`: Create parent directories as needed.
  - `-v`: Verbose mode, print a message for each created directory.
  - `-m`: Set the file mode (permissions) of the new directories.
  - `-Z`: Set SELinux security context.
  - `--help`: Display help information.

- **Examples:**
  1. **Create a single directory:**
     ```bash
     mkdir new_folder
     ```
  2. **Create nested directories:**
     ```bash
     mkdir -p projects/java/src
     ```
  3. **Create a directory with specific permissions:**
     ```bash
     mkdir -m 755 public_html
     ```
  4. **Verbosely create directories and see output:**
     ```bash
     mkdir -v data/backups
     ```
  5. **Create multiple directories at once:**
     ```bash
     mkdir dir1 dir2 dir3
     ```
  6. **Create directories using brace expansion:**
     ```bash
     mkdir project_{A,B,C}
     ```
  7. **Set SELinux context while creating a directory:**
     ```bash
     mkdir -Z unconfined_u:object_r:httpd_sys_content_t:s0 /var/www/html
     ```
  8. **Display help information:**
     ```bash
     mkdir --help
     ```
  9. **Create directories with spaces in names:**
     ```bash
     mkdir "New Project"
     ```
  10. **Create directories with a timestamp in the name:**
      ```bash
      mkdir "backup_$(date +%Y%m%d)"
      ```

#### **Possible Exam Tasks:**

1. **Task:** Create a directory named `logs` in `/var` with permissions set to `700`.
2. **Task:** Create a nested directory structure `/opt/projects/python/app` in one command.
3. **Task:** Create multiple directories named `user1`, `user2`, and `user3` inside `/home`.
4. **Task:** Verbosely create a directory named `backup` in your current directory and confirm it was created.
5. **Task:** Create a directory with today's date as its name in `/tmp`.

<details>
<summary><strong>Answers:</strong></summary>

1. **Answer:**
   ```bash
   mkdir -m 700 /var/logs
   ```
2. **Answer:**
   ```bash
   mkdir -p /opt/projects/python/app
   ```
3. **Answer:**
   ```bash
   mkdir /home/user1 /home/user2 /home/user3
   ```
4. **Answer:**
   ```bash
   mkdir -v backup
   ```
5. **Answer:**
   ```bash
   mkdir "/tmp/$(date +%Y%m%d)"
   ```

</details>

---

### **1.5 `rmdir` and `rm` - Remove Directories and Files**

- **`rmdir`** removes empty directories.
- **`rm`** removes files and directories.

- **Common Options for `rm`:**
  - `-r` or `-R`: Recursive removal (for directories and their contents).
  - `-f`: Force removal without prompting.
  - `-i`: Prompt before every removal.
  - `-I`: Prompt once before removing more than three files or recursively.
  - `-v`: Verbose mode, explain what is being done.
  - `--preserve-root`: Do not remove `/` (default).
  - `--no-preserve-root`: Override the default and allow `/` to be removed.
  - `--help`: Display help information.

- **Examples:**
  1. **Remove an empty directory:**
     ```bash
     rmdir empty_folder
     ```
  2. **Remove a file:**
     ```bash
     rm unwanted_file.txt
     ```
  3. **Remove a directory and its contents recursively:**
     ```bash
     rm -r old_project/
     ```
  4. **Forcefully remove a directory without prompts:**
     ```bash
     rm -rf /tmp/test_dir
     ```
  5. **Remove multiple files:**
     ```bash
     rm file1.txt file2.txt file3.txt
     ```
  6. **Prompt before each removal:**
     ```bash
     rm -i important_file.txt
     ```
  7. **Verbosely remove files:**
     ```bash
     rm -v old_file.txt
     ```
  8. **Display help information:**
     ```bash
     rm --help
     ```
  9. **Remove files matching a pattern:**
     ```bash
     rm *.tmp
     ```
  10. **Prompt once before recursively removing a directory:**
      ```bash
      rm -I -r large_folder/
      ```

#### **Possible Exam Tasks:**

1. **Task:** Remove an empty directory named `temp` in your home directory.
2. **Task:** Forcefully and recursively delete the directory `/var/tmp/data` without being prompted.
3. **Task:** Remove all `.log` files in `/var/log` that start with `error`.
4. **Task:** Prompt before deleting each file in the current directory.
5. **Task:** Verbosely delete a file named `old_backup.tar.gz` and confirm its deletion.

<details>
<summary><strong>Answers:</strong></summary>

1. **Answer:**
   ```bash
   rmdir ~/temp
   ```
2. **Answer:**
   ```bash
   rm -rf /var/tmp/data
   ```
3. **Answer:**
   ```bash
   rm /var/log/error*.log
   ```
4. **Answer:**
   ```bash
   rm -i *
   ```
5. **Answer:**
   ```bash
   rm -v old_backup.tar.gz
   ```

</details>

---

### **1.6 `cp` - Copy Files and Directories**

Copies files and directories.

- **Common Options:**
  - `-r` or `-R`: Copy directories recursively.
  - `-p`: Preserve file attributes (mode, ownership, timestamps).
  - `-i`: Prompt before overwrite.
  - `-u`: Copy only when the source file is newer than the destination file or when the destination file is missing.
  - `-v`: Verbose mode.
  - `-a`: Archive mode; same as `-dR --preserve=all`.
  - `--backup`: Make a backup of each existing destination file.
  - `--help`: Display help information.

- **Examples:**
  1. **Copy a file to another location:**
     ```bash
     cp original.txt backup.txt
     ```
  2. **Copy a directory and its contents:**
     ```bash
     cp -r /source_dir /destination_dir
     ```
  3. **Copy files and preserve attributes:**
     ```bash
     cp -p file.txt /backup/
     ```
  4. **Prompt before overwriting existing files:**
     ```bash
     cp -i new_config.cfg /etc/config.cfg
     ```
  5. **Copy multiple files to a directory:**
     ```bash
     cp file1.txt file2.txt file3.txt /data/
     ```
  6. **Copy only updated files:**
     ```bash
     cp -u source.txt destination.txt
     ```
  7. **Copy files verbosely:**
     ```bash
     cp -v report.pdf /archives/
     ```
  8. **Copy with archive mode:**
     ```bash
     cp -a /home/user /backup/
     ```
  9. **Make backups of existing files:**
     ```bash
     cp --backup=numbered file.txt /backup/
     ```
  10. **Display help information:**
      ```bash
      cp --help
      ```

#### **Possible Exam Tasks:**

1. **Task:** Copy the file `/etc/hosts` to `/tmp` while preserving its original attributes.
2. **Task:** Copy all `.conf` files from `/etc` to `/backup/etc` without overwriting existing files.
3. **Task:** Recursively copy the directory `/var/www/html` to `/backup/html`.
4. **Task:** Copy the file `data.txt` to `/data` and prompt if overwriting is necessary.
5. **Task:** Copy updated files from `/source` to `/dest` only if they are newer than the destination files.

<details>
<summary><strong>Answers:</strong></summary>

1. **Answer:**
   ```bash
   cp -p /etc/hosts /tmp/
   ```
2. **Answer:**
   ```bash
   cp -n /etc/*.conf /backup/etc/
   ```
3. **Answer:**
   ```bash
   cp -a /var/www/html /backup/
   ```
4. **Answer:**
   ```bash
   cp -i data.txt /data/
   ```
5. **Answer:**
   ```bash
   cp -u /source/* /dest/
   ```

</details>

---

### **1.7 `mv` - Move or Rename Files and Directories**

Moves or renames files and directories.

- **Common Options:**
  - `-i`: Prompt before overwrite.
  - `-u`: Move only when the source file is newer than the destination file or when the destination file is missing.
  - `-v`: Verbose mode.
  - `-n`: Do not overwrite existing files.
  - `-f`: Do not prompt before overwriting.
  - `--backup`: Make a backup of each existing destination file.
  - `--help`: Display help information.

- **Examples:**
  1. **Rename a file:**
     ```bash
     mv oldname.txt newname.txt
     ```
  2. **Move files to another directory:**
     ```bash
     mv *.txt /backup/
     ```
  3. **Prompt before overwriting existing files:**
     ```bash
     mv -i data.csv /data/
     ```
  4. **Do not overwrite existing files:**
     ```bash
     mv -n source.txt destination.txt
     ```
  5. **Verbosely move files:**
     ```bash
     mv -v logs/*.log /archive/logs/
     ```
  6. **Move and update only newer files:**
     ```bash
     mv -u /source_dir/* /destination_dir/
     ```
  7. **Force move without prompts:**
     ```bash
     mv -f file.txt /overwrite/
     ```
  8. **Make backups of existing files:**
     ```bash
     mv --backup=numbered config.cfg /etc/config.cfg
     ```
  9. **Move a directory to a new location:**
     ```bash
     mv /var/www /var/www_old
     ```
  10. **Display help information:**
      ```bash
      mv --help
      ```

#### **Possible Exam Tasks:**

1. **Task:** Rename the file `report.txt` to `final_report.txt` in your current directory.
2. **Task:** Move all `.jpg` files from `/images` to `/backup/images` without overwriting existing files.
3. **Task:** Verbosely move the directory `/data/old` to `/data/archive/old_data`.
4. **Task:** Update the files from `/incoming` to `/processed` only if they are newer.
5. **Task:** Move `config.yaml` to `/etc/app/` and prompt if overwriting is necessary.

<details>
<summary><strong>Answers:</strong></summary>

1. **Answer:**
   ```bash
   mv report.txt final_report.txt
   ```
2. **Answer:**
   ```bash
   mv -n /images/*.jpg /backup/images/
   ```
3. **Answer:**
   ```bash
   mv -v /data/old /data/archive/old_data
   ```
4. **Answer:**
   ```bash
   mv -u /incoming/* /processed/
   ```
5. **Answer:**
   ```bash
   mv -i config.yaml /etc/app/
   ```

</details>

---

### **1.8 `touch` - Create Empty Files or Update Timestamps**

Creates an empty file or updates the modification and access times of existing files.

- **Common Options:**
  - `-a`: Change only the access time.
  - `-m`: Change only the modification time.
  - `-t [[CC]YY]MMDDhhmm[.ss]`: Use the specified time instead of the current time.
  - `-c`: Do not create any files.
  - `-r`: Use the timestamp from a reference file.
  - `-d`: Parse STRING and use it instead of current time.
  - `--help`: Display help information.

- **Examples:**
  1. **Create a new empty file:**
     ```bash
     touch newfile.txt
     ```
  2. **Update the timestamp of an existing file to the current time:**
     ```bash
     touch existingfile.txt
     ```
  3. **Change only the access time:**
     ```bash
     touch -a file.txt
     ```
  4. **Set a specific modification time:**
     ```bash
     touch -t 202310121200.00 file.txt
     ```
  5. **Use the timestamp from another file:**
     ```bash
     touch -r reference.txt target.txt
     ```
  6. **Do not create the file if it does not exist:**
     ```bash
     touch -c maybe_existing.txt
     ```
  7. **Update both access and modification times to a specific time:**
     ```bash
     touch -amt 202310121200.00 file.txt
     ```
  8. **Set timestamp using a date string:**
     ```bash
     touch -d "2023-10-12 12:00:00" file.txt
     ```
  9. **Create multiple files at once:**
     ```bash
     touch file1.txt file2.txt file3.txt
     ```
  10. **Display help information:**
      ```bash
      touch --help
      ```

#### **Possible Exam Tasks:**

1. **Task:** Create an empty file named `index.html` in `/var/www/html`.
2. **Task:** Update the modification time of `script.sh` to the current time.
3. **Task:** Set the access and modification time of `log.txt` to `October 12, 2023, at 8:00 AM`.
4. **Task:** Change the timestamp of `data.csv` to match that of `reference.csv`.
5. **Task:** Create multiple empty files named `file1.txt`, `file2.txt`, and `file3.txt` in the current directory.

<details>
<summary><strong>Answers:</strong></summary>

1. **Answer:**
   ```bash
   touch /var/www/html/index.html
   ```
2. **Answer:**
   ```bash
   touch script.sh
   ```
3. **Answer:**
   ```bash
   touch -d "2023-10-12 08:00" log.txt
   ```
4. **Answer:**
   ```bash
   touch -r reference.csv data.csv
   ```
5. **Answer:**
   ```bash
   touch file1.txt file2.txt file3.txt
   ```

</details>

---

## Tips for Exam Tasks:

- **Read the Task Carefully:** Ensure you understand what is being asked before attempting the command.
- **Use Man Pages:** If unsure about a command or option, use `man [command]` to get more information.
- **Practice Combined Commands:** Some tasks may require using multiple commands together (e.g., piping, chaining).
- **Safety First:** When using commands that can alter or delete data (like `rm`), double-check your commands before execution.
- **Use the Correct Paths:** Pay attention to absolute vs. relative paths in the tasks.

---

By adding these possible exam tasks, you can practice real-world scenarios that may appear on the RHCSA exam. This will help solidify your understanding of each command and its options.