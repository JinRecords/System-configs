# System Configurations

Welcome to my repository of configurations designed to streamline my workflow. This collection will be updated periodically, so feel free to check back for new additions. Please note that some configurations are specifically tailored for macOS.

![alt text](/media/thumb.png)

## Overview of Configurations

This repository includes the following configurations:

1. **Yabai** - A tiling window manager for macOS.
2. **Ghostty** - A terminal emulator.
3. **Skhd** - A simple hotkey daemon for macOS.
4. **Übersicht** - A tool for creating desktop widgets using HTML/CSS/JavaScript.
5. **Simple Bar** - A customizable status bar for your desktop.
6. **NeoVim** - An extensible text editor that improves upon Vim.
7. **Neofetch** - A command-line utility that displays system information in a visually appealing way.
8. **Terminal Aliases** - Handy shortcuts to simplify command line usage.
9. **Cava** - A visualizer for audio output.
10. **Htop** - An interactive process viewer for Unix systems.

## Installing Dependencies via Homebrew

To ensure that all the necessary tools and utilities are available for your workflow, you can install them using Homebrew, a popular package manager for macOS. Follow the steps below to install each dependency:

### 1. Install Homebrew (if not already installed)
If you haven't installed Homebrew yet, open your terminal and run the following command:

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

### 2. Install the Dependencies
Once Homebrew is installed, you can install the required dependencies by running the following commands in your terminal:

```bash
# Install Yabai - Tiling Window Manager
brew install koekeishiya/formulae/yabai

# Install Ghostty - Terminal Emulator
brew install ghostty

# Install Skhd - Hotkey Daemon
brew install skhd

# Install Übersicht - Desktop Widgets Tool
brew install --cask ubersicht

# Install Simple Bar - Customizable Status Bar
brew tap fizzbuzzed/tap
brew install simple-bar

# Install Neovim - Extensible Text Editor
brew install neovim

# Install Neofetch - System Information Utility
brew install neofetch

# Install Terminal Aliases (optional)
# You can manually add aliases in your shell configuration file (e.g., ~/.zshrc)

# Install Cava - Audio Visualizer
brew install cava

# Install Htop - Interactive Process Viewer
brew install htop
```

### 3. Verify Installation
After installing each dependency, you can verify that they are installed correctly by checking their versions. For example:

```bash
nvim --version  # Check Neovim version
neofetch        # Display system information using Neofetch
htop            # Launch Htop to view processes interactively
```

### 4. Post-Installation Configuration
After installing these tools, you may want to configure them by moving the folders in the configs folder from the repository to the respective configuration directories on your system. For example, on mac, you can move the configs folder into Use `~/.config/` directory.
