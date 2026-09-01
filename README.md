# dotfiles

Built with:

- config management with [`Dotbot`](https://github.com/andresharpe/dotbot);
- package management with [`Shelly`](https://github.com/Seafoam-Labs/Shelly-ALPM);
- dev tooling and environment management with [`mise`](https://github.com/jdx/mise).

## Deploy

> [!NOTE]
> Some configs are extended with local private files, such as `config.private` for `Git`.

Clone the repo:

```sh
git clone https://github.com/dvdvnine/dotfiles ~/.dotfiles
```

Link dotfiles:

```sh
dotbot -c ~/.dotfiles/install.conf.yaml
```

Install packages:

```sh
sudo pacman -S --needed --noconfirm flatpak shelly shelly-flatpak-backend
shelly backup import ~/.dotfiles/manual/pkgs/Shellfile.toml --no-confirm
```

Install dev tools:

```sh
mise install
```

Create symlinks for `Firefox`:

```sh
ln -s ~/.dotfiles/manual/firefox/user.js ~/.configs/mozilla/firefox/<profile>/user.js
ln -s ~/.dotfiles/manual/firefox/userChrome.css ~/.configs/mozilla/firefox/<profile>/chrome/userChrome.css
```
