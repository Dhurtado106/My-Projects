#!/bin/bash

echo "🔧 Updating system..."
sudo apt update && sudo apt upgrade -y

echo "🔐 Installing Blue Team (Defensive) Tools..."
sudo apt install -y ufw fail2ban rkhunter chkrootkit lynis auditd tripwire debsecan apparmor apparmor-utils \
clamav clamav-daemon logwatch psad aide

echo "🔐 Configuring UFW firewall..."
sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw enable
sudo ufw logging on

echo "🧠 Installing Red Team (Offensive) Tools..."
sudo apt install -y nmap masscan nikto sqlmap hydra medusa ncrack metasploit-framework \
bettercap ettercap-common ettercap-graphical aircrack-ng responder impacket-scripts \
enum4linux recon-ng netcat hping3

echo "📡 Installing Network & Packet Analysis Tools..."
sudo apt install -y wireshark tcpdump tshark suricata snort zeek

echo "🔒 Installing Encryption, Privacy, and Anonymity Tools..."
sudo apt install -y gnupg2 veracrypt cryptsetup tor torsocks onionshare openvpn wireguard

echo "🔍 Installing Password Cracking & Forensics Tools..."
sudo apt install -y john hashcat sleuthkit autopsy volatility3 binwalk exiftool foremost scalpel

echo "📈 Installing Monitoring and Log Analysis Tools..."
sudo apt install -y netdata glances iotop dstat sysstat neofetch

echo "🧱 Installing Vulnerability Scanners..."
sudo apt install -y openvas gvm

echo "🧰 Enabling ClamAV definitions update..."
sudo freshclam

echo "✅ All tools installed. Recommend reboot and then run: sudo lynis audit system"
