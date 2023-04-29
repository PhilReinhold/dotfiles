# dotfiles

Set up symbolic links using GNU stow, following https://alexpearce.me/2016/02/managing-dotfiles-with-stow/

Use the `--no-folding` option to create missing directories instead of making directory symlinks

```bash
git clone https://github.com/PhilReinhold/dotfiles
cd dotfiles
stow vim --no-folding
stow zsh --no-folding
```
