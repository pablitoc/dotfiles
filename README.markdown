# PJ Kelly's Dotfiles

## Installation

These dotfiles assume that you're using Boxen, but can easily be adapted for a non-Boxen environment as well.

Boxen will symlink the `.bashrc` in this repository into your home folder.  To get these files loaded into your environment, you simply need to update your `~/.profile`:

```
# After this line:
source /opt/boxen/env.sh
# Add this line:
source ~/.bashrc
```

Then restart your Terminal.
