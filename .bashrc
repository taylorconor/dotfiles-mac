source ~/dotfiles-mac/dotfiles/.bashrc

# tmuxinator completion support
source ~/.bash/tmuxinator.bash

# git support for the prompt
export GITAWAREPROMPT=~/.bash/git-aware-prompt
source "${GITAWAREPROMPT}/main.sh"

# the prompt currently depends on the execution of git-aware-prompt. these should be decoupled.
export PS1="\[\033[32m\]\w \[$txtcyn\]\$git_branch\[$txtred\]\$git_dirty\[$txtrst\]\$ "
export SUDO_PS1="\[$txtred\]\033[1m\u\033[0m \[\033[32m\]\w \[$txtcyn\]\$git_branch\[$txtred\]\$git_dirty\[$txtrst\]\$ "

# bash autocomplete for git. requires `brew install bash-completion`
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

# Used to enable bazel in clion on macos.
export DEVELOPER_DIR="/Applications/Xcode.app/Contents/Developer"
export BAZEL_USE_CPP_ONLY_TOOLCHAIN=1

bazel() {
    if [[ $1 == "test" || $1 == "build" || $1 == "run" ]]; then
	command bazel $@ --test_output=all --cxxopt='-std=c++14'
    else
	command bazel
    fi
}

export PATH="$PATH:$HOME/bin"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/conor/google-cloud-sdk/path.bash.inc' ]; then . '/Users/conor/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/conor/google-cloud-sdk/completion.bash.inc' ]; then . '/Users/conor/google-cloud-sdk/completion.bash.inc'; fi
