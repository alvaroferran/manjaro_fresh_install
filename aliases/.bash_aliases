# Package management
alias install="yay -S"
alias purge="yay -Rns"
alias update="yay -Syy"
alias upgrade="yay -Syu"
alias search="yay -Ss"
alias installed="yay -Q"

# Copy ssh public key
alias get_ssh_key="xclip -sel clip < ~/.ssh/id_rsa.pub && echo \"Public key copied\""

# Change gnome-terminal window into terminator window
alias ct="~/Programs/change_terminal/change_terminal.sh"

# Log into torre
alias torre="ssh alvaro@torre.local"

# Autorotate
alias autorotate="~/Programs/AutoRotateScreen/AutoRotateScreen.py"
