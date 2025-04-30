command: "NetFullSysInfo.widget/NetFullSysInfo.sh"
refreshFrequency: 5000

render: -> """
  <div id="systemInfo"></div>

  <div class="netbox">
    <table id='services'></table>
  </div>

  <div id="infoRow">
    <div id="macosVersionBox"></div>
    <div id="footerBoxStyled">
      <div id="brandContainer">
        <div id="brand">
          <span class="brand-text">🧑‍💻 Developed by JS IT</span>
        </div>
        <div id="versionNumber">NetSysInfo v1.0</div>
      </div>
    </div>
  </div>
"""

update: (output, domEl) ->
  try
    data = JSON.parse(output)
  catch error
    console.error "Error parsing JSON:", error
    return

  sys = data.system_info or {}
  isCharging = sys.battery_charging == "Yes"

  batteryRaw = if sys.battery_percentage? then sys.battery_percentage.toString().replace('%', '') else "N/A"
  batteryPercentInt = parseInt(batteryRaw)
  batteryIcon = if batteryPercentInt? and batteryPercentInt < 20 then "🔴" else ""
  batteryInfo = "#{batteryIcon} #{batteryRaw}%"
  if isCharging then batteryInfo += " 🔌"

  macVersion = sys.macos_version or "N/A"

  uptimeSeconds = parseInt(sys.uptime) or 0
  days = Math.floor(uptimeSeconds / 86400)
  hours = Math.floor((uptimeSeconds % 86400) / 3600)
  minutes = Math.floor((uptimeSeconds % 3600) / 60)
  uptimeFormatted = "#{days}d #{hours}h #{minutes}m"

  systemHTML = """
    <div class="sysbox">
      <h3>System Info</h3>
      <p><strong>🖥️ Hostname:</strong> #{sys.hostname}</p>
      <p><strong>⏱️ Uptime:</strong> #{uptimeFormatted}</p>
      <p><strong>🧠 CPU:</strong> #{sys.cpu_usage}</p>
      <p><strong>📊 RAM:</strong> #{sys.memory_usage.used} / #{sys.memory_usage.total}</p>
      <p><strong>🗄️ Disk:</strong> #{sys.disk_usage}</p>
      <p><strong>📶 Ping:</strong> #{sys.ping_latency}</p>
      <p><strong>🔋 Battery:</strong> #{batteryInfo}</p>
    </div>
  """
  $('#systemInfo').html(systemHTML)

  macosHTML = """
    <div class="macosbox">
      <h3>MacOS Version</h3>
      <p><strong>⚙️</strong> #{macVersion}</p>
    </div>
  """
  $('#macosVersionBox').html(macosHTML)

  iconMap =
    "ethernet": "ethernet"
    "wi-fi": "wi-fi"
    "wifi": "wi-fi"
    "displayethernet": "ethernet"
    "thunderboltethernet": "ethernet"

  html = ""
  for svc in data.services
    nameKey = svc.name.toLowerCase().replace(/\s+/g, '')
    iconBase = iconMap[nameKey] or "ethernet"
    imgPath = "NetFullSysInfo.widget/images/#{iconBase}"
    connected = svc.ipaddress and svc.ipaddress != 'none'
    html += "<td class='service'>"
    html += "<img class='icon' src='#{imgPath}#{if connected then '' else '_disabled'}.png'/>"
    html += "<p class='primaryInfo'>#{if connected then svc.ipaddress else 'Not Connected'}</p>"
    html += "<p class='secondaryInfo'>#{svc.macaddress}</p></td>"

  $('#services').html(html)

style: """
  font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Helvetica, Arial, sans-serif;
  left: -2px;
  top: 360px;
  padding: 2px 10px 3px 10px;
  margin: 20px;
  background: rgba(50, 50, 50, 1.1);
  border-radius: 10px;
  color: white;

  .sysbox, .macosbox {
    padding: 6px 10px;
    margin: 10px 0;
    background: rgba(255, 255, 255, 0.1);
    border-radius: 5px;
  }

  .sysbox h3, .macosbox h3 {
    font-size: 9pt;
    margin: 0 0 5px 0;
  }

  .sysbox p, .macosbox p {
    font-size: 9pt;
    margin: 2px 0;
  }

  .netbox {
    display: flex;
    justify-content: center;
    align-items: center;
    padding: 2px;
    margin-top: 10px;
    background: rgba(255, 255, 255, 0.1);
    border-radius: 5px;
  }

  .service {
    text-align: center;
    padding: 5px;
  }

  .icon {
    width: 32px;
    height: 32px;
  }

  .primaryInfo {
    font-size: 10pt;
    font-weight: bold;
    margin: 2px 0;
  }

  .secondaryInfo {
    font-size: 8pt;
    color: white;
  }

  #infoRow {
    display: flex;
    justify-content: space-between;
    align-items: flex-start;
    gap: 10px;
    margin-top: 2px;
  }

  #macosVersionBox,
  #footerBoxStyled {
    margin: 0;
    display: inline-block;
  }

  #macosVersionBox {
    padding: 0;
    vertical-align: top;
  }

  #footerBoxStyled {
    max-width: 300px;
    padding: 7.5px;
    margin-top: 10px;
    background: rgba(255, 255, 255, 0.1);
    border-radius: 5px;
    text-align: right;
    box-sizing: border-box;
  }

  #brandContainer {
    display: flex;
    flex-direction: column;
    align-items: flex-end;
  }

  #brand {
    display: flex;
    align-items: center;
    gap: 10px;
    font-size: 9pt;
    color: rgba(255, 255, 255, 0.6);
    font-weight: 400;
    white-space: nowrap;
    overflow: hidden;
  }

  .brand-logo {
    height: 15px;
    width: 15px;
  }

  .brand-text {
    font-weight: 300;
    color: white;
  }

  #versionNumber {
    font-size: 9pt;
    color: rgba(255, 255, 255, 0.5);
    text-align: right;
    margin-top: 4px;
    color: white;
  }
"""