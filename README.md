<div>

[**English**](README_EN.md)

</div>

## FlClash Next

[![Downloads](https://img.shields.io/github/downloads/NeroBaxmond/FlClashNext/total?style=flat-square&logo=github)](https://github.com/NeroBaxmond/FlClashNext/releases/)
[![Last Version](https://img.shields.io/github/release/NeroBaxmond/FlClashNext/all.svg?style=flat-square)](https://github.com/NeroBaxmond/FlClashNext/releases/)
[![License](https://img.shields.io/github/license/NeroBaxmond/FlClashNext?style=flat-square)](LICENSE)

**FlClash Next** — форк мультиплатформенного FlClash-клиента на ядре ClashMeta (mihomo), развиваемый как личный, тщательно отполированный релиз: понятный главный экран, стабильная работа VPN и умный выбор серверов.

- 🧑‍💻 **Создатель форка:** [udizu (NeroBaxmond)](https://github.com/NeroBaxmond)
- 🙌 **Оригинальный проект:** [FlClash (chen08209)](https://github.com/chen08209/FlClash) и [FlClashX (pluralplay)](https://github.com/pluralplay/FlClashX)
- ⚙️ **Ядро:** [mihomo (MetaCubeX)](https://github.com/MetaCubeX/mihomo)

---

## ✨ Особенности форка

### 🏠 Главный экран нового поколения
- **Hero-панель по умолчанию:** статус подключения, большая круглая кнопка питания с таймером сессии и карточка «группа → сервер» с флагом, IP и качеством связи (пинг в виде полос сигнала).
- **Карточки можно настраивать:** кнопка-карандаш открывает режим редактирования — карточки нового вида (статус, кнопка, сервер, доп. сведения) включаются и отключаются переключателями, а ниже можно добавить и расставить любые классические карточки, как в старом дашборде.
- **Классический вид никуда не делся:** переключатель «Классический вид» в настройках возвращает полностью прежний редактируемый дашборд.

### 🎯 Умный выбор сервера
- Улучшенная работа с группами `url-test`: выбранная группа автоматически подхватывается на главном экране, отображается реальный выходной сервер (не группа), а пинг, измеренный «через раз», больше не помечает живой узел как недоступный — одиночный сбой автоматически повторяется.

### 🔋 Энергосбережение — только по желанию
- Необязательный режим экономии батареи (Настройки → Приложение, первый пункт): снижает фоновые обновления и health-check'и, увеличивает keep-alive.
- По умолчанию **выключен**: приложение ведёт себя ровно как оригинал.

### 🎨 Material 3 и полировка
- Material 3 повсеместно: динамические схемы цвета, обновлённые диалоги, листинги, нижняя навигация.
- Оптимизация под экраны высокой частоты обновления (120 Гц) на Android.
- Убрана служебная плашка PRE/DEBUG.
- Поддержка кастомизации от провайдера: заголовки `flclashx-*` позволяют подписке задавать тему, видимость карточек, отображение сервера, ссылки продления и многое другое (см. ниже).

### 🧰 Дополнительные функции (унаследованы и улучшены)
- Виджеты дашборда: скорость сети, режим исходящих, расход трафика, объявление провайдера, MetaInfo, проверка сети, кнопки TUN/VPN/системного прокси, внутренний IP, память, смена сервера, информация о сервисе.
- Гибкая настройка вида списка прокси из подписки (`flclashx-view`).
- Поддержка Android TV (фокусировка D-pad), статус-бара macOS, глубоких ссылок Android и виджетов рабочего стола.
- Встроенный Zashboard, обновление ядра прямо из приложения, экранное управление профилями с HWID-проверкой (Remnawave).

---

## 🙏 Авторы и благодарности

### Создатель форка
**[udizu (NeroBaxmond)](https://github.com/NeroBaxmond)** — ребрендинг, новый главный экран, энергосбережение, фиксы стабильности и релизы FlClash Next.

### Оригинальный FlClash
Огромное спасибо команде оригинального проекта:
- **[chen08209](https://github.com/chen08209)** — автор FlClash;
- **[pluralplay](https://github.com/pluralplay)** и **[kastov](https://github.com/kastov)** — авторы FlClashX;
- а также **[katsukibtw](https://github.com/katsukibtw)**, **[prettyleaf](https://github.com/prettyleaf)**, **[mitsuha44](https://github.com/mitsuha44)**, **[txyyh](https://github.com/txyyh)** и все остальные контрибьюторы FlClash и FlClashX.

### Ядро
- **[mihomo / MetaCubeX](https://github.com/MetaCubeX/mihomo)** — ядро ClashMeta.

> 💡 **Примечание:** небольшая часть кода этого форка написана с помощью ИИ, затем проверена, адаптирована и протестирована сопровождающим проекта.

---

## 📡 Кастомизация от провайдера (заголовки `flclashx-*`)

<details>
<summary><strong>flclashx-widgets</strong> — список карточек дашборда</summary>

```bash
flclashx-widgets: announce,metainfo,outboundModeV2,networkDetection
```

Доступные карточки: `announce`, `networkSpeed`, `outboundMode`, `outboundModeV2`, `trafficUsage`, `networkDetection`, `tunButton`, `vpnButton`, `systemProxyButton`, `intranetIp`, `memoryInfo`, `metainfo`, `changeServerButton`, `serviceInfo`, `zashboardButton`.
</details>

<details>
<summary><strong>flclashx-view</strong> — вид списка прокси</summary>

```bash
flclashx-view: type:list; sort:delay; layout:tight; icon:icon; card:shrink
```
</details>

<details>
<summary><strong>Прочие заголовки</strong></summary>

| Заголовок | Назначение |
| --- | --- |
| `flclashx-custom` | политика применения настроек: `add` / `update` |
| `flclashx-denywidgets` | `true` — запретить редактирование дашборда пользователем |
| `flclashx-newboard` | `true`/`false` — новый главный экран по умолчанию |
| `flclashx-servicename` | название сервиса для карточки serviceInfo |
| `flclashx-servicelogo` | логотип сервиса (png/svg) |
| `flclashx-serverinfo` | имя группы для карточки «сервер» и смены сервера |
| `flclashx-buyplan` / `flclashx-buytraffic` | ссылки продления/покупки трафика |
| `support-url` | ссылка поддержки |
| `announce` | объявление провайдера (текст или base64) |
| `flclashx-hex` | HEX-цвет темы приложения |
| `flclashx-settings` | преднастройки приложения |
| `flclashx-globalmode` | `false` — скрыть чип режима исходящих |
| `flclashx-androidsecure` | `true` — принудительный безопасный режим на Android |
</details>

---

## 🚀 Установка и использование

### Скачивание

<a href="https://github.com/NeroBaxmond/FlClashNext/releases"><img alt="Get it on GitHub" src="snapshots/get-it-on-github.svg" width="200px"/></a>
<a href="https://apps.obtainium.imranr.dev/redirect?r=obtainium://app/%7B%22id%22%3A%22io.github.nerobaxmond.flclashnext%22%2C%22url%22%3A%22https%3A%2F%2Fgithub.com%2FNeroBaxmond%2FFlClashNext%22%2C%22author%22%3A%22NeroBaxmond%22%2C%22name%22%3A%22FlClash%20Next%22%2C%22preferredApkIndex%22%3A0%2C%22additionalSettings%22%3A%22%7B%5C%22includePrereleases%5C%22%3Afalse%2C%5C%22fallbackToOlderReleases%5C%22%3Afalse%2C%5C%22filterReleaseTitlesByRegEx%5C%22%3A%5C%22%5C%22%2C%5C%22filterReleaseNotesByRegEx%5C%22%3A%5C%22%5C%22%2C%5C%22verifyLatestTag%5C%22%3Atrue%2C%5C%22sortMethodChoice%5C%22%3A%22date%22%2C%5C%22useLatestAssetDateAsReleaseDate%5C%22%3Afalse%2C%5C%22releaseTitleAsVersion%5C%22%3Afalse%2C%5C%22trackOnly%5C%22%3Afalse%2C%5C%22versionExtractionRegEx%5C%22%3A%5C%22%5C%22%2C%5C%22matchGroupToUse%5C%22%3A%5C%22%5C%22%2C%5C%22versionDetection%5C%22%3Atrue%2C%5C%22releaseDateAsVersion%5C%22%3Afalse%2C%5C%22useVersionCodeAsOSVersion%5C%22%3Afalse%2C%5C%22apkFilterRegEx%5C%22%3A%5C%22%5C%22%2C%5C%22invertAPKFilter%5C%22%3Afalse%2C%5C%22autoApkFilterByArch%5C%22%3Atrue%2C%5C%22appName%5C%22%3A%5C%22%5C%22%2C%5C%22appAuthor%5C%22%3A%5C%22%5C%22%2C%5C%22shizukuPretendToBeGooglePlay%5C%22%3Afalse%2C%5C%22allowInsecure%5C%22%3Afalse%2C%5C%22exemptFromBackgroundUpdates%5C%22%3Afalse%2C%5C%22skipUpdateNotifications%5C%22%3Afalse%2C%5C%22about%5C%22%3A%5C%22%5C%22%2C%5C%22refreshBeforeDownload%5C%22%3Afalse%2C%5C%22includeZips%5C%22%3Afalse%2C%5C%22zippedApkFilterRegEx%5C%22%3A%5C%22%5C%22%2C%5C%22includeTarballs%5C%22%3Afalse%2C%5C%22tarballedApkFilterRegEx%5C%22%3A%5C%22%5C%22%7D%22%2C%22overrideSource%22%3Anull%7D"><img alt="Obtainium" src="snapshots/get-it-on-github.svg" width="0"/></a>

### Linux
```bash
sudo dpkg -i <файл>.deb
```

### Android
Глубокие ссылки для автоматизации:
```text
io.github.nerobaxmond.flclashnext.action.START
io.github.nerobaxmond.flclashnext.action.STOP
io.github.nerobaxmond.flclashnext.action.CHANGE
```

---

## ⭐ Star History

Если проект оказался полезным — поставьте звезду оригинальным проектам и этому форку!
