# PS1

```bash
fontWeight=1
reset="\[\e[0m\]"

# Colors
gray="\[\e[$fontWeight;37m\]"
black="\[\e[$fontWeight;30m\]"
blue="\[\e[$fontWeight;34m\]"
cyan="\[\e[$fontWeight;36m\]"
green="\[\e[$fontWeight;32m\]"
orange="\[\e[$fontWeight;33m\]"
purple="\[\e[$fontWeight;35m\]"
red="\[\e[$fontWeight;30m\]"
violet="\[\e[$fontWeight;35m\]"
white="\[\e[$fontWeight;37m\]"
yellow="\[\e[$fontWeight;33m\]"
pink="\[\e[$fontWeight;35m\]"

PS1="${debian_chroot:+($debian_chroot)}"
PS1+="${cyan}\u "                                          # The name of the logged-in user
PS1+="${gray}at "                                          # Only string
PS1+="${yellow}\h "                                        # The hostname up to the first '.'
# PS1+="${yellow}\H "                                      # The full hostname
PS1+="${gray}in "                                          # Only string
PS1+="${green}\w "                                         # The full directory
# PS1+="${green}\W "                                       # The current directory
PS1+="\$(prompt_git \"${white}on ${violet}\" \"${blue}\")" # Git repository details
PS1+="${reset}"                                            # Reset default colors
PS1+="\n"                                                  # Newline
PS1+="\$ "                                                 # Shows a $ for a regular user or # for root user
```

```bash
PS1="${debian_chroot:+($debian_chroot)}\[\e[1;36m\]\u \[\e[1;37m\]at \[\e[1;33m\]\h \[\e[1;37m\]in \[\e[1;32m\]\w \$(prompt_git \"\[\e[1;37m\]on \[\e[1;35m\]\" \"\[\e[1;34m\]\")\[\e[0m\]\n\$ "
```
