# 2nd to load
#

set completion-ignore-case on
set show-all-if-ambiguous on
set page-completions off
set completion-query-items 200
set completion-ignore-case on
set mark-symlinked-directories on
set visible-stats on
set skip-completed-text on
set input-meta on
set output-meta on
set convert-meta off

"\e[B": history-search-forward
"\e[A": history-search-backward
"\e[Z": menu-complete
"\e[3;3~": kill-word
