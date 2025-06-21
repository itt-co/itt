<p align="center">
  <a href="#resistance-struggling-for-justice-in-an-authoritarian-world" rel="nofollow">
    <img src="https://raw.githubusercontent.com/Safouene1/support-palestine-banner/master/StandWithPalestine.svg" alt="Ceasefire Now" style="width:30%;">
  </a>
</p>

<br>

<div align="center">

<a href="#">
  <img src="https://raw.githubusercontent.com/emadadel4/itt/refs/heads/main/static/Images/logo.png" alt="itt" width="200" />
</a>

# Install Tweaks Tool

ITT (Install Tweaks Tool) included most Windows 10/11 Software and Windows Tweaks & Remove Bloatwares & Windows activation

![Endpoint Badge](https://img.shields.io/endpoint?url=https%3A%2F%2Fittools-7d9fe-default-rtdb.firebaseio.com%2Fmessage.json)
![Latest update](https://img.shields.io/badge/Latest%20update-06/21/2025-blue)
![Script size](https://img.shields.io/github/size/emadadel4/itt/itt.ps1?label=Script%20size)
<!-- ![Visitors](https://api.visitorbadge.io/api/visitors?path=https%3A%2F%2Fgithub.com%2Femadadel4%2Fitt%2F&countColor=%23263759&style=flat) -->

[![itt Community](https://img.shields.io/badge/Telegram%20-Join%20Community-26A5E4?logo=telegram)](https://t.me/ittcommunity)
[![Discord](https://img.shields.io/badge/Discord-Join%20Community-5865F2?logo=discord&logoColor=white)](https://discord.gg/Twyz2Wd5fB)

[![Arabic](https://img.shields.io/badge/Arabic-red)](/locales/ar.csv) [![French](https://img.shields.io/badge/French-blue)](/locales/fr.csv) [![Turkish](https://img.shields.io/badge/Turkish-red)](/locales/tr.csv) [![Chinese](https://img.shields.io/badge/Chinese-red)](/locales/zh.csv) [![Korean](https://img.shields.io/badge/Korean-white)](/locales/ko.csv) [![German](https://img.shields.io/badge/German-red)](/locales/de.csv) [![Russian](https://img.shields.io/badge/Russian-blue)](/locales/ru.csv) [![Spanish](https://img.shields.io/badge/Spanish-red)](/locales/es.csv) [![Italian](https://img.shields.io/badge/Italian-green)](/locales/it.csv) [![Hindi](https://img.shields.io/badge/Hindi-orange)](/locales/hi.csv)

###### 📦 413 Apps • ⚙️ 53 Tweaks • 🔧 17 Settings • 💬 109 Quote • 🎵 28 Soundtrack • 🌐 11 Localization

[![Typing SVG](https://readme-typing-svg.demolab.com?font=Fira+Code&pause=1000&center=true&vCenter=true&repeat=false&width=435&lines=Launch+Anytime+Anywhere!)](https://git.io/typing-svg)

</div>

<p align="center" dir="auto">

![ITT](https://raw.githubusercontent.com/emadadel4/itt/refs/heads/main/static/Images/themes.webp)

</p>

## 📖 Overview

* 🚀 **Automated Installation:** Get all your apps installed quietly in one go
* ⚙️ **Windows Debloater:** Remove bloatware and optimize performance.
* 👨‍💻 **Developer-Friendly:** Add apps, tweaks, themes, Locals and more.
* 🎵 **Can you hear the music**: Chill with tracks from the world of entertainment during setup.

## ⚡ Usage

<h3>On Windows 10/11:</h3>
<ol>
<li>Right-click on the Start menu.</li>
<li>Choose "PowerShell" and paste any of the following commands:</li>
</ol>

> [!CAUTION]  
> **LAUNCH THE SCRIPT ONLY USING OFFICIAL COMMANDS FROM THIS REPOSITORY.**  
> **IT'S NOT PORTABLE, SO DO NOT DOWNLOAD OR RUN IT FROM ELSEWHERE.**

```PowerShell
irm bit.ly/ittea | iex
```
### If URL is blocked in your region try:

```PowerShell
irm emadadel4.github.io/itt.ps1 | iex
```

```PowerShell
irm raw.githubusercontent.com/emadadel4/itt/main/itt.ps1 | iex
```
> [!NOTE]  
> All links point directly to the [itt.ps1](https://raw.githubusercontent.com/emadadel4/itt/refs/heads/main/itt.ps1)  file in this repository. You can test them in browser, make sure the link starts with https://

## ⚡ Quick Install Your Saved Apps (Run as Admin is recommended)
Example:

```PowerShell
iex "& { $(irm bit.ly/ittea) } -i .\myapps.itt"
```

# 🤝 How to Contribute

### Project Structure:
```
├── itt/
│   ├── static/      > Static files (e.g., apps, settings, images, etc.)
│   ├── Initialize/  > Scripts to set up default registry keys and launch the WPF app window
│   ├── locales/     > Localization files for different languages
│   ├── scripts/     > Core functionality scripts (e.g., install, script blocks, utility scripts)
│   ├── templates/   > Template files (e.g., README.md or other templates)
│   ├── themes/      > Theme files that define the application's visual style
│   ├── xaml/        > UI elements and windows (XAML files)
│   ├── build.ps1    > Builds the project and generates the final output script
│   └── itt.ps1      > This is the script that you run using the commands above
```

1. **Make sure you have PowerShell 7 installed (recommended) for building. is available on ITT**

2. **Fork the repository and clone it using [Github desktop](https://desktop.github.com/download/). is available on ITT**

3. **Open ITT Directory in PowerShell 7 (Run as Administrator)**

```PowerShell
Set-Location "C:\Users\$env:USERNAME\Documents\Github\ITT"
```

4. **Choose what you want to add.**

<h3>📦 Add a New App</h3>

```PowerShell
.\newApp.ps1
```

<h3>⚙️ Add a New Tweak</h3>

```PowerShell
.\newTweak.ps1
```

> [!NOTE]  
> Ensure you understand the tweak you are adding and test it before committing.

### 🌐 Add your native language  
*Run the following script:*

```PowerShell
.\newLocale.ps1
```

> Edit `locale.csv` file using [edit-csv extension](https://marketplace.visualstudio.com/items?itemName=janisdd.vscode-edit-csv)

---

### 🎨 Create your own theme

```PowerShell
.\newTheme.ps1
```

---

### 🎵 Add a New Soundtrack

```PowerShell
.\newOST.ps1
```

---

### 📜 Add a New Quote

```PowerShell
.\newQuote.ps1
```

---

### 🛠️ Build and debug

```PowerShell
.\build.ps1 -Debug
```

> [!NOTE]  
> Test your changes before you submit the Pull Request

<br>

## ✊ Resist for Justice in a World Ruled by Authoritarian Regimes 

<a href="https://git.io/typing-svg">
  <img src="https://readme-typing-svg.demolab.com?font=Fira+Code&pause=5000&color=F70000&width=435&lines=%23STOP_GENOCIDE!;%23StandWithPalestine" alt="Typing SVG" />
</a>

<p align="left">
  <a href="https://www.palestinercs.org/en/Donation" target="_blank">
    <img src="https://media1.giphy.com/media/iUNO3pXpfqiZ8JQ1Jo/giphy.gif" width="270" alt="Palestine GIF" />
  </a>
  <a href="https://www.reddit.com/r/Palestine/wiki/donate/" target="_blank">
    <img src="https://styles.redditmedia.com/t5_2qhak/styles/image_widget_78cydyzl3ktb1.png" width="339" alt="Stand with Palestine" />
  </a>
</p>

## Helpful Links

* [Palestine Red Crescent Society](https://www.palestinercs.org/en/Donation)
* [Support via Boycott](https://boycott4.github.io/boycott/)
* [ZionistThings on Reddit](https://www.reddit.com/r/ZionistThings/)

<div align="Center">

### "If you can't lift the injustice, at least tell everyone about it."
### "إذا لم تستطع رفع الظلم، على الاقل اخبر الجميع عنه"
</div>

<br>

## ⭐ Support Project

If you find this project helpful Give it a ⭐ on GitHub

[![Stargazers repo roster for @emadadel4/itt](https://reporoster.com/stars/dark/emadadel4/itt)](https://github.com/emadadel4/itt/stargazers)
