### Download
```
git clone git@github.com:Simon-Hostettler/dotfiles_macos.git ~/.dotfiles
```
### Installing Symlinks
```
cd ~/.dotfiles
stow -vt ~ */
```
### Modifying single program
```
cd ~/.dotfiles
stow -vt ~ [app]     # install symlink
stow -Dvt ~ [app]    # remove symlink
```
