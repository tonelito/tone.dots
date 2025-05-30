# tone.dots

My personal configuration for Windows, MacOS & Linux.

The majority of the terminal emulator & nvim configurations are thanks to [Alan Buscaglia](https://github.com/Alan-TheGentleman) and his [Gentleman.Dots](https://github.com/Gentleman-Programming/Gentleman.Dots.git)

## Installation

**Important: _Clone the repo and set yourself inside of it before any of the following steps._**
```bash
git clone https://github.com/tonelito/tone.dots.git
cd tone.dots
```

### Windows 11

**Windows 11 Debloated (Optional)**

If you want to make a clean install for Windows 11 and you're searching for a debloater i would recommend [winutil](https://github.com/ChrisTitusTech/winutil.git) from [ChrisTitusTech](https://github.com/ChrisTitusTech)

```ps1
irm "https://christitus.com/win" | iex
```

---

#### 1. Tools for Windows

**[PowerToys](https://github.com/microsoft/PowerToys) (App Runner):**
PowerToys is a set of tools released by Microsoft for Windows 11. The tool PowerToys Run is similar to Raycast on MacOS; it is not even close to be as powerful as Raycast but it serves the purpose of running apps.

```powershell
winget install Microsoft.PowerToys -s winget
```

after installing PowerToys you can try Powertoys Run with `alt+space`

**[GlazeWM & Zebar](https://github.com/glzr-io) (Window & Workspace Manager & Status Bar):**
GlazeWM is a tiling window manager for Windows similar to i3 on Linux; it will also let you create virtual workspaces. In the installation process you can choose if you want to install Zebar, a status bar that works along GlazeWM.

```powershell
winget install GlazeWM
```

after installing both of them copy-paste my configuration folders inside of `C:\Users\$Username\.glzr`.

if you want them to be launched on startup, you need to create a shortcut for the `.exe` files from each app in `C:\Program Files\glzr.io` and place the shortcuts inside of `C:\Users\$Username\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup`

**[AutoHotKey](https://autohotkey.com/):** lets you create hotkeys for running apps by creating scripts and placing shortcuts of this scripts inside of `C:\Users\$Username\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup`

**[TranslucentTB](https://github.com/TranslucentTB/TranslucentTB):** makes windows taskbar transparent, you can install it via Microsoft Store & choose to run on StartUp in his options.

---

#### 2. Install WSL

WSL (Windows Subsystem for Linux) allows you to run Linux on Windows.

Press the windows key and search for 'Turn Windows Features on or off'
Make sure you have Virtual Machine Platform & Windows Hypervisor Platform enabled

After this open the terminal and install WSL & make sure you have version 2 or above

```powershell
wsl --install
wsl -v
```

if you still can't install wsl it's probably because your machine has the Virtualization Functionality OFF, for turning it on you need to go to your BIOS, search for the Virtualization functionality and turn it ON.

By default WSL will install Ubuntu as the main distro, but if you're more familiar with Linux you can choose to install another one of the available distros.

```powershell
wsl --list --online
```

Install your preferred distribution:

```powershell
wsl --install -d <distribution-name>
```
---

#### 3. Installing a Nerd Font

A Nerd Font is a font that adds extra glyphs (icons) from font packs like Font Awesome, Material Design Icons, and others.

The IosevkaTerm Nerd Font is required for the terminal emulator in this setup. On Windows, this installation must be done manually.

1. **Download the IosevkaTerm Nerd Font** from its [official site](https://www.nerdfonts.com/) or from [Nerd Fonts GitHub](https://github.com/ryanoasis/nerd-fonts).

2. **Extract the archive** and locate the font files (`.ttf` or `.otf`).

3. **Install the fonts**: Right-click each font file and select **"Install for all users"** to install the font system-wide.

---

#### 4. Launch and Configure the Distribution
Open the installed distribution to complete setup. Update it with:

```bash
sudo apt-get update
sudo apt-get upgrade
```

---

#### 5. Install the terminal emulator

I use Wezterm because it's the only terminal emulator that works decently across Windows, MacOS & Linux.

 **WezTerm**: [Download and Install](https://wezfurlong.org/wezterm/installation.html)

---

#### 6. Configuration Transfer for Terminal Emulator
Using PowerShell:
```powershell
Copy-Item -Path .wezterm.lua -Destination $HOME
```

**_Important_: Uncomment this settings if they're commented; also if you don't use Ubuntu you need to change the name of the distro to the one you're using in WSL**

```powershell
# config.default_domain = 'WSL:Ubuntu'
# config.front_end = "WebGpu"
# config.max_fps = 120
```

---

#### 7. Install Chocolatey and win32yank

**Chocolatey** is a package manager for Windows that simplifies the installation of software.

**To install Chocolatey:**

- Open **PowerShell** as an administrator.
- Run the following command:

```powershell
Set-ExecutionPolicy Bypass -Scope Process -Force; `
[System.Net.ServicePointManager]::SecurityProtocol = `
[System.Net.ServicePointManager]::SecurityProtocol -bor 3072; `
iwr https://community.chocolatey.org/install.ps1 -UseBasicParsing | iex
```

**To install win32yank:**

- After installing Chocolatey, run:

```powershell
choco install win32yank
```

**Note:** `win32yank` is required for clipboard integration in Neovim when using WSL.

---

#### 8. Install Dependencies

```bash
sudo apt-get update
sudo apt-get install -y build-essential curl file git
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
. $HOME/.cargo/env
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

---

#### 9. Install IosevkaTerm Nerd Font inside of WSL
```bash
mkdir -p ~/.local/share/fonts
wget -O ~/.local/share/fonts/Iosevka.zip https://github.com/ryanoasis/nerd-fonts/releases/download/v3.3.0/IosevkaTerm.zip
unzip ~/.local/share/fonts/Iosevka.zip -d ~/.local/share/fonts/
fc-cache -fv
```

---

#### 10. Install Fish Shell with enhancements

```bash
brew install fish carapace zoxide atuin starship fzf
mkdir -p ~/.cache/starship
mkdir -p ~/.cache/carapace
mkdir -p ~/.local/share/atuin
cp -rf starship.toml ~/.config/
cp -rf /fish ~/.config
```

---

#### 11. Install TMUX

```bash
brew install tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
mkdir -p ~/.tmux
cp -r .tmux/* ~/.tmux/
cp .tmux.conf ~/
tmux
tmux source ~/.tmux.conf
```
---

#### 12. Install Neovim

```bash
brew install nvim node npm git gcc fzf fd ripgrep coreutils bat curl lazygit
mkdir -p ~/.config/nvim
cp -r nvim/* ~/.config/nvim/
```
---

#### 13. Set Fish as the default Shell

```bash
shell_path=$(which "fish")
```

Execute to Replace Default:
```bash
if [ -n "$shell_path" ]; then
  # Add shell to /etc/shells if not already present
  sudo sh -c "grep -Fxq \"$shell_path\" /etc/shells || echo \"$shell_path\" >> /etc/shells"

  # Change the default shell for the user
  sudo chsh -s "$shell_path" "$USER"

  # Verify if the shell has been changed
  if [ "$SHELL" != "$shell_path" ]; then
    echo -e "${RED}Error: Shell did not change. Please check manually.${NC}"
    echo -e "${GREEN}Command: sudo chsh -s $shell_path \$USER ${NC}"
  else
    echo -e "${GREEN}Shell changed to $shell_path successfully.${NC}"
  fi
else
  echo -e "${RED}Shell $shell_choice not found.${NC}"
fi

# Execute the chosen shell
exec $shell_choice
```

---

#### 14. Restart the Shell or Computer

- **Close and reopen your terminal**, or **restart your computer** or **WSL instance** for the changes to take effect.

---

You're done! Enjoy your new setup on Windows!

**Note:** If you encounter any problems during configuration, consult the official documentation of the tools, ask an LLM (AI) or seek help. online.
