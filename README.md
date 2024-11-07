# RHCSA Study Guide

This repository is a comprehensive study guide for the Red Hat Certified System Administrator (RHCSA) exam. It combines exam preparation materials covering essential RHCSA topics with infrastructure setup using Terraform for practical hands-on experience.

## Table of Contents

- [RHCSA Study Guide](#rhcsa-study-guide)
  - [Table of Contents](#table-of-contents)
  - [Introduction](#introduction)
  - [Study Materials](#study-materials)
  - [Development Container Setup](#development-container-setup)
    - [Prerequisites](#prerequisites)
    - [Getting Started](#getting-started)
    - [The development container includes](#the-development-container-includes)
  - [Usage](#usage)
  - [Contributing](#contributing)
  - [License](#license)

## Introduction

The RHCSA certification validates your skills in system administration, including installation and configuration of a Red Hat Enterprise Linux system and attaching it to a live network running network services. This study guide provides markdown files covering essential topics along with practical examples to help you prepare effectively.

## Study Materials

The study materials are organized into separate markdown files for each topic:

- [RHCSA - Basic File System Commands](RHCSA%20-%20Basic%20File%20System%20Commands.md)
- [RHCSA - Command Legend](RHCSA%20-%20Command%20Legend.md)
- [RHCSA - Disk and File System Management](RHCSA%20-%20Disk%20and%20File%20System%20Management.md)
- [RHCSA - File Archiving and Compression](RHCSA%20-%20File%20Archiving%20and%20Compression.md)
- [RHCSA - File Permissions and Ownership](RHCSA%20-%20File%20Permissions%20and%20Ownership.md)
- [RHCSA - Firewall Configuration](RHCSA%20-%20Firewall%20Configuration.md)
- [RHCSA - Miscellaneous Commands](RHCSA%20-%20Miscellaneous%20Commands.md)
- [RHCSA - Modifying Files](RHCSA%20-%20Modifying%20Files.md)
- [RHCSA - Networking Commands](RHCSA%20-%20Networking%20Commands.md)
- [RHCSA - Package Management](RHCSA%20-%20Package%20Management.md)
- [RHCSA - Process Improvement](RHCSA%20-%20Process%20Improvement.md)
- [RHCSA - Scheduling Tasks](RHCSA%20-%20Scheduling%20Tasks.md)

These files cover topics such as:

- File system navigation and manipulation
- Managing file permissions and ownership
- Disk and file system management
- Networking commands and configurations
- Package management with YUM and RPM
- Process management and system monitoring
- Scheduling tasks with `cron` and `at`
- Firewall configuration using `iptables` and `firewalld`
- File archiving and compression techniques
- Modifying files using editors like `vi` and `nano`

## Development Container Setup

This repository includes a development container configuration using Docker and Visual Studio Code, located in the [`.devcontainer`](.devcontainer) directory. This setup provides a consistent environment with all necessary tools installed.

### Prerequisites

- Docker installed on your local machine
- Visual Studio Code with the Remote - Containers extension

### Getting Started

1. Clone the repository:

   ```bash
   git clone https://github.com/yourusername/RHCSA-Study-Guide.git
   ```
2. Open the repository in Visual Studio Code.
3. When prompted, reopen the folder in the container.
4. The container will build automatically, installing all required dependencies.

### The development container includes

- Ubuntu 22.04 base image
- Essential tools like `git`, `curl`, `wget`, `zsh`, and more
- Azure CLI installed via `curl`
- Terraform installed from the HashiCorp repository
- `terraform-docs` for generating documentation
- Exposed ports for HashiCorp products and SSH

## Usage

- Navigate through the study materials listed above.
- Practice commands and configurations on the provided development container or your own lab environment.
- Use the .gitignore file to manage untracked files, especially when working with Terraform configurations.


## Contributing

Contributions are welcome! If you'd like to add new topics, fix errors, or improve existing content, feel free to submit a pull request.

## License

This project is licensed under the MIT License.