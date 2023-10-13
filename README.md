<h1 align="center">Nvim Config or Something</h1>

<p align="center">A minimal config with LaTeX (and Flutter) support</p>

![Screenshot 1](https://github.com/JoshuaMarkle/nvim-config/blob/main/screenshot1.png?raw=true)
![Screenshot 2](https://github.com/JoshuaMarkle/nvim-config/blob/main/screenshot2.png?raw=true)

## Download

If you can, back up `~/.config/nvim`

**Clear Previous Configs**
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

All the plugin scripts are grouped and modularized.

- If you want to turn on LSP, go to `lua/plugins/lsp.lua` and change `enabled = false` to `enabled = true`.
- If you don't want to have the extra Flutter plugins, delete `lua/plugins/flutter.lua`.
