# dotfiles

Built with:

- config management with [`Dotbot`](https://github.com/andresharpe/dotbot);
- ~~package management with [`Shelly`](https://github.com/Seafoam-Labs/Shelly-ALPM)~~ (sucks for now);
- dev tooling and environment management with [`mise`](https://github.com/jdx/mise).

## Deploy

> [!NOTE]
> Some configs are extended with local private files, such as `config.private` for `Git`.

Clone the repo:

```sh
git clone https://github.com/dvdvnine/dotfiles ~/.dotfiles
```

Install managers:

```sh
sudo pacman -S --needed --noconfirm flatpak paru mise
```

Install packages:

```sh
awk '$1=="repo"{print $2}' ~/.dotfiles/manual/pkgs/packages.txt | xargs -r sudo pacman -S --needed --noconfirm
awk '$1=="aur"{print $2}' ~/.dotfiles/manual/pkgs/packages.txt | xargs -r paru -S --needed --noconfirm
awk '$1=="flatpak"{print $2}' ~/.dotfiles/manual/pkgs/packages.txt | xargs -r flatpak install -y --noninteractive flathub
```

Install dev tools:

```sh
mise install
```

Link dotfiles:

```sh
dotbot -c ~/.dotfiles/install.conf.yaml
```

Create symlinks for `Firefox`:

```sh
ln -s ~/.dotfiles/manual/firefox/user.js ~/.config/mozilla/firefox/<profile>/user.js
ln -s ~/.dotfiles/manual/firefox/userChrome.css ~/.config/mozilla/firefox/<profile>/chrome/userChrome.css
```

---

Inspired by:

- https://anishathalye.com/managing-your-dotfiles
- https://github.com/anishathalye/dotfiles
- https://github.com/sobolevn/dotfiles
- https://github.com/devpew/dotfiles
