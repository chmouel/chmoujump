# Chmoujump 🚀

Chmoujump is a Zsh plugin that combines the power of [zsh-z](https://github.com/agkozak/zsh-z), your favorite directory paths, and custom aliases for fast directory jumping.

This project started as a simple function, but after discovering
[fzf-z](https://github.com/andrewferrier/fzf-z), it evolved into a more elegant
solution by merging ideas from both tools.

## Installation

With [zplug](https://github.com/zplug/zplug):

```sh
zplug 'chmouel/chmoujump'
```

Or use your preferred Zsh plugin manager.

## Usage

By default, Chmoujump binds to `C-g` and presents a list of recent directories
from zsh-z, combined with your favorite directories. You can define your
favorite directories using the `CHMOUJUMP_DIRS` environment variable:

```sh
export CHMOUJUMP_DIRS="/dir1 /dir2"
```

If not set, it defaults to `~/git`, or `$HOME` if `~/git` does not exist.

Chmoujump uses [fd](https://github.com/sharkdp/fd) to find the first two
subdirectory levels within your favorite directories. It leverages
[fzf](https://github.com/junegunn/fzf) for interactive selection and displays a
preview using [exa](https://the.exa.website/), or falls back to `ls` or `tree`
if `exa` is unavailable.

### Aliases

You can define directory aliases for quick access:

```sh
declare -A CHMOUJUMP_ALIASES=([fav]="$HOME/project/fav")
chmoujump fav
# ALIAS: $HOME/project/fav
```

### Options

- `-P`: Show a preview pane of the selected file or directory.
- `-f`: Use fuzzy search (default is exact match).
- `-p`: Print the path instead of changing directory.
- `-n`: Force using fzf search instead of zsh-z history.
- `-a`: Choose from aliases via fzf.
- `-A`: List aliases sorted by git index modification times.

## License

MIT
