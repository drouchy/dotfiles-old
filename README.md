# jclem/dotfiles

A collection of my dotfiles, including configuration for bash, zsh (via
[oh-my-zsh][oh_my_zsh]), and vim.

---

## Features

### Useful aliases

* Directory traversal: `..` = `cd ..` and `...` = `cd ../..`
* show/hide hidden Finder files with `show` and `hide`
* `git` aliased to `hub`
* git aliases: `gi` = `git init`
* Rails aliases: `rs` = `rails server`
* Rake aliases: `rdbm` = `rake db:migrate`

### Directory completion

* `c do<tab>` = `cd ~/code/dotfiles`
* `h Doc<tab>` = `cd ~/Documents`
* `c` = `cd ~/code`
* `h` = `cd ~/`

### Functions

* `gac`: Combines `git add -A` and `git commit -m`
* `gacp`: Combines `gac` and `git push <remote:origin> <remote-branch:master>`

### Vim Configuration

* Nice `vimrc`
* bundle management with Pathogen and [git submodules][git_submodules]

### Vim bundles

* Color-Sampler-Pack: https://github.com/vim-scripts/Color-Sampler-Pack
* auto-pairs: https://github.com/jiangmiao/auto-pairs
* NERDCommenter: https://github.com/scrooloose/nerdcommenter
* NERDTree: https://github.com/scrooloose/nerdtree
* SnipMate: https://github.com/msanders/snipmate.vim (snippets in
  `vim/snippets`)
* Surround: https://github.com/tpope/vim-surround

---

## Installation

jclem/dotfiles assumes that it will be kept in the `~/code/dotfiles` directory.
This location is important, as it symlinks configuration files in the home
directory to files in this location.

1. Back up your own dotfiles, if needed.*
2. `$ cd ~/code/dotfiles`
3. `$ rake install`

Any files that the installer overwrites will be moved to
`~/jclem_dotfiles_backup` where they can easily be recovered.

\* jclem/dotfiles creates its own backup, but more than one use of `rake
  install` overwrites the original backup.

---

## Customization

### Bash

Most configuration is modularized. `bashrc` just sources files in the `bash/`
directory, including `bash/aliases`, `bash/completions`, `bash/config`, and
`bash/functions`. Edit these files to customize.

### Zsh

Zsh configuration is a little tricky, as I'm using [oh-my-zsh][oh_my_zsh],
which is included as a [git submodule][git_submodules]. oh-my-zsh's `custom`
directory is mostly ignored by git, so jclem/dotfiles keeps custom zsh files in
its own `zsh-custom` directory.

Whenever `rake install` is run, the contents of this directory are copied to
oh-my-zsh's `custom` directory. If you would like the `bash` and `zsh`
configuration files to be the same, there is a rake task called
`copy_bash_to_zsh` which copies `bash/aliases` and `bash/functions` to
`zsh-custom/aliases.zsh` and `zsh-custom/functions.zsh`, respectively. Note
that after doing this, one must again run `rake install`.

[oh_my_zsh]: https://github.com/robbyrussell/oh-my-zsh
[git_submodules]: http://book.git-scm.com/5_submodules.html
