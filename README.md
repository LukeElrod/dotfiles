# Dotfiles

I recommend using a git bare setup to manage your dotfiles with a `dotfiles` alias setup in your .bashrc or .zshrc

```
git init --bare $HOME/.dotfiles
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
dotfiles config --local status.showUntrackedFiles no
echo "alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'" >> $HOME/.bashrc
```

## Cloning
`git clone --bare https://github.com/LukeElrod/dotfiles.git $HOME/.dotfiles`

https://www.atlassian.com/git/tutorials/dotfiles
