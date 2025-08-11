
# telegram-bot-api

A lightweight and easy-to-install Telegram Bot API binary for quick deployment and ease of use.

---

## Features

- **Simple installation** via a single `curl` command  
- Supports **system-wide installation** with `sudo` privileges  
- Supports **local installation** without `sudo` for user-level usage  
- Single binary executable — no complex dependencies or setup required  
- Automatically updates your `PATH` on local install for immediate use  

---

## Installation Guide

Run the following command in your terminal to install **telegram-bot-api**:

```bash
curl -fsSL https://raw.githubusercontent.com/prad9036/telegram-bot-api/main/install.sh | bash
```

### What this script does:

- Downloads the latest `.deb` package from the GitHub repository  
- Attempts a **system-wide installation** if you have `sudo` privileges  
- If `sudo` is not available, installs the binary **locally in your home directory** and updates your `PATH` automatically  

---

## Usage

After installation, run the bot using:

```bash
telegram-bot-api [options]
```

> Replace `[options]` with the available command line options supported by the binary.

### Important:

- If you installed **locally** (without `sudo`), you may need to **restart your terminal** or run the following command to update your shell environment:

```bash
source ~/.bashrc
```

---

## Uninstallation

### If installed system-wide:

```bash
sudo dpkg -r telegram-bot-api
```

### If installed locally:

```bash
rm -f ~/bin/telegram-bot-api
rm -rf ~/mytelegrambot
sed -i '/export PATH=\$HOME\/bin:\$PATH/d' ~/.bashrc
source ~/.bashrc
```

---

## Support & Contribution

For issues, feature requests, or contributions, please visit the [GitHub repository](https://github.com/prad9036/telegram-bot-api).

---

## License

This project is licensed under the [MIT License](LICENSE).

---

*Enjoy building your Telegram bots with ease!* 🚀
