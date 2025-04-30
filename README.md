# 📡 NetFullSysInfo.widget

A minimal yet powerful Übersicht widget that displays live system info and network status with a clean macOS aesthetic.

🧑‍💻 Developed by James Southcombe  
**Version:** `v1.0`

---

## 🧰 Features

- 🚀 System Hostname, Uptime, Live CPU, Memory, Disk, Ping time to 8.8.8.8, and Battery percentage & charging status.
- 🌐 Displays Network connectivity including IP/MAC for all active network interfaces.
- ⚙️ Displays current macOS version number.
- 🖌️ Styled to match macOS design.
- 🖥 Works seamlessly with Übersicht.

---

## 🧭 Installation Instructions

1. **Install [Übersicht](http://tracesof.net/uebersicht/) if you haven’t already.**

2. **Move the `NetFullSysInfo.widget` folder into your Übersicht widgets folder.**

3. **If the Widget doesn’t appear to be working as intended, follow these steps:**

    1. Open **Terminal**  
    2. Navigate to your widget directory:  
       Click Übersicht in the menu bar → Click **Open Widgets Folder**
    3. Replace the path below if needed and paste this into Terminal:
       ```bash
       cd ~/Library/Application\ Support/Übersicht/widgets/NetFullSysInfo.widget
       ```
    4. Make the script executable:
       ```bash
       chmod +x NetFullSysInfo.sh
       ```
    5. Remove quarantine attribute:
       ```bash
       xattr -d com.apple.quarantine NetFullSysInfo.sh
       ```
    6. Restart Übersicht.

You can also copy and paste this one-liner into Terminal (edit the path if needed):
```bash
cd ~/Library/Application\ Support/Übersicht/widgets/NetFullSysInfo.widget && \
chmod +x NetFullSysInfo.sh && \
xattr -d com.apple.quarantine NetFullSysInfo.sh
```

🛠 These steps will:  
- 🛡 Remove macOS quarantine attributes  
- 🔓 Set execute permissions for the widget script  
- 🚀 Ensure the widget can run properly in Übersicht

🎉 **Done!** Your widget should now display system info and network status correctly.

---

## 🪪 License

- For personal use only. Please do not redistribute without permission.
- You may customise the widget script (`NetFullSysInfo.coffee`) for positioning, background colours, etc.
- Tested on macOS Monterey and newer.

---

## 🧑‍💻 Developed by James Southcombe

**JS IT Assistance**  
🌐 [www.facebook.com/jsitassistance](https://www.facebook.com/jsitassistance)  
✉️ [support@jsitassistance.uk](mailto:support@jsitassistance.uk)

---
