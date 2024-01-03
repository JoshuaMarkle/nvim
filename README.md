<h1 align="center">Nvim Config or Something</h1>

<p align="center">A minimal config with LaTeX (and Flutter) support</p>

![Screenshot 1](https://github.com/JoshuaMarkle/nvim-config/blob/main/screenshot1.png?raw=true)
![Screenshot 2](https://github.com/JoshuaMarkle/nvim-config/blob/main/screenshot2.png?raw=true)
![Screenshot 3](https://github.com/JoshuaMarkle/nvim-config/blob/main/screenshot3.png?raw=true)

## Features

- Cool theme stuff:
  - Tokyonight theme: Perfect for some midnight coding! Easily changed in `theme.lua`
  - Highly customized dashboard: Added a nice startup time; check out the config
  - Better UI with `noice.nvim`
- Markdown support:
  - Nice highlights; markdown zen mode for note taking
  - Viewable equations with `nabla.nvim`
  - Edit code in popup window and output results all from within the `.md` file
- LaTeX support: The **best** LaTeX snippets; huge thanks to [Gilles Castel](https://castel.dev/)
- Flutter support: Lets go Flutter!
- Unabstracted plugins: Every plugin has their own `.lua` file; easy to find
- Works will with tmux
- Made with love :heart:

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

## Stats

I built this entire config from scratch so its pretty minimal meaning that everything is very snappy. I typically have **60ms** load times on my cruddy 10yo laptop :smile:. Huge thanks to the lazy package manager. Awesome work! On a more modern machine, I've seen load times around **30ms** :file:
