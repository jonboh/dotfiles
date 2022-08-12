@echo off
doskey dotfiles=git --git-dir=%userprofile%/dotfiles --work-tree=%userprofile% $*
