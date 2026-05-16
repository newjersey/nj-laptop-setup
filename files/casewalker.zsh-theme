# Stolen from: Sunrise theme for oh-my-zsh
# Intended to be used with Solarized: http://ethanschoonover.com/solarized

# Color shortcuts
R=$fg_no_bold[red]
G=$fg_no_bold[green]
M=$fg_no_bold[magenta]
Y=$fg_no_bold[yellow]
B=$fg_no_bold[blue]
RESET=$reset_color

ZSH_THEME_GIT_PROMPT_PREFIX="%{$B%}("
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$B%})%{$RESET%} "

ZSH_THEME_GIT_PROMPT_DIRTY="%{$R%}*"
ZSH_THEME_GIT_PROMPT_CLEAN=""

ZSH_THEME_GIT_PROMPT_AHEAD="%{$Y%}➔"
ZSH_THEME_GIT_STATUS_PREFIX=" "

# Staged
ZSH_THEME_GIT_PROMPT_STAGED_ADDED="%{$G%}A"
ZSH_THEME_GIT_PROMPT_STAGED_MODIFIED="%{$G%}M"
ZSH_THEME_GIT_PROMPT_STAGED_RENAMED="%{$G%}R"
ZSH_THEME_GIT_PROMPT_STAGED_DELETED="%{$G%}D"

# Not-staged
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$R%}?"
ZSH_THEME_GIT_PROMPT_MODIFIED="%{$R%}M"
ZSH_THEME_GIT_PROMPT_DELETED="%{$R%}D"
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$R%}UU"

PROMPTPREFIX="%{$M%}$USER%{$RESET%}";

local return_code=$'%(?..%{$R%}  %B↳ %?%{$RESET%}\n)'

# Get the status of the working tree from `git status --porcelain` output (passed as $1).
# Uses zsh native pattern matching instead of grep subshells.
custom_git_prompt_status() {
  local INDEX STATUS
  # Prefix a newline so "^pattern" checks become "\npattern" contains-checks.
  INDEX=$'\n'"$1"
  STATUS=""

  # Non-staged
  [[ "$INDEX" == *$'\n''?? '* ]] && STATUS="$ZSH_THEME_GIT_PROMPT_UNTRACKED$STATUS"
  [[ "$INDEX" == *$'\n''UU '* ]] && STATUS="$ZSH_THEME_GIT_PROMPT_UNMERGED$STATUS"
  [[ "$INDEX" == *$'\n'' D '* ]] && STATUS="$ZSH_THEME_GIT_PROMPT_DELETED$STATUS"
  [[ "$INDEX" == *$'\n'?'M '* || "$INDEX" == *$'\n'' T '* ]] && STATUS="$ZSH_THEME_GIT_PROMPT_MODIFIED$STATUS"

  # Staged
  [[ "$INDEX" == *$'\n''D  '* ]] && STATUS="$ZSH_THEME_GIT_PROMPT_STAGED_DELETED$STATUS"
  [[ "$INDEX" == *$'\n'R* ]] && STATUS="$ZSH_THEME_GIT_PROMPT_STAGED_RENAMED$STATUS"
  [[ "$INDEX" == *$'\n'M* ]] && STATUS="$ZSH_THEME_GIT_PROMPT_STAGED_MODIFIED$STATUS"
  [[ "$INDEX" == *$'\n'A* ]] && STATUS="$ZSH_THEME_GIT_PROMPT_STAGED_ADDED$STATUS"

  [[ -n "$STATUS" ]] && STATUS="$ZSH_THEME_GIT_STATUS_PREFIX$STATUS"

  echo $STATUS
}

# Build the git portion of the prompt with a single `git status --porcelain --branch` call.
function custom_git_prompt() {
  local porcelain branch_line rest branch ahead dirty
  porcelain=$(git status --porcelain --branch 2>/dev/null) || return

  if [[ "$porcelain" == *$'\n'* ]]; then
    branch_line="${porcelain%%$'\n'*}"
    rest="${porcelain#*$'\n'}"
    dirty="$ZSH_THEME_GIT_PROMPT_DIRTY"
  else
    branch_line="$porcelain"
    rest=""
    dirty="$ZSH_THEME_GIT_PROMPT_CLEAN"
  fi

  branch_line="${branch_line#\#\# }"
  [[ "$branch_line" == *ahead* ]] && ahead="$ZSH_THEME_GIT_PROMPT_AHEAD"

  if [[ "$branch_line" == "HEAD (no branch)" ]]; then
    # Detached HEAD — porcelain doesn't give us the SHA, so one extra call.
    branch="%{$R%}$(git rev-parse --short HEAD 2>/dev/null)%{$B%}"
  elif [[ "$branch_line" == "No commits yet on "* ]]; then
    # Unborn HEAD — branch exists in name only, no commits yet.
    branch="${branch_line#No commits yet on }"
  else
    # Strip "...upstream" and any " [ahead/behind ...]" suffix.
    branch="${branch_line%%[. ]*}"
  fi

  echo "$ZSH_THEME_GIT_PROMPT_PREFIX${branch}${dirty}${ahead}$(custom_git_prompt_status "$rest")$ZSH_THEME_GIT_PROMPT_SUFFIX"
}

PROMPT="${return_code}"'%B$PROMPTPREFIX %{$fg_bold[green]%}%~%{$RESET%} $(custom_git_prompt)%{$M%}%B$%b%{$RESET%} '
RPS1=""
