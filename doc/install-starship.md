## install
```shell
$ curl -sS https://starship.rs/install.sh | sh

  Configuration
> Bin directory: /usr/local/bin
> Platform:      apple-darwin
> Arch:          aarch64

> Tarball URL: https://github.com/starship/starship/releases/latest/download/starship-aarch64-apple-darwin.tar.gz
? Install Starship latest to /usr/local/bin? [y/N] y
! Escalated permissions are required to install to /usr/local/bin
Password:
> Installing Starship as root, please wait…
✓ Starship installed
```

## add to config

```shell
> Please follow the steps for your shell to complete the installation:
  bash
  Add the following to the end of ~/.bashrc:

	eval "$(starship init bash)"

  zsh
  Add the following to the end of ~/.zshrc:

	eval "$(starship init zsh)"

  ion
  Add the following to the end of ~/.config/ion/initrc:

	eval $(starship init ion)

  tcsh
  Add the following to the end of ~/.tcshrc:

	eval `starship init tcsh`

  xonsh
  Add the following to the end of ~/.xonshrc:

	execx($(starship init xonsh))

  fish
  Add the following to the end of ~/.config/fish/config.fish:

	starship init fish | source

  elvish
  Warning Only elvish v0.17 or higher is supported.
  And add the following to the end of ~/.elvish/rc.elv:

	eval (starship init elvish)

  nushell
  Warning This will change in the future.
  Only Nushell v0.61 or higher is supported.
  Add the following to the end of your Nushell env file (find it by running $nu.env-path in Nushell): "mkdir ~/.cache/starship; starship init nu | save ~/.cache/starship/init.nu"
  And add the following to the end of your nu config file (find it by running $nu.config-path in Nushell):

	mkdir ~/.cache/starship
        starship init nu | save ~/.cache/starship/init.nu
        source ~/.cache/starship/init.nu

  PowerShell
  Add the following to the end of Microsoft.PowerShell_profile.ps1:
  You can check the location of this file by querying the $PROFILE variable in PowerShell.
  Typically the path is ~\Documents\PowerShell\Microsoft.PowerShell_profile.ps1 or ~/.config/powershell/Microsoft.PowerShell_profile.ps1 on -Nix.

	Invoke-Expression (&starship init powershell)

  Cmd
  You need to use Clink (v1.2.30+) with Cmd. Add the following to a file starship.lua and place this file in Clink scripts directory:

	load(io.popen('starship init cmd'):read("*a"))()
```