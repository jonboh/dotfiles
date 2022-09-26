@echo off
doskey dotfiles=git --git-dir=%userprofile%/dotfiles --work-tree=%userprofile% $*
doskey gs=git status $*
