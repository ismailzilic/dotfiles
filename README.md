# Dotfiles

These configuration files are managed with [GNU Stow](https://www.gnu.org/software/stow/).

---

## Setup

1. **Clone the repository**:

```bash
git clone https://github.com/ismailzilic/dotfiles.git ~/dotfiles
cd ~/dotfiles
```

2. **Install GNU Stow**:

- Arch Linux:

```bash
sudo pacman -S stow
```

- On Ubuntu/Debian:

```bash
sudo apt install stow
```

- On Fedora:

```bash
sudo dnf install stow
```

- On macOS (Homebrew):

```bash
brew install stow
```

3. **Deploy dotfiles**:
   From inside the `dotfiles` directory, run:

```bash
stow zsh
stow .config
```

This will create symlinks in your home directory:

`~/.zshrc` → `~/dotfiles/zsh/.zshrc`  
`~/.config/...` → `~/dotfiles/.config/...`
