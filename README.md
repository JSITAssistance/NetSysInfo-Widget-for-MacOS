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

Copyright (c) 2025 James Southcombe

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

---

## 🧑‍💻 Developed by James Southcombe

**JS IT Assistance**  
🌐 [www.facebook.com/jsitassistance](https://www.facebook.com/jsitassistance)  
✉️ [support@jsitassistance.uk](mailto:support@jsitassistance.uk)

---
