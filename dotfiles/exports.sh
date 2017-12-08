
#
# Make vim the default editor.
#
export EDITOR='vim';

#
# Homebrew, Sencha, Node Version Mananger
#
export PATH=/usr/local/sbin:$PATH
export PATH=$HOME/.bin/Sencha/Cmd:$PATH

#
# HomeBrew Installed NVM
#
export NVM_DIR="$HOME/.nvm"
	. "/usr/local/opt/nvm/nvm.sh"

#
# SENCHA CMD:
#

export PATH="$HOME/.bin/Sencha/Cmd:$PATH"
export PATH="$HOME/.bin/Sencha/Cmd/6.1.3.42/..:$PATH"
export PATH="$HOME/.bin/Sencha/Cmd/6.0.1.76/..:$PATH"
export PATH="$HOME/.bin/Sencha/Cmd/6.0.1.76/..:$PATH"

#
# NODEJS:
#

# Enable persistent REPL history for `node`.
NODE_REPL_HISTORY_FILE=~/.node_history;

# Allow 32³ entries; the default is 1000.
NODE_REPL_HISTORY_SIZE='32768';

# Increase Bash history size. Allow 32³ entries; the default is 500.
export HISTSIZE='32768';
export HISTFILESIZE="${HISTSIZE}";

# Omit duplicates and commands that begin with a space from history.
export HISTCONTROL='ignoreboth';

# Prefer US English and use UTF-8.
export LANG='en_US.UTF-8';
export LC_ALL='en_US.UTF-8';

# Highlight section titles in manual pages.
export LESS_TERMCAP_md="${yellow}";

# Don’t clear the screen after quitting a manual page.
# export MANPAGER='less -X';

# Always enable colored `grep` output.
# export GREP_OPTIONS='--color=auto';
alias grep="grep $GREP_OPTIONS"

#
# GO
#
export PATH="$PATH:~/.go/bin"
