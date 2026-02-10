#!/usr/bin/env node

const { execSync } = require("child_process");
const os = require("os");

console.log("System Health Snapshot");
console.log("======================");

console.log(`Hostname: ${os.hostname()}`);
console.log(`Uptime: ${(os.uptime() / 60).toFixed(1)} minutes`);

const totalMem = os.totalmem();
const freeMem = os.freemem();
const usedMem = totalMem - freeMem;

console.log(
    `Memory: ${(usedMem / 1024 / 1024).toFixed(0)} MB / ${(totalMem / 1024 / 1024).toFixed(0)} MB`
);

const load = os.loadavg();
console.log(`CPU Load (1m, 5m, 15m): ${load.map(v => v.toFixed(2)).join(", ")}`);

console.log("\nDisk usage:");
execSync("df -h /", { stdio: "inherit" });

console.log("\nTop memory process:");
execSync("ps -eo pid,comm,%mem --sort=-%mem | head -n 6", { stdio: "inherit" });
