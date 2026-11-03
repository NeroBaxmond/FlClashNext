<div>

[**Русский**](README.md)

</div>

## FlClash Next

[![Downloads](https://img.shields.io/github/downloads/NeroBaxmond/FlClashNext/total?style=flat-square&logo=github)](https://github.com/NeroBaxmond/FlClashNext/releases/)
[![Last Version](https://img.shields.io/github/release/NeroBaxmond/FlClashNext/all.svg?style=flat-square)](https://github.com/NeroBaxmond/FlClashNext/releases/)
[![License](https://img.shields.io/github/license/NeroBaxmond/FlClashNext?style=flat-square)](LICENSE)

**FlClash Next** is a fork of the multi-platform FlClash client powered by the ClashMeta (mihomo) core, maintained as a personal, carefully polished release: a clearer home screen, reliable VPN operation, and smart server selection.

- 🧑‍💻 **Fork creator:** [udizu (NeroBaxmond)](https://github.com/NeroBaxmond)
- 🙌 **Original projects:** [FlClash (chen08209)](https://github.com/chen08209/FlClash) and [FlClashX (pluralplay)](https://github.com/pluralplay/FlClashX)
- ⚙️ **Core:** [mihomo (MetaCubeX)](https://github.com/MetaCubeX/mihomo)

---

## ✨ Fork highlights

### 🏠 A next-generation home screen
- **Hero board by default:** connection status, a large round power button with a session timer, and a "group → server" card with a flag, IP, and signal-strength ping bars.
- **Cards are configurable:** the pencil button opens an edit mode where the hero cards (status, power button, server, details) can be shown or hidden with switches, and any of the classic dashboard cards can be added and arranged below — just like in the old dashboard.
- **The classic view is still there:** the "Classic dashboard" switch in settings restores the fully editable legacy dashboard.
- **Balanced hero layout:** status pinned to the top, the power button exactly centred between blocks, and the server card at the bottom; with classic cards added, the whole page scrolls as a single canvas.

### 🎯 Smart server selection
- Improved `url-test` group handling: the selected group is automatically picked up on the home screen, the real exit node is shown (not the group), and an intermittent ping failure no longer marks a working node as unreachable — a single failed probe is retried once.

### 🔋 Energy saving — strictly opt-in
- An optional battery-saving mode (Settings → Application, the first item): reduces background updates and health checks, and stretches TCP keep-alive.
- **Off by default**: the app behaves exactly like the original.

### 🎨 Material 3 and polish
- Material 3 throughout: dynamic color schemes, refreshed dialogs, lists, and bottom navigation.
- High-refresh-rate (120 Hz) display support on Android.
- The PRE/DEBUG banner is gone.
- Provider-side customization via `flclashx-*` headers: subscriptions can set the theme, card visibility, server display, renewal links, and more (see below).

### 🧰 Extra features (inherited and improved)
- Dashboard widgets: network speed, outbound mode, traffic usage, provider announcement, MetaInfo, network detection, TUN/VPN/system-proxy buttons, intranet IP, memory, change-server button, service info.
- Subscription-driven proxy list customization (`flclashx-view`).
- Android TV (D-pad focus), macOS status bar, Android deep links, and home-screen widgets.
- In-app Zashboard, in-app core updates, and HWID-aware profile management (Remnawave).

---

## 🙏 Credits

### Fork creator
**[udizu (NeroBaxmond)](https://github.com/NeroBaxmond)** — rebranding, the new home screen, energy saving, stability fixes, and FlClash Next releases.

### Original FlClash
Huge thanks to the original project teams:
- **[chen08209](https://github.com/chen08209)** — author of FlClash;
- **[pluralplay](https://github.com/pluralplay)** and **[kastov](https://github.com/kastov)** — authors of FlClashX;
- as well as **[katsukibtw](https://github.com/katsukibtw)**, **[prettyleaf](https://github.com/prettyleaf)**, **[mitsuha44](https://github.com/mitsuha44)**, **[txyyh](https://github.com/txyyh)** and every other FlClash / FlClashX contributor.

### Core
- **[mihomo / MetaCubeX](https://github.com/MetaCubeX/mihomo)** — the ClashMeta core.

> 💡 **Note:** a small part of this fork's code was written with AI assistance, then reviewed, adapted, and tested by the maintainer.

---

## 📡 Provider customization (`flclashx-*` headers)

<details>
<summary><strong>flclashx-widgets</strong> — dashboard card list</summary>

```bash
flclashx-widgets: announce,metainfo,outboundModeV2,networkDetection
```

Available cards: `announce`, `networkSpeed`, `outboundMode`, `outboundModeV2`, `trafficUsage`, `networkDetection`, `tunButton`, `vpnButton`, `systemProxyButton`, `intranetIp`, `memoryInfo`, `metainfo`, `changeServerButton`, `serviceInfo`, `zashboardButton`.
</details>

<details>
<summary><strong>flclashx-view</strong> — proxy list appearance</summary>

```bash
flclashx-view: type:list; sort:delay; layout:tight; icon:icon; card:shrink
```
</details>

<details>
<summary><strong>Other headers</strong></summary>

| Header | Purpose |
| --- | --- |
| `flclashx-custom` | settings application policy: `add` / `update` |
| `flclashx-denywidgets` | `true` — block user dashboard editing |
| `flclashx-newboard` | `true`/`false` — default new home screen state |
| `flclashx-servicename` | service name for the serviceInfo card |
| `flclashx-servicelogo` | service logo (png/svg) |
| `flclashx-serverinfo` | group name for the server card / change-server button |
| `flclashx-buyplan` / `flclashx-buytraffic` | renewal / traffic purchase links |
| `support-url` | support link |
| `announce` | provider announcement (text or base64) |
| `flclashx-hex` | app theme HEX color |
| `flclashx-settings` | app presets |
| `flclashx-globalmode` | `false` — hide the outbound-mode chip |
| `flclashx-androidsecure` | `true` — forced secure mode on Android |
</details>

---

## 🚀 Installation & usage

### Download

<a href="https://github.com/NeroBaxmond/FlClashNext/releases"><img alt="Get it on GitHub" src="snapshots/get-it-on-github.svg" width="200px"/></a>

### Linux
```bash
sudo dpkg -i <file>.deb
```

### Android
Deep links for automation:
```text
io.github.nerobaxmond.flclashnext.action.START
io.github.nerobaxmond.flclashnext.action.STOP
io.github.nerobaxmond.flclashnext.action.CHANGE
```

---

## ⭐ Star History

If you find this project useful, please star the original projects and this fork!
