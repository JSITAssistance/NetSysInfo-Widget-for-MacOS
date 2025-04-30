#!/bin/bash

hostname=$(scutil --get LocalHostName)
hostname="$hostname"

boottime=$(sysctl -n kern.boottime | awk -F'[=,]' '{print $2}' | tr -d ' ')
current_time=$(date +%s)
uptime_seconds=$((current_time - boottime))

cpu_usage=$(top -l 1 | grep -E "^CPU" | awk '{print $3}')
cpu_usage="$cpu_usage"

mem_total_bytes=$(sysctl -n hw.memsize)
mem_used=$(top -l 1 | grep PhysMem | awk '{print $2}' | tr -d 'M')
mem_total=$(echo "$mem_total_bytes" | awk '{printf "%.2f GB", $1/1073741824}')
mem_used_gb=$(echo "$mem_used" | awk '{printf "%.2f GB", $1/1024}')

disk_total=$(df -h / | tail -1 | awk '{print $2}' | sed 's/Gi/GB/')
disk_used=$(df -h / | tail -1 | awk '{print $3}' | sed 's/Gi/GB/')
disk_usage="$disk_used / $disk_total"

ping_latency=$(ping -c 1 -t 1 8.8.8.8 2>/dev/null | awk -F'time=' '/time=/{print $2}' | awk '{print "" $1 " ms"}')

battery_info=$(pmset -g batt)
battery_percentage=$(echo "$battery_info" | grep -o -E "([0-9]{1,3})%" | head -n 1)
charging_status="No"
if echo "$battery_info" | grep -q 'AC Power'; then
    charging_status="Yes"
fi

if [ -z "$battery_percentage" ]; then
    battery_percentage="Info Unavailable"
else
    battery_percentage="$battery_percentage"
fi

# macOS Version
macos_version=$(sw_vers -productVersion)
macos_version="$macos_version"

eth_ip=$(networksetup -getinfo Ethernet | grep -Ei '(^IP address:)' | awk '{print $3}')
eth_mac=$(networksetup -getinfo Ethernet | grep -Ei '(^Ethernet address:)' | awk '{print $3}')
wifi_ip=$(networksetup -getinfo Wi-Fi | grep -Ei '(^IP address:)' | awk '{print $3}')
wifi_mac=$(networksetup -getinfo Wi-Fi | grep -Ei '(^Wi-Fi ID:)' | awk '{print $3}')

# Output JSON
echo '{
  "system_info": {
    "hostname": "'"$hostname"'",
    "uptime": "'"$uptime_seconds"'",
    "cpu_usage": "'"$cpu_usage"'",
    "memory_usage": {
      "used": "'"$mem_used_gb"'",
      "total": "'"$mem_total"'"
    },
    "disk_usage": "'"$disk_usage"'",
    "ping_latency": "'"$ping_latency"'",
    "battery_percentage": "'"$battery_percentage"'",
    "battery_charging": "'"$charging_status"'",
    "macos_version": "'"$macos_version"'"
  },
  "services": [
    {
      "name": "Ethernet",
      "ipaddress": "'"$eth_ip"'",
      "macaddress": "'"$eth_mac"'"
    },
    {
      "name": "Wi-Fi",
      "ipaddress": "'"$wifi_ip"'",
      "macaddress": "'"$wifi_mac"'"
    }
  ]
}'