#if shopt -q login_shell; then 
#	[[ -f ~/.bashrc ]] && source ~/.bashrc
#	[[ -t 0 && $(tty) == /dev/tty7 && ! $DISPLAY ]] && exec dbus-launch --sh-syntax --exit-with-session sway
#fi

export PATH="${PATH}:/opt/piavpn/bin:~/.cargo/bin:~/.local/bin:~/.symfony/bin"
export $(gnome-keyring-daemon -d --start --components=pkcs11,secrets,ssh)
