#!/usr/bin/env python3
"""
Linux Task Manager - System Resource Monitor
Monitors CPU, CPU cores, GPU cores, network, and disk usage.
"""

import psutil
import time
import subprocess
import sys
from typing import Dict, List

class TaskManager:
    def __init__(self):
        self.cpu_count = psutil.cpu_count()
        self.cpu_count_logical = psutil.cpu_count(logical=True)

    def get_cpu_usage(self) -> float:
        """Get overall CPU usage percentage."""
        return psutil.cpu_percent(interval=1)

    def get_cpu_cores_usage(self) -> List[float]:
        """Get CPU usage for each core."""
        return psutil.cpu_percent(interval=1, percpu=True)

    def get_gpu_usage(self) -> Dict[str, float]:
        """Get GPU usage. Assumes NVIDIA GPU with nvidia-smi available."""
        try:
            result = subprocess.run(['nvidia-smi', '--query-gpu=utilization.gpu', '--format=csv,noheader,nounits'],
                                    capture_output=True, text=True, timeout=5)
            if result.returncode == 0:
                usage = float(result.stdout.strip())
                return {'gpu_utilization': usage}
            else:
                return {'gpu_utilization': 0.0}
        except (subprocess.TimeoutExpired, FileNotFoundError, ValueError):
            return {'gpu_utilization': 0.0}

    def get_network_usage(self) -> Dict[str, float]:
        """Get network usage in MB/s."""
        net_io = psutil.net_io_counters()
        # This is cumulative, so for rate, need to sample over time
        # For simplicity, return current counters
        return {
            'bytes_sent': net_io.bytes_sent / (1024**2),
            'bytes_recv': net_io.bytes_recv / (1024**2)
        }

    def get_disk_usage(self) -> Dict[str, float]:
        """Get disk usage for root partition."""
        disk = psutil.disk_usage('/')
        return {
            'total': disk.total / (1024**3),  # GB
            'used': disk.used / (1024**3),
            'free': disk.free / (1024**3),
            'percent': disk.percent
        }

    def display_stats(self):
        """Display all system stats."""
        print("=== Linux Task Manager ===")
        print(f"CPU Usage: {self.get_cpu_usage()}%")
        print(f"CPU Cores ({self.cpu_count_logical}): {self.get_cpu_cores_usage()}")
        gpu = self.get_gpu_usage()
        print(f"GPU Usage: {gpu['gpu_utilization']}%")
        net = self.get_network_usage()
        print(f"Network - Sent: {net['bytes_sent']:.2f} MB, Recv: {net['bytes_recv']:.2f} MB")
        disk = self.get_disk_usage()
        print(f"Disk - Used: {disk['used']:.2f} GB / {disk['total']:.2f} GB ({disk['percent']}%)")
        print("-" * 50)

def main():
    manager = TaskManager()
    try:
        while True:
            manager.display_stats()
            time.sleep(5)  # Update every 5 seconds
    except KeyboardInterrupt:
        print("\nExiting Task Manager.")
        sys.exit(0)

if __name__ == "__main__":
    main()