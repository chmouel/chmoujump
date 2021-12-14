A combinaison of [zshz](https://github.com/agkozak/zsh-z) and favourite directories

I used to have some code to combine the two and dicsovered :

https://github.com/andrewferrier/fzf-z

so I merged some of my code with andrew's plugin and made it my own with a narcissic prefix (naming is hard i have no idea what to use otherwise)

## Install

```sh
zplug 'chmouel/chmoujump'
```

or whatever is your zsh plugin manager,

## Usage

C-g is bound to it and will show you the last directories from zsh-z combined with your favourites directories, you can define with the env variable : 

```
CHMOUJUMP_DIRS="/dir1 /dir2"
```

by default this goes to `$GOPATH/src/github.com` and if it doesn't exist to `$HOME`.

with [fd](https://github.com/sharkdp/fd) it will grab the first two subdir levels of those directories use [fzf](https://github.com/junegunn/fzf) to ask you which one you want and show a preview with [exa](https://the.exa.website/) if avail or ls/tree
