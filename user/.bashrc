# /etc/skel/.bashrc

if [[ $- != *i* ]] ; then
	return
fi

# Put your fun stuff here.

watch_cpu() {
	watch "cat /proc/cpuinfo | grep MHz"
}

pa_move_to_default() {
	for i in $(pactl list short sink-inputs | cut -f 1-1) ; do
		pacmd move-sink-input $i @DEFAULT_SINK@
	done
}

test_desktop_notification() {
	notify-send 'Hello world!' 'This is an example notification.' --icon=dialog-information
}

alias urldecode='python -c "import sys, urllib.parse as ul; \
	print(ul.unquote_plus(sys.argv[1]))"'

alias urlencode='python -c "import sys, urllib.parse as ul; \
	print(ul.quote_plus(sys.argv[1]))"'
alias pia-client='XDG_SESSION_TYPE=xorg pia-client'

alias cmake-gen='cmake -G Ninja -DCMAKE_BUILD_TYPE=Debug -DCMAKE_EXPORT_COMPILE_COMMANDS=ON'

alias current_window="swaymsg -t get_tree | jq -r '..|try select(.focused == true)'"
