## User and Group Management with Possible Exam Tasks

As requested, I've expanded the **User and Group Management** section to include between five and ten of the top options for each command, along with at least five examples of usage. I've also added a "Possible Exam Tasks" subsection for each command, which includes tasks that may involve using one or more commands together to achieve a specific goal, similar to what might be encountered on the RHCSA exam. The answers are provided after the questions in collapsible sections.

---

## 5. User and Group Management

### **5.1 `useradd` - Add a New User**

Creates a new user account.

- **Common Options:**
  - `-m`: Create the user's home directory if it does not exist.
  - `-d [HOME_DIR]`: Specify the user's home directory.
  - `-s [SHELL]`: Specify the user's login shell.
  - `-u [UID]`: Specify the user's UID.
  - `-g [GROUP]`: Specify the user's initial login group (must exist).
  - `-G [GROUPS]`: Specify additional groups the user belongs to.
  - `-c [COMMENT]`: Set the GECOS field (user's full name or comment).
  - `-e [EXPIRE_DATE]`: Set the account expiration date (YYYY-MM-DD).
  - `-f [INACTIVE_DAYS]`: Set password inactivity period (after expiration).
  - `-p [PASSWORD]`: Set the user's encrypted password (not recommended to use directly).
  - `-N`: Do not create a home directory (default behavior).

- **Examples:**
  1. **Add a user named `dave`:**
     ```bash
     useradd dave
     ```
  2. **Add a user with a home directory and default shell:**
     ```bash
     useradd -m -s /bin/bash emily
     ```
  3. **Add a user with a specific UID and GID:**
     ```bash
     useradd -u 1001 -g developers john
     ```
  4. **Add a user and assign additional groups:**
     ```bash
     useradd -G wheel,audio,video sarah
     ```
  5. **Add a user with a custom home directory and comment:**
     ```bash
     useradd -m -d /home/custom -c "Custom User" customuser
     ```
  6. **Add a user with an account expiration date:**
     ```bash
     useradd -e 2023-12-31 tempuser
     ```
  7. **Add a user without creating a home directory:**
     ```bash
     useradd -M nohomeuser
     ```
  8. **Add a user with a password inactivity period:**
     ```bash
     useradd -f 30 inactiveuser
     ```
  9. **Add a user with an initial password (encrypted):**
     ```bash
     useradd -p $(openssl passwd -1 "password") secureuser
     ```
  10. **Display help information:**
      ```bash
      useradd --help
      ```

#### **Possible Exam Tasks:**

1. **Task:** Create a user `alex` with a home directory, bash shell, and add them to the `developers` group.

2. **Task:** Add a user `guest` that expires on `2023-12-31` and does not have a home directory.

3. **Task:** Create a user `backup` with UID `1500` and GID `1500`, and set their home directory to `/var/backups`.

4. **Task:** Add a user `webadmin` with additional groups `apache` and `www`.

5. **Task:** Create a user `tempuser` with a password inactivity period of 15 days after password expiration.

<details>
<summary><strong>Answers:</strong></summary>

1. **Answer:**
   ```bash
   useradd -m -s /bin/bash -G developers alex
   ```
2. **Answer:**
   ```bash
   useradd -e 2023-12-31 -M guest
   ```
3. **Answer:**
   ```bash
   useradd -u 1500 -g 1500 -m -d /var/backups backup
   ```
4. **Answer:**
   ```bash
   useradd -G apache,www webadmin
   ```
5. **Answer:**
   ```bash
   useradd -f 15 tempuser
   ```

</details>

---

### **5.2 `passwd` - Change User Password**

Sets or updates a user's password.

- **Common Options:**
  - `[USER]`: Specify the username (only root can change others' passwords).
  - `-d [USER]`: Delete a user's password (passwordless account).
  - `-e [USER]`: Force user to change password at next login.
  - `-l [USER]`: Lock a user's password.
  - `-u [USER]`: Unlock a user's password.
  - `-S [USER]`: Display password status information.
  - `--stdin`: Read new password from standard input (used in scripts).
  - `-n [DAYS]`: Set minimum number of days between password changes.
  - `-x [DAYS]`: Set maximum number of days before password change is required.
  - `-w [DAYS]`: Set number of days of warning before password expires.

- **Examples:**
  1. **Change your own password:**
     ```bash
     passwd
     ```
  2. **Set password for another user (as root):**
     ```bash
     passwd steve
     ```
  3. **Force a user to change password at next login:**
     ```bash
     passwd -e emily
     ```
  4. **Lock a user's password:**
     ```bash
     passwd -l guest
     ```
  5. **Unlock a user's password:**
     ```bash
     passwd -u guest
     ```
  6. **Delete a user's password (allow passwordless login):**
     ```bash
     passwd -d tempuser
     ```
  7. **Display password status information:**
     ```bash
     passwd -S john
     ```
  8. **Set password expiration to 90 days:**
     ```bash
     passwd -x 90 sarah
     ```
  9. **Set minimum days between password changes to 7:**
     ```bash
     passwd -n 7 bob
     ```
  10. **Set password change warning period to 5 days:**
      ```bash
      passwd -w 5 alice
      ```

#### **Possible Exam Tasks:**

1. **Task:** Set the password for user `dave` and force him to change it upon next login.

2. **Task:** Lock the account of user `tempuser`.

3. **Task:** Unlock the account of user `guest`.

4. **Task:** Set the password expiration policy for user `john` to require a password change every 60 days.

5. **Task:** Display the password status information for user `emily`.

<details>
<summary><strong>Answers:</strong></summary>

1. **Answer:**
   ```bash
   passwd dave
   passwd -e dave
   ```
2. **Answer:**
   ```bash
   passwd -l tempuser
   ```
3. **Answer:**
   ```bash
   passwd -u guest
   ```
4. **Answer:**
   ```bash
   passwd -x 60 john
   ```
5. **Answer:**
   ```bash
   passwd -S emily
   ```

</details>

---

### **5.3 `groupadd` - Add a New Group**

Creates a new user group.

- **Common Options:**
  - `-g [GID]`: Specify the group's GID.
  - `-r`: Create a system group (GID less than 1000).
  - `-f`: When the group already exists, exit successfully.
  - `-K [KEY=VALUE]`: Override `/etc/login.defs` defaults.
  - `--help`: Display help information.

- **Examples:**
  1. **Create a group named `developers`:**
     ```bash
     groupadd developers
     ```
  2. **Create a group with a specific GID:**
     ```bash
     groupadd -g 1001 testers
     ```
  3. **Create a system group named `sysadmin`:**
     ```bash
     groupadd -r sysadmin
     ```
  4. **Create a group and ignore if it already exists:**
     ```bash
     groupadd -f users
     ```
  5. **Create a group with overridden defaults:**
     ```bash
     groupadd -K GID_MIN=2000 -K GID_MAX=2999 contractors
     ```
  6. **Display help information:**
     ```bash
     groupadd --help
     ```
  7. **Create multiple groups in a loop:**
     ```bash
     for i in group1 group2 group3; do groupadd $i; done
     ```
  8. **Create a group with a GID matching another group (not recommended):**
     ```bash
     groupadd -g $(getent group existinggroup | cut -d: -f3) newgroup
     ```
  9. **Create a group with a GID below 1000:**
     ```bash
     groupadd -g 999 legacygroup
     ```
  10. **Create a group and specify a group password (rarely used):**
      ```bash
      groupadd securegroup
      gpasswd securegroup
      ```

#### **Possible Exam Tasks:**

1. **Task:** Create a group named `admin` with GID `2000`.

2. **Task:** Create a system group named `backup`.

3. **Task:** Create a group `staff` only if it does not already exist.

4. **Task:** Create a group `contractors` with GID minimum and maximum values overridden to `3000` and `3999`.

5. **Task:** Create multiple groups `grp1`, `grp2`, and `grp3` using a loop.

<details>
<summary><strong>Answers:</strong></summary>

1. **Answer:**
   ```bash
   groupadd -g 2000 admin
   ```
2. **Answer:**
   ```bash
   groupadd -r backup
   ```
3. **Answer:**
   ```bash
   groupadd -f staff
   ```
4. **Answer:**
   ```bash
   groupadd -K GID_MIN=3000 -K GID_MAX=3999 contractors
   ```
5. **Answer:**
   ```bash
   for i in grp1 grp2 grp3; do groupadd $i; done
   ```

</details>

---

### **5.4 `usermod` - Modify a User Account**

Changes user account attributes.

- **Common Options:**
  - `-l [NEW_LOGIN]`: Change the user's login name.
  - `-d [HOME_DIR]`: Change the user's home directory.
  - `-m`: Move the content of the home directory to the new location.
  - `-s [SHELL]`: Change the user's login shell.
  - `-u [UID]`: Change the user's UID.
  - `-g [GROUP]`: Change the user's initial login group.
  - `-G [GROUPS]`: Change the user's supplementary groups.
  - `-a`: Add the user to supplementary groups (use with `-G`).
  - `-L`: Lock the user's account.
  - `-U`: Unlock the user's account.
  - `-e [EXPIRE_DATE]`: Set account expiration date.

- **Examples:**
  1. **Change a user's login name from `john` to `john_doe`:**
     ```bash
     usermod -l john_doe john
     ```
  2. **Change a user's home directory and move its content:**
     ```bash
     usermod -d /home/newhome -m alice
     ```
  3. **Add a user to supplementary groups:**
     ```bash
     usermod -a -G wheel,audio bob
     ```
  4. **Change a user's login shell:**
     ```bash
     usermod -s /bin/zsh emily
     ```
  5. **Lock a user's account:**
     ```bash
     usermod -L tempuser
     ```
  6. **Unlock a user's account:**
     ```bash
     usermod -U tempuser
     ```
  7. **Change a user's UID:**
     ```bash
     usermod -u 1050 sarah
     ```
  8. **Change a user's primary group:**
     ```bash
     usermod -g developers john
     ```
  9. **Set account expiration date:**
     ```bash
     usermod -e 2023-12-31 guest
     ```
  10. **Remove all supplementary groups:**
      ```bash
      usermod -G "" dave
      ```

#### **Possible Exam Tasks:**

1. **Task:** Add user `alice` to the supplementary groups `sudo` and `docker`.

2. **Task:** Change the login shell of user `bob` to `/bin/bash`.

3. **Task:** Lock the account of user `guestuser`.

4. **Task:** Change the home directory of user `john` to `/home/john_doe` and move his files.

5. **Task:** Change the username `tempuser` to `archiveduser`.

<details>
<summary><strong>Answers:</strong></summary>

1. **Answer:**
   ```bash
   usermod -a -G sudo,docker alice
   ```
2. **Answer:**
   ```bash
   usermod -s /bin/bash bob
   ```
3. **Answer:**
   ```bash
   usermod -L guestuser
   ```
4. **Answer:**
   ```bash
   usermod -d /home/john_doe -m john
   ```
5. **Answer:**
   ```bash
   usermod -l archiveduser tempuser
   ```

</details>

---

### **5.5 `userdel` - Delete a User Account**

Removes a user account from the system.

- **Common Options:**
  - `-r`: Remove the user's home directory and mail spool.
  - `-f`: Force removal of files, even if the user is logged in.
  - `--help`: Display help information.

- **Examples:**
  1. **Delete a user account `guest`:**
     ```bash
     userdel guest
     ```
  2. **Delete a user and remove their home directory:**
     ```bash
     userdel -r tempuser
     ```
  3. **Force delete a user account:**
     ```bash
     userdel -f lockeduser
     ```
  4. **Delete a user but keep the home directory:**
     ```bash
     userdel preserveduser
     ```
  5. **Display help information:**
     ```bash
     userdel --help
     ```

#### **Possible Exam Tasks:**

1. **Task:** Delete user `testuser` and remove their home directory.

2. **Task:** Force delete user `problemuser` even if they are currently logged in.

3. **Task:** Delete user `olduser` but keep their home directory intact.

<details>
<summary><strong>Answers:</strong></summary>

1. **Answer:**
   ```bash
   userdel -r testuser
   ```
2. **Answer:**
   ```bash
   userdel -f problemuser
   ```
3. **Answer:**
   ```bash
   userdel olduser
   ```

</details>

---

### **5.6 `groupmod` - Modify a Group**

Changes group attributes.

- **Common Options:**
  - `-n [NEW_NAME]`: Change the group's name.
  - `-g [GID]`: Change the group's GID.
  - `-o`: Allow GID duplication when used with `-g`.
  - `--help`: Display help information.

- **Examples:**
  1. **Change group name from `staff` to `team`:**
     ```bash
     groupmod -n team staff
     ```
  2. **Change GID of a group:**
     ```bash
     groupmod -g 2001 developers
     ```
  3. **Allow duplicate GID when changing GID:**
     ```bash
     groupmod -o -g 1000 sharedgroup
     ```
  4. **Display help information:**
     ```bash
     groupmod --help
     ```
  5. **Change both group name and GID:**
     ```bash
     groupmod -n newgroup -g 2500 oldgroup
     ```

#### **Possible Exam Tasks:**

1. **Task:** Rename group `developers` to `devteam`.

2. **Task:** Change the GID of group `staff` to `3000`.

3. **Task:** Change the GID of group `shared` to `1000` even if it duplicates an existing GID.

<details>
<summary><strong>Answers:</strong></summary>

1. **Answer:**
   ```bash
   groupmod -n devteam developers
   ```
2. **Answer:**
   ```bash
   groupmod -g 3000 staff
   ```
3. **Answer:**
   ```bash
   groupmod -o -g 1000 shared
   ```

</details>

---

### **5.7 `groupdel` - Delete a Group**

Removes a group from the system.

- **Common Options:**
  - `[GROUP_NAME]`: Name of the group to delete.
  - `--help`: Display help information.

- **Examples:**
  1. **Delete a group named `tempgroup`:**
     ```bash
     groupdel tempgroup
     ```
  2. **Delete a group named `oldgroup`:**
     ```bash
     groupdel oldgroup
     ```
  3. **Display help information:**
     ```bash
     groupdel --help
     ```
  4. **Attempt to delete a group that is a primary group (will fail):**
     ```bash
     groupdel primarygroup
     ```
  5. **Delete multiple groups in a loop:**
     ```bash
     for i in group1 group2; do groupdel $i; done
     ```

#### **Possible Exam Tasks:**

1. **Task:** Delete group `obsolete`.

2. **Task:** Delete groups `tmp1` and `tmp2` using a loop.

<details>
<summary><strong>Answers:</strong></summary>

1. **Answer:**
   ```bash
   groupdel obsolete
   ```
2. **Answer:**
   ```bash
   for i in tmp1 tmp2; do groupdel $i; done
   ```

</details>

---

### **5.8 `chage` - Change User Password Expiration Information**

Modifies password aging information.

- **Common Options:**
  - `-l [USER]`: List account aging information.
  - `-E [DATE]`: Set account expiration date.
  - `-M [DAYS]`: Set maximum number of days between password changes.
  - `-m [DAYS]`: Set minimum number of days between password changes.
  - `-W [DAYS]`: Set number of days of warning before password expires.
  - `-I [DAYS]`: Set password inactivity period after expiration.
  - `-d [LAST_DAY]`: Set the last password change date.
  - `-h`: Display help information.

- **Examples:**
  1. **List password aging information for a user:**
     ```bash
     chage -l alice
     ```
  2. **Set password to expire every 60 days:**
     ```bash
     chage -M 60 bob
     ```
  3. **Set account expiration date:**
     ```bash
     chage -E 2023-12-31 tempuser
     ```
  4. **Set warning period before password expires:**
     ```bash
     chage -W 7 john
     ```
  5. **Set password inactivity period to 30 days:**
     ```bash
     chage -I 30 sarah
     ```
  6. **Set last password change date to today:**
     ```bash
     chage -d 0 dave
     ```
  7. **Remove account expiration date:**
     ```bash
     chage -E -1 guest
     ```
  8. **Set minimum days between password changes to 1:**
     ```bash
     chage -m 1 emily
     ```
  9. **Display help information:**
     ```bash
     chage --help
     ```
  10. **Interactively change aging information:**
      ```bash
      chage bob
      ```

#### **Possible Exam Tasks:**

1. **Task:** Set the maximum password age for user `alice` to 45 days.

2. **Task:** List the password aging information for user `john`.

3. **Task:** Set the account expiration date for user `tempuser` to `2023-11-30`.

4. **Task:** Remove the account expiration date for user `guest`.

5. **Task:** Set the password inactivity period after expiration to 7 days for user `bob`.

<details>
<summary><strong>Answers:</strong></summary>

1. **Answer:**
   ```bash
   chage -M 45 alice
   ```
2. **Answer:**
   ```bash
   chage -l john
   ```
3. **Answer:**
   ```bash
   chage -E 2023-11-30 tempuser
   ```
4. **Answer:**
   ```bash
   chage -E -1 guest
   ```
5. **Answer:**
   ```bash
   chage -I 7 bob
   ```

</details>

---

### **5.9 `newgrp` - Log in to a New Group**

Changes the current group ID during a login session.

- **Examples:**
  1. **Switch to group `developers`:**
     ```bash
     newgrp developers
     ```
  2. **Switch to group `staff` and start a new shell:**
     ```bash
     newgrp staff
     ```
  3. **Return to default group (exit shell):**
     ```bash
     exit
     ```
  4. **Switch to group `admin` and execute a command:**
     ```bash
     newgrp admin -c "id"
     ```
  5. **Attempt to switch to a group without membership (will fail):**
     ```bash
     newgrp secret
     ```

#### **Possible Exam Tasks:**

1. **Task:** Switch your current group to `wheel` to perform group-specific actions.

2. **Task:** Verify your group ID after switching to group `developers`.

<details>
<summary><strong>Answers:</strong></summary>

1. **Answer:**
   ```bash
   newgrp wheel
   ```
2. **Answer:**
   ```bash
   newgrp developers
   id -Gn  # Shows current groups
   ```

</details>

---

### **5.10 Managing `/etc/passwd`, `/etc/shadow`, and `/etc/group`**

Understanding these files is crucial for user and group management.

- **`/etc/passwd`:** Contains user account information.
- **`/etc/shadow`:** Contains secure user account information (passwords).
- **`/etc/group`:** Contains group account information.

#### **Possible Exam Tasks:**

1. **Task:** View the entry for user `alice` in `/etc/passwd`.

2. **Task:** Check the password aging information for user `bob` in `/etc/shadow`.

3. **Task:** Find all members of the group `developers` in `/etc/group`.

<details>
<summary><strong>Answers:</strong></summary>

1. **Answer:**
   ```bash
   grep "^alice:" /etc/passwd
   ```
2. **Answer:**
   ```bash
   sudo grep "^bob:" /etc/shadow
   ```
3. **Answer:**
   ```bash
   grep "^developers:" /etc/group
   ```

</details>

---

## Tips for User and Group Management:

- **Always Backup Critical Files:** Before making changes to `/etc/passwd`, `/etc/shadow`, or `/etc/group`, create backups.
- **Use Commands Instead of Manual Edits:** Prefer using `useradd`, `usermod`, `groupadd`, etc., over editing system files directly.
- **Password Policies:** Understand password aging policies and how to enforce them using `chage` and `passwd`.
- **Group Memberships:** Be aware of primary and supplementary groups; use `usermod -g` for primary and `usermod -a -G` for supplementary.
- **Account Security:** Lock accounts when not in use and enforce password changes when necessary.
- **UIDs and GIDs:** Know the significance of system (below 1000) and regular user IDs (1000 and above).

---

By expanding the User and Group Management section with additional options, examples, and possible exam tasks, you can deepen your understanding of these essential commands for the RHCSA exam.