# dotfiles

I use [`Dotbot`](https://github.com/anishathalye/dotbot) to manage my dotfiles.

Previusly, I also used it ot install `rmp` packages and `flatpak` apps through the [`shell`](https://github.com/anishathalye/dotbot?tab=readme-ov-file#shell) directive, but eventually gave up on this approach – it overly complicates the [configuration](https://github.com/dvdvnine/dotfiles/blob/main/.install.conf.yml) and doesn't seem like the right tool for the job.

## Installation

### Configs

> [!NOTE]
> When needed, I extend the current configs with local ones that I import, like `config_private` for `configs/git/config`.

Clone this repo

```bash
git clone https://github.com/dvdvnine/dotfiles.git ~/.dotfiles && cd $_
```

Run

```bash
./install
```

**Firefox (Zen)**

Create a symlink in `chrome/` to `firefox/userChrome.css` in your Firefox profile (e.g. `~/.zen/03zuh031.Default (release)/chrome/`)

```bash
ln -s ~/.dotfiles/firefox/userChrome.css /path/to/your/profile
```

### `RPM` packages

> [!IMPORTANT]
> This is specific to `Fedora Linux`.

First, enable third-party repositories

```bash
sudo dnf copr enable atim/starship # prompt.
sudo dnf copr enable scottames/ghostty  # terminal emulator.
sudo dnf copr enable dejan/lazygit  # better Git interface.
sudo dnf copr enable atim/lazydocker  # better Docker interface.
sudo dnf copr enable codifryed/CoolerControl  # cooling management.
```

... for `VSCode`, with is a special case – you need to [add the GPG key first, then the repo](https://code.visualstudio.com/docs/setup/linux#_rhel-fedora-and-centos-based-distributions)

```bash
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\nautorefresh=1\ntype=rpm-md\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" | sudo tee /etc/yum.repos.d/vscode.repo > /dev/null
```

Parse the [`Appfile`](https://github.com/dvdvnine/dotfiles/blob/main/Appfile) and install `rmp` packages

```bash
grep "^ *dnf" Appfile | sed "s/^ *dnf *//" | xargs sudo dnf -y install
```

Set the default shell to `zsh` and swith to it

```bash
chsh -s $(which zsh) && exec $_
```

Using [`antidote`](https://github.com/mattmc3/antidote) for plugin management

```bash
git clone --depth=1 https://github.com/mattmc3/antidote.git ${ZDOTDIR:-$HOME}/.antidote
```

Start `Docker Engine` (additionally: [to avoid running as `sudo`](https://docs.docker.com/engine/install/linux-postinstall))

```bash
sudo systemctl enable --now docker
```

Don't forget to enable the cooling management daemon

```bash
sudo systemctl enable --now coolercontrold
```

### `Flatpak` apps

> [!NOTE]
> I prefer using apps from [`flathub`](https://flatpak.org/setup/Fedora) instead of the local repo – not sure why, but the latter just doesn't work as well.

Parse [`Appfile`](https://github.com/dvdvnine/dotfiles/blob/main/Appfile) again and install apps **from `flathub` for the current user**

```bash
grep "^ *flatpak" Appfile | sed "s/^ *flatpak *//" | xargs flatpak install -u --noninteractive flathub
```

### Additionally

#### `Python` tools

I prefer installing additional tools in virtual envs using [`pipx`](https://pipx.pypa.io/stable/)

```bash
pipx install uv
```

#### Keyboard

For keyboard remapping, I use the cross-platform software remapper [`kanata`](https://github.com/jtroo/kanata), which works universally with any keyboard.

> [!NOTE]
> The `kanata` version and config path are specified inside the script.

The script below performs several steps to install and configure `kanata` with a dedicated user and hardened `systemd` service for improved security.

Steps:

- install `kanata`
- copy your config to the system location `/etc/kanata/kanata-config.kbd`
- create user\group
- set rules
- create\enable\start the `systemd` service

Run

```bash
chmod +x scripts/setup-kanata-hardened.sh && sudo $_
```

If you need to remove everything, use this second script

```bash
chmod +x scripts/remove-kanata.sh && sudo $_
```

---

Influenced by:

- https://anishathalye.com/managing-your-dotfiles
- https://github.com/anishathalye/dotfiles
- https://github.com/sobolevn/dotfiles
- https://github.com/getantidote/zdotdir
