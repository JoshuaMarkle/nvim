<h1 align="center">Josh's Nvim Config</h1>

<p align="center">A nvim config designed for a CS students workflow</p>

![Screenshot 1](https://github.com/JoshuaMarkle/nvim-config/blob/main/docs/screenshot1.png?raw=true)
![Screenshot 2](https://github.com/JoshuaMarkle/nvim-config/blob/main/docs/screenshot2.png?raw=true)
![Screenshot 3](https://github.com/JoshuaMarkle/nvim-config/blob/main/docs/screenshot3.png?raw=true)

> [!IMPORTANT]
> This is in no way a professionally created configuration. It is a config that I have built from scratch and is what works for me (and hopefully you too). Everytihng is setup in such a way where nothing is hidden (unlike many other configs) and everything is highly configurable. Feel free to browse through every plugin in the `lua/plugins` directory or just enable/disable plugins quickly in `lua/config/enabled.lua`

## Features

- Unabstracted plugins: Every plugin has their own `.lua` file; easy to find
- Easily enable/disable plugins with the `enabled.lua` in the config directory
- Works will with tmux
- Theming and UI:
  - Tokyonight theme: Perfect for some midnight coding! Easily changed in `theme.lua`
  - Highly customized dashboard: Added a nice startup time; check out the config
  - Better UI with `noice.nvim`
- Extra support for:
  - Markdown support:
    - Nice highlights; markdown zen mode for note taking
    - Viewable equations with `nabla.nvim`
    - Edit code in popup window and output results all from within the `.md` file
    - Run code within markdown files with a bunch of languages
  - GitHub Copilot: AI autocompletion within nvim
  - LaTeX: Has all the **best** LaTeX snippets
  - Flutter: Lets go Flutter developers!
  - Arduino
  - Soon to be R and Rmarkdown
- Made with love :heart:

> [!NOTE]
> I consistently have **30ms** load times thanks to optimized lazy loading.

## Installation

### Linux/Mac

> [!IMPORTANT]  
> Make sure to back up `~/.config/nvim` if you need to

**Clear Any Previous Configs**

```
rm -rf ~/.config/nvim
rm -rf ~/.local/share/nvim
```

**Clone This Repository**

```
git clone https://github.com/JoshuaMarkle/nvim-config ~/.config/nvim
```

### Windows

> [!WARNING]  
> This config **should** work with on Windows for the most part. There are some packages that need to be installed in order for the entire configuration to work, mainly the LSP support. I have found that installing the chocolately package manager is the best way to install the dependencies.
> Vim's `:checkhealth` is you best friend!

> [!IMPORTANT]  
> Make sure to back up `~/.config/nvim` if you need to

**Clear Any Previous Configs**

```
rd -r ~\AppData\Local\nvim
rd -r ~\AppData\Local\nvim-data
```

**Clone This Repository**

```
git clone https://github.com/JoshuaMarkle/nvim-config ~\AppData\Local\nvim
```

## Configuration

All of the plugins are grouped into their repective folders. For example, if you don't need Latex support, you can simple delete the `latex.lua` file within `utils` and even delete the `ultisnips` directory. Ultisnips is the completion tool for latex.

To add new pluigns, you can put them in an already existing `.lua` file or make a new file that returns that plugin.

**The Folder Structure**

```
.
├── init.lua
├── lua
│  ├── config
│  │  ├── enabled.lua
│  │  ├── mappings.lua
│  │  └── options.lua
│  ├── plugins
│  │  ├── coding
│  │  ├── editor
│  │  ├── git
│  │  ├── lsp
│  │  ├── notes
│  │  ├── ui
│  │  └── utils
│  └── setup.lua
└── ultisnips
   └── tex.snippets
```

> [!TIP]
> The easiest way to play around with this config is to take a look within the `enabled.lua` file. This contains a bunch of global variables that either enable or disable plugins throughout this config.

## Inspiration

Huge thanks to...

- The lazy package manager by folke. This makes loading many plugins like nothing
- [Gilles Castel](https://castel.dev/) for a phenomenal Latex workflow
