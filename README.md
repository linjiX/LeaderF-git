# LeaderF-git

[LeaderF](https://github.com/Yggdroot/LeaderF) extension for git

![preview image](preview.png)

## Features

Provide 5 more git related LeaderF commands:

```vim
" Fuzzy finder for all local git branches
:LeaderfBranch or :Leaderf branch
```

```vim
" Fuzzy finder for all the commits in current git repository
:LeaderfCommit or :Leaderf commit
```

```vim
" Fuzzy finder for the commits affect current file
:LeaderfBCommit or :Leaderf bcommit
```

```vim
" Fuzzy finder for the files in 'git status'
:LeaderfGstatus or :Leaderf gstatus
```

```vim
" Fuzzy finder for the files in 'git ls-gfiles'
:LeaderfGfile or :Leaderf gfile
```

## Installation

with [vim-plug](https://github.com/junegunn/vim-plug)

```vim
Plug 'linjiX/LeaderF-git'
```

## Requirments

-   Mandatory
    -   [git](https://git-scm.com)
    -   [Yggdroot/Leaderf](https://github.com/Yggdroot/LeaderF)
-   Optional
    -   [tpope/vim-fugitive](https://github.com/tpope/vim-fugitive) (Needed for open or preview git commits)

## References

This extension is written by pure vim-script: [Written LeaderF extension by vim-script](https://github.com/Yggdroot/LeaderF/issues/144#issuecomment-540008950)
