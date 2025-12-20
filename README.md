# dotfiles

What’s in here:

- Setting up up-to-date configs using [`Dotbot`](https://github.com/anishathalye/dotbot).
- Installing apps.
- Setting up software keyboard remapping using [`kanata`](https://github.com/jtroo/kanata).

## Installation

### Configs

> [!NOTE]
> When needed, I extend the current configs with local ones that I import (eg, `config_private` for `configs/git/config`).

Clone this repo

```bash
git clone https://github.com/dvdvnine/dotfiles.git ~/.dotfiles && cd $_
```

Run

```bash
bash install
```

**Firefox**

Copy `user.js`, `updater.sh`, and `prefsCleaner.sh` from https://github.com/arkenfox/user.js together with [`user-overrides.js`](https://github.com/dvdvnine/dotfiles/blob/main/configs/firefox/user-overrides.js) from this repo into your `Firefox` profile (e.g. `~/.mozilla/firefox/l5h7qp2e.default-release`).

Run

```bash
bash updater.sh
```

Create a symlink in the `chrome/` folder to `configs/firefox/userChrome.css` in your `Firefox` profile

```bash
ln -s ~/.dotfiles/configs/firefox/userChrome.css /path/to/your/profile/chrome/
```

Plugins

- [uBlock Origins](https://addons.mozilla.org/firefox/addon/ublock-origin/)
- [SponsorBlock](https://addons.mozilla.org/firefox/addon/sponsorblock/)
- [Red Shield VPN](https://addons.mozilla.org/firefox/addon/red-shield-vpn/)
- [Tampermonkey](https://addons.mozilla.org/firefox/addon/tampermonkey/) (for [`voice-over translate from YandexBrowser`](https://github.com/ilyhalight/voice-over-translation) and [`telegram downloader`](https://github.com/Neet-Nestor/Telegram-Media-Downloader))
- [TWP - Translate Web Pages](https://addons.mozilla.org/firefox/addon/traduzir-paginas-web/) (default translator sucks – it doesn't translate mixed pages)
- [Canvas Defender](https://addons.mozilla.org/firefox/addon/no-canvas-fingerprinting/)
- [I still don't care about cookies](https://addons.mozilla.org/firefox/addon/istilldontcareaboutcookies/)
- [Allow Right-Click](https://addons.mozilla.org/firefox/addon/re-enable-right-click/)
- [Video DownloadHelper](https://addons.mozilla.org/firefox/addon/video-downloadhelper/) (with [`CoApp`](https://github.com/aclap-dev/video-downloadhelper/wiki/CoApp-Installation))

### Apps

#### `RPM`

> [!IMPORTANT]
> Relevant for `Fedora Linux`

Enable external repositories

```bash
sudo dnf copr enable atim/starship # prompt.
sudo dnf copr enable scottames/ghostty  # terminal emulator.
sudo dnf copr enable dejan/lazygit  # better Git interface.
sudo dnf copr enable atim/lazydocker  # better Docker interface.
sudo dnf copr enable codifryed/CoolerControl  # cooling management.
```

Parse `rpm` package names from [`Appfile`](https://github.com/dvdvnine/dotfiles/blob/main/Appfile) and install them

```bash
grep "^ *dnf" Appfile | sed "s/^ *dnf *//" | xargs sudo dnf -y install
```

**Shell**

Switch to the new shell

```bash
chsh -s $(which zsh) && exec $_
```

Clone [`antidote`](https://github.com/mattmc3/antidote) for plugin management

```bash
git clone --depth=1 https://github.com/mattmc3/antidote.git ${ZDOTDIR:-$HOME}/.antidote
```

You’ll probably need to load the plugins manually (issue with the update date of the file containing the list)

```bash
antidote load
```

**Docker**

Start `Docker Engine`

```bash
sudo systemctl enable --now docker
```

And so you don’t have to call it with `sudo` every time, you can follow the [post-installation guide](https://docs.docker.com/engine/install/linux-postinstall/).

**Zed**

[yolo](https://zed.dev/docs/linux)

```bash
curl -f https://zed.dev/install.sh | sh
```

**CoolerControl**

Start

```bash
sudo systemctl enable --now coolercontrold
```

#### `Flatpak`

> [!NOTE]
> I prefer apps from [`flathub`](https://flatpak.org/setup/Fedora) - they just work better than in my local repository.

Parse `flatpak` app names from [`Appfile`](https://github.com/dvdvnine/dotfiles/blob/main/Appfile) and install them for the user.

```bash
grep "^ *flatpak" Appfile | sed "s/^ *flatpak *//" | xargs flatpak install -u --noninteractive flathub
```

### Additionally

#### Keyboard

The script’s job is to install and set up `kanata` with a dedicated user and `systemd` hardening for extra security.

Steps:

1. Installs `kanata` (version and config file path are specified inside the script).
2. Copies your config to the system location `/etc/kanata/kanata-config.kbd`.
3. Creates a group/user.
4. Installs rules.
5. Creates/enables/starts a `systemd` service.

Run and restart the session

```bash
chmod +x scripts/setup-kanata-hardened.sh && sudo $_
```

If you need to remove it

```bash
chmod +x scripts/remove-kanata.sh && sudo $_
```

---

Influenced by:

- https://anishathalye.com/managing-your-dotfiles
- https://github.com/anishathalye/dotfiles
- https://github.com/sobolevn/dotfiles
- https://github.com/getantidote/zdotdir
