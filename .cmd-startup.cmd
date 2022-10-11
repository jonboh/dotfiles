@echo off
doskey dotfiles=git --git-dir=%userprofile%/dotfiles --work-tree=%userprofile% $*
doskey gs=git status $*
doskey ls=exa -1 --group-directories-first $*
doskey l=exa --icons -F -1 --group-directories-first $*
doskey la=exa --icons -F -1 --group-directories-first -a $*
doskey ll=exa --icons -F -1 --group-directories-first -l -a $*
