### Download
```
git clone git@github.com:Simon-Hostettler/dotfiles_macos.git ~/.dotfiles
```
### Installing Symlinks
```
stow -vt ~ ~/.dotfiles/*/
```
### Modifying single program
```
stow -vt ~/.dotfiles/[app] # install symlink
stow -D ~/.dotfiles/[app] # remove symlink
```
