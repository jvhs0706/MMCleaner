# MMCleaner (Magisk Module)

This Magisk module adds an **Action** button to perform **extremely aggressive** cleaning of `com.tencent.mm` internal data.

## ⚠️ CRITICAL WARNINGS

**1. DATA DESTRUCTION**  
This script employs a "scorched earth" approach. Do not assume it will preserve anything more than uninstalling the entire app would. The data it deletes includes, but is not limited to:

* **Chat-related files** (media, attachments, etc.)
* **Native libraries & dynamic modules** (causing slow app re-initialization on the next launch)
* **All avatars & thumbnails** (images will reload slowly as you scroll through chats)
* **Mini Programs (AppBrand) & WebView data**
* **Crash logs, XLogs, and SQL traces**

**2. PROFESSIONAL USE**  
**DO NOT USE THIS MODULE** if you rely on `com.tencent.mm` for critical work, business, or time-sensitive communication. Chat-related files will be permanently deleted, and `com.tencent.mm` will experience slow startup and potential lag while regenerating cache files after cleaning.

**3. ACCOUNT SAFETY**  
**Modifying internal application data via root access involves inherent risks.** While this script only deletes cache and temporary files, aggressive tampering with app data may theoretically trigger security mechanisms. **You assume all risks regarding potential account restrictions, bans, or suspensions.**

---

## Features

* **One-Tap Cleaning:** Adds a native "Action" button to the module card in Magisk
* **Deep System Clean:** Targets protected system directories (`/data/data/...`) that standard Android cleaners cannot access
* **Customizable:** Cleaning rules are defined in `action.sh` and can be edited to whitelist specific folders

## Installation & Usage

**⚠️ Important:** Read and fully understand `action.sh` before using this module.

1. Download the latest `MMCleaner.zip`
2. Open the **Magisk** app
3. Navigate to **Modules** → **Install from Storage** → select the zip file
4. **Reboot** your device
5. To clean: Open Magisk, locate this module, and tap the **Action Button**

## Configuration

To customize deletion rules (e.g., to preserve Mini Programs or thumbnails), edit the script directly on your device:

1. Use a root file explorer (such as MT Manager) to navigate to:  
   `/data/adb/modules/mm_radical_cleaner/`
2. Open `action.sh`
3. Comment out (prefix with `#`) any lines corresponding to folders you wish to preserve

---

## Legal & Usage Policy

### Educational Purposes Only

The content published in this repository is provided strictly for **educational and research purposes**.

### Prohibited Uses

* **Do not use this project for illegal purposes**
* **Do not use this project for commercial purposes**

### Liability & Risk

* **Account Safety:** This module may result in consequences such as account restrictions or bans. **Use at your own risk.**
* **Legal Disclaimer:** The author accepts no liability for any legal disputes arising from use of this tool. All legal consequences are solely the user's responsibility.

### No Warranty

This software is provided "as is," without warranty of any kind. Neither the developer of this module, the developer of `com.tencent.mm`, nor any third party is responsible for data loss, bootloops, app instability, or other damages resulting from its use.

---

## A Personal Note

This tool is optimized for my personal usage patterns. I employ such aggressive cleaning methods because I do not rely on `com.tencent.mm` for work or professional communications.

I recognize that this is a vital communication platform with an impressive ecosystem that has transformed daily life for millions. My approach to managing its data is not a criticism of its engineering or utility.

However, my rigorous cleaning habits stem from past negative experiences. Specifically, the behavior of certain individuals via this platform has made me reluctant to use it. This tool allows me to maintain it for absolute necessity while minimizing its presence in my daily life.

**If these cleaning rules seem too extreme, please understand they reflect my personal relationship with the platform and may not suit your needs.**