#!/bin/bash

echo "🔧 Updating system..."
sudo apt update && sudo apt upgrade -y

echo "🔐 Installing security and firewall tools..."
sudo apt install -y ufw fail2ban rkhunter chkrootkit lynis auditd tripwire debsecan apparmor apparmor-utils iptables-persistent clamav clamav-daemon logwatch tiger psad

echo "🔐 Enabling UFW and setting defaults..."
sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw enable
sudo ufw logging on

echo "🔐 Blocking dangerous TCP/UDP ports..."
for port in 21 23 135 137 138 139 445 3306 3389 6667 69 161 162 1900 5353; do
    sudo ufw deny proto tcp from any to any port $port
    sudo ufw deny proto udp from any to any port $port
done

echo "🧠 Installing network and intrusion detection tools..."
sudo apt install -y nmap wireshark tcpdump suricata snort zeek

echo "🔭 Installing scientific and research tools..."
sudo apt install -y octave gnuplot maxima r-base qgis openfoam gromacs lammps celestia stellarium cartes du ciel kstars

echo "🔒 Installing privacy and anonymity tools..."
sudo apt install -y tor torsocks veracrypt onionshare

echo "📊 Installing monitoring and performance tools..."
sudo apt install -y htop btop glances iotop dstat sysstat lm-sensors neofetch

echo "🧰 Installing useful command-line utilities..."
sudo apt install -y ranger ncdu bat exa fzf ripgrep tldr

echo "🛠️ Cleaning up and updating ClamAV database..."
sudo freshclam

echo "✅ All tools installed. Consider running 'sudo lynis audit system' for a full security check."
