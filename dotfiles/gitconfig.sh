[alias]

	# View abbreviated SHA, description, and history
	# graph of the latest 20 commits
	l = log --pretty=oneline --graph --abbrev-commit

    name = !"git config --global user.name"

	# View the current working tree status using the short format
	s = status

	# Show the diff between the latest commit and the current state
	d = !"git diff-index --quiet HEAD -- || clear; git --no-pager diff --patch-with-stat"

	# `git di $number` shows the diff between the state
	# `$number` revisions ago and the current state
	di = !"d() { git diff --patch-with-stat HEAD~$1; }; git diff-index --quiet HEAD -- || clear; d"

	# Pull in remote changes for the current repository and all its submodules
	p = !"git pull; git submodule foreach git pull origin master"

	# Clone a repository including all submodules
	c = clone --recursive

	# Commit all changes
	ca = !git add -A && git commit -av

	# Switch to a branch, creating it if necessary
	go = "!f() { git checkout -b \"$1\" 2> /dev/null || git checkout \"$1\"; }; f"

	# Show verbose output about tags, branches or remotes
	tags = tag -l
	branches = branch -a
	remotes = remote -v

	# Amend the currently staged files to the latest commit
	amend = commit --amend --reuse-message=HEAD

	# Credit an author on the latest commit
	credit = "!f() { git commit --amend --author \"$1 <$2>\" -C HEAD; }; f"

	# Interactive rebase with the given number of latest commits
	reb = "!r() { git rebase -i HEAD~$1; }; r"

	# Remove the old tag with this name and tag the latest commit with it.
	retag = "!r() { git tag -d $1 && git push origin :refs/tags/$1 && git tag $1; }; r"

	# Find branches containing commit
	fb = "!f() { git branch -a --contains $1; }; f"

	# Find tags containing commit
	ft = "!f() { git describe --always --contains $1; }; f"

	# Find commits by source code
	fc = "!f() { git log --pretty=format:'%C(yellow)%h  %Cblue%ad  %Creset%s%Cgreen  [%cn] %Cred%d' --decorate --date=short -S$1; }; f"

	# Find commits by commit message
	fm = "!f() { git log --pretty=format:'%C(yellow)%h  %Cblue%ad  %Creset%s%Cgreen  [%cn] %Cred%d' --decorate --date=short --grep=$1; }; f"

	# Remove branches that have already been merged with master
	# a.k.a. ‘delete merged’
	dm = "!git branch --merged | grep -v '\\*' | xargs -n 1 git branch -d"

	# List contributors with number of commits
	contributors = shortlog --summary --numbered

	# Merge GitHub pull request on top of the `master` branch
	mpr = "!f() { \
		if [ $(printf \"%s\" \"$1\" | grep '^[0-9]\\+$' > /dev/null; printf $?) -eq 0 ]; then \
			git fetch origin refs/pull/$1/head:pr/$1 && \
			git rebase master pr/$1 && \
			git checkout master && \
			git merge pr/$1 && \
			git branch -D pr/$1 && \
			git commit --amend -m \"$(git log -1 --pretty=%B)\n\nCloses #$1.\"; \
		fi \
	}; f"

[apply]

	# Detect whitespace errors when applying a patch
	whitespace = fix

[core]

	# Use custom `.gitignore` and `.gitattributes`
	excludesfile = $HOME/.gitignore
	attributesfile = $HOME/.gitattributes

	# Treat spaces before tabs and all kinds of trailing whitespace as an error
	# [default] trailing-space: looks for spaces at the end of a line
	# [default] space-before-tab: looks for spaces before tabs at the beginning of a line
	whitespace = space-before-tab,-indent-with-non-tab,trailing-space

	# Make `git rebase` safer on OS X
	# More info: <http://www.git-tower.com/blog/make-git-rebase-safe-on-osx/>
	trustctime = false

	# Prevent showing files whose names contain non-ASCII symbols as unversioned.
	# http://michael-kuehnel.de/git/2014/11/21/git-mac-osx-and-german-umlaute.html
	precomposeunicode = false
	quotepath = false

[color]

	# Use colors in Git commands that are capable of colored output when
	# outputting to the terminal. (This is the default setting in Git ≥ 1.8.4.)
	ui = auto

[color "branch"]

	current = yellow reverse
	local = yellow
	remote = green

[color "diff"]

	meta = yellow bold
	frag = magenta bold # line info
	old = red # deletions
	new = green # additions

[color "status"]

	added = yellow
	changed = green
	untracked = cyan

[diff]

	# Detect copies as well as renames
	renames = copies
	tool = opendiff

[help]

	# Automatically correct and execute mistyped commands
	autocorrect = 1

[merge]

	# Include summaries of merged commits in newly created merge commit messages
	log = true
	tool = opendiff

[push]

	# Use the Git 1.x.x default to avoid errors on machines with old Git
	# installations. To use `simple` instead, add this to your `~/.extra` file:
	# `git config --global push.default simple`. See http://git.io/mMah-w.
	default = matching
	# Make `git push` push relevant annotated tags when pushing branches out.
	followTags = true

# URL shorthands

[url "git@github.com:"]

	insteadOf = "gh:"
	pushInsteadOf = "github:"
	pushInsteadOf = "git://github.com/"

[url "git://github.com/"]

	insteadOf = "github:"

[url "git@gist.github.com:"]

	insteadOf = "gst:"
	pushInsteadOf = "gist:"
	pushInsteadOf = "git://gist.github.com/"

[url "git://gist.github.com/"]

	insteadOf = "gist:"

[filter "lfs"]

    clean = git lfs clean %f
	smudge = git lfs smudge %f
	required = true

[user]

	# IN SEPARATE FILE TO KEEP OUT OF REPO
	# source ~/.gitcreds

[http]

	postBuffer = 2097152000

[diff]
    tool = opendiff

[difftool]
    prompt = false

[difftool "opendiff"]
    cmd = /usr/bin/opendiff \"$LOCAL\" \"$REMOTE\" -merge \"$MERGED\" | cat

[mergetool "opendiff"]
	cmd = opendiff -merge \"$MERGED\" \"$LOCAL\" \"$REMOTE\"
	trustExitCode = false
	
[user]
	name = Shayne Trosdahl
	email = shayne@trozdol.com
