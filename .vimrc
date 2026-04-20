:set syntax=on
:set nu
:set tabstop=4
:set shiftwidth=4
:set expandtab

if v:version < 802
    packadd! dracula
endif
syntax enable
colorscheme dracula
