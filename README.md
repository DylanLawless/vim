# .vim
See vimrc for configuration.
Plugins are managed by saving them in `/bundle/`. 
They are then loaded by `/autoload/pathogen.vim` as shown by
[tpope/vim-pathogen](https://github.com/tpope/vim-pathogen).

To get all bundles linked to their original repositories, 
make sure to clone the submodules (otherwise you will clone a static copy of bundles).

In the vimrc, `vim:foldmethod=marker:foldlevel=0` sets the fold method for only
this file, allowing neat section displays for editing vimrc.

# Submodules
To add a submodule, e.g. git within the git such as in bundles, use
```
git add submodule https://github.com/...
```
To clone use
```
git clone --recursive-submodules https://....main_project
```
or if you forgot or cant use recursive, do 
```
git submodule init
git submodule update
```
