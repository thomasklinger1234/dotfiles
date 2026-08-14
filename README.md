# dotfiles

## DESCRPTION

My personal dotfiles managed with GNU Stow.

See https://docs.github.com/en/github/developing-online-with-codespaces/personalizing-codespaces-for-your-account.

## PREREQUISITES

- [Homebrew](https://brew.sh) - The MacOS package manager
- [GNU Stow](https://man.archlinux.org/man/stow.8) - The dotfile manager

## INSTALLATION

```
git clone https://github.com/thomasklinger1234/dotfiles ~/dotfiles
~/dotfiles/bootstrap
```

### Post-install: `alacritty`

Download from [the .dmg](https://alacritty.org/) and install it. `brew` marks it as *deprecated*. 

### Post-install: `doom emacs`

Follow the [installation guide](https://github.com/doomemacs/core#install) and run 

```shell
doom sync
doom upgrade
```

### Post-install: `rust`

```shell
rustup component add rust-analyzer
rustup component add clippy
rustup component add rustfmt
```

### Post-install: `go`

```shell
go get -u github.com/x-motemen/gore/cmd/gore
go get -u github.com/stamblerre/gocode
go get -u golang.org/x/tools/cmd/godoc
go get -u golang.org/x/tools/cmd/goimports
go get -u golang.org/x/tools/cmd/gorename
go get -u golang.org/x/tools/cmd/guru
go get -u github.com/cweill/gotests/...
go get -u github.com/fatih/gomodifytags
```

### Post-install: `alacritty`

> Apple could not verify “Alacritty” is free of malware that may harm your Mac or compromise your privacy.

1. Open "System Preferences" / "system Settings" from the Apple menu.
1. Go to "Security & Privacy".
1. In the "General" tab, you should see a message at the bottom stating that the application was blocked, in my case it says Alacritty was blocked
1. Click on the "Open Anyway" button to allow the application to run.

[[Reference](https://dev.to/shihabdotdev/fix-macos-error-alacritty-cant-be-opened-because-apple-cannot-check-it-for-malicious-software-4b69)]