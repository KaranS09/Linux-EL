#!/bin/bash

echo "💀 Simulating a cyber attack on Fedora..."

echo "👤 Creating a fake attacker account..."
sudo useradd -m hacker
echo "hacker:password123" | sudo chpasswd

echo -e "\n🔴⚠️ **ATTACK STAGE 1: Privilege Escalation** ⚠️🔴"
echo "👿 Adding hacker to sudoers with full access!"
echo "hacker ALL=(ALL) NOPASSWD:/bin/bash" | sudo tee -a /etc/sudoers

echo -e "\n🔴⚠️ **ATTACK STAGE 2: Running Exploit as Hacker** ⚠️🔴"
echo "🔥 Switching to the hacker account and gaining root access..."
sudo -u hacker /bin/bash -c 'whoami && id'

echo -e "\n🔴⚠️ **ATTACK STAGE 3: Deploying Malicious Process** ⚠️🔴"
echo "🦠 Creating and running a malware script..."
echo '#!/bin/bash' > /tmp/malware.sh
echo 'echo "🚨 Malware Executed! 🚨"' >> /tmp/malware.sh
chmod +x /tmp/malware.sh
nohup /tmp/malware.sh &

echo -e "\n🔍 Checking for malware processes..."
ps aux | grep malware

echo -e "\n🔍 **Detecting Unauthorized Access Using Logs**"
sudo journalctl -p err -n 20 | tee attack_logs.txt

echo -e "\n🛡️ **Mitigation: Rolling back changes & securing the system...**"
sudo userdel -r hacker
sudo sed -i '/hacker ALL/d' /etc/sudoers
sudo rm -f /tmp/malware.sh

echo "✅ Attack simulation complete. System secured!"

