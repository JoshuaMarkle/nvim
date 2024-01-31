<h1 align="center">Nvim Config or Something</h1>

<p align="center">A minimal config with LaTeX (and Flutter) support</p>

![Screenshot 1](https://github.com/JoshuaMarkle/nvim-config/blob/main/screenshot1.png?raw=true)
![Screenshot 2](https://github.com/JoshuaMarkle/nvim-config/blob/main/screenshot2.png?raw=true)
![Screenshot 3](https://github.com/JoshuaMarkle/nvim-config/blob/main/screenshot3.png?raw=true)

## Features

- Easily enable/disable plugins with the `enabled.lua` in the config directory
- Unabstracted plugins: Every plugin has their own `.lua` file; easy to find
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
  - LaTeX: Has all the **best** LaTeX snippets
  - Flutter: Lets go Flutter developers!
  - Arduino
  - Soon to be R and Rmarkdown
- Made with love :heart:

## Installation

### Linux/Mac

Make sure to back up `~/.config/nvim` if you need to

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

This config **should** work with on Windows for the most part. There are some packages that need to be installed in order for the entire configuration to work, mainly the LSP support. I have found that installing the chocolately package manager is the best way to install the dependencies.

Vim's `:checkhealth` is you best friend!

**Clear Any Previous Configs**

```
rd -r ~\AppData\Local\nvim
rd -r ~\AppData\Local\nvim-data
```

**Clone This Repository**

```
git clone https://github.com/JoshuaMarkle/nvim-config ~\AppData\Local\nvim
```

## Options

The folder structure is like this:

```
.
├── init.lua
├── lua
│  ├── config
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

All of the plugins are grouped into their repective folders. If you don't want any `Flutter` or `LaTeX` pluigns, then simply delete their directories and remove them from the `setup.lua` file.

To add new pluigns, you can put them in an already existing `.lua` file or make a new file that returns that plugin.

## Stats

I consistently have **30ms** load times thanks to optimized lazy loading.

## Inspiration

Huge thanks to...

- The lazy package manager by folke. This makes loading many plugins like nothing
- [Gilles Castel](https://castel.dev/) for a phenomenal Latex workflow
