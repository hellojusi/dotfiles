## Git

Configure `git` to use global ignore file.

```
git config --global core.excludesfile ~/.gitignore--global
```

## VS Code

Symlink using GNU Stow

```
stow --target="$HOME/Library/Application Support/Code/User" vscode
```

Install extentions

```
xargs -n1 code --install-extension < "extensions.txt"
```

... or just use `install.sh`. Make it executable first:

```
chmod +x ~/dotfiles/vscode/install.sh
```
