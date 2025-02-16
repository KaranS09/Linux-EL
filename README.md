# Security Demonstration on Fedora

## Overview
This repository contains two security demonstrations on Fedora:
1. **SELinux Setup & Policy Enforcement** - Configuring and enforcing security policies using SELinux.
2. **Simulated Attack & Defense** - Simulating an attack scenario and demonstrating how to detect and mitigate threats.

## Prerequisites
Ensure you have **Fedora** installed and have **sudo** privileges before executing the scripts.

## Run Commands

### **1. SELinux Setup & Policy Enforcement**
This script enables and configures SELinux, sets up secure directories, applies policies, and logs security violations.
```bash
sudo bash selinux_fedora.sh
```

### **2. Simulated Attack & Defense**
This script simulates an attack by creating an unauthorized user, escalating privileges, executing malicious code, and demonstrates detection and mitigation.
```bash
sudo bash attack_fedora.sh
```

## Cleanup Commands (If Needed)
To restore the system to its original state after running the scripts:
```bash
sudo userdel -r hacker
sudo semodule -r custom_policy
sudo rm -rf /secure_data custom_policy.*
sudo rm -f attack_fedora.sh selinux_fedora.sh
```

## Description
- **SELinux Setup:** Demonstrates how to configure SELinux to enhance system security through mandatory access controls.
- **Simulated Attack:** Explores a security breach scenario, showcasing how attackers exploit vulnerabilities and how system administrators can respond.

Use these scripts responsibly for educational and testing purposes only.
