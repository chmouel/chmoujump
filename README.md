# Chmoujump -  🚀

A combinaison of [zshz](https://github.com/agkozak/zsh-z) and favourite
directorie path.

I used to have some code to combine the two and dicsovered :

https://github.com/andrewferrier/fzf-z

so I merged some of my code with andrew's plugin and made it my own with a narcissic prefix (naming is hard i have no idea what to use otherwise)

## Install

with [zplug](https://github.com/zplug/zplug)

```sh
zplug 'chmouel/chmoujump'
```

or whatever is your zsh plugin manager,

## Usage

C-g is bound to it and will show you the last directories from zsh-z combined with your favourites directories, you can define with the env variable: 

```shell
CHMOUJUMP_DIRS="/dir1 /dir2"
```

By default this goes to `$GOPATH/src/github.com` and if it doesn't exist to `$HOME`.

With [fd](https://github.com/sharkdp/fd) it will grab the first two subdir
levels of those directories use [fzf](https://github.com/junegunn/fzf) to ask
you which one you want and show a preview with [exa](https://the.exa.website/)
if avail or ls/tree

### Options

`-P`: show a preview pan of file or directory.
`-f`: use fuzzy search (by default it sets as exact)
`-p`: just print the path don't cd it
`-n`: force using fzf search instead of zshz history
`-z`: force using zshz search and no fzf fallback
