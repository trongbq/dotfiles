set_bash_prompt() {
  RESET='\[\e[0m\]'
  C11='\[\e[1;32m\]'
  C13='\[\e[1;34m\]'

  PS1="\w \$ "
}
PROMPT_COMMAND=set_bash_prompt
