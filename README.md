<h1 align="center">Nvim Config or Something</h1>

<p align="center">A minimal config with LaTeX (and Flutter) support</p>

![Screenshot 1](https://github.com/JoshuaMarkle/nvim-config/blob/main/screenshot1.png?raw=true)
![Screenshot 2](https://github.com/JoshuaMarkle/nvim-config/blob/main/screenshot2.png?raw=true)

## Installation

Make sure to back up `~/.config/nvim`

**Clear Any Previous Configs**
```
# Linux / Macos (unix)
rm -rf ~/.config/nvim
rm -rf ~/.local/share/nvim
```

```
# Windows
rd -r ~\AppData\Local\nvim
rd -r ~\AppData\Local\nvim-data
```

**Clone This Repository**
```
# Linux / Macos (unix)
git clone https://github.com/JoshuaMarkle/nvim-config ~/.config/nvim
```

```
# Windows
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
