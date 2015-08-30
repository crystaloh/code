export PATH=~/bin:$PATH

# Configuring Our Prompt
# ======================

  # if you install git via homebrew, or install the bash autocompletion via homebrew, you get __git_ps1 which you can use in the PS1
  # to display the git branch. it's supposedly a bit faster and cleaner than manually parsing through sed. i dont' know if you care
  # enough to change it

  # This function is called in your prompt to output your active git branch.
  function parse_git_branch {
    git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
  }

  # This function builds your prompt. It is called below
  function prompt {
    # Define some local colors
    local RED="\[\033[0;31m\]" # This syntax is some weird bash color thing I never
    local LIGHT_RED="\[\033[1;31m\]" # really understood
    local CHAR="☆.~"
    # ♥ ☆ - Keeping some cool ASCII Characters for reference

    # Here is where we actually export the PS1 Variable which stores the text for your prompt
    export PS1="\[\e]2;\u@\h\a[\[\e[37;44;1m\]\t\[\e[0m\]]$RED\$(parse_git_branch) \[\e[38;5;221m\]\W\[\e[0m\]\n\[\e[0;36m\]$CHAR \[\e[0m\]"

      PS2='> '
      PS4='+ '
    }

  # Finally call the function and our prompt is all pretty
  prompt