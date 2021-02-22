# .vim
See vimrc for configuration.
Pathogen is used to loading plugins.
To get all bundles linked to their original repositories, 
make sure to clone the submodules (otherwise you will clone a static copy of bundles).

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
