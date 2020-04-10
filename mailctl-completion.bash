_mailctl() {
	local cur prev options
	cur=${COMP_WORDS[COMP_CWORD]}
	prev=${COMP_WORDS[COMP_CWORD-1]}
	options="status start stop restart setup queue flush view delete fail2ban ports postconf logs login update-check update-packages versions"
	if [ $COMP_CWORD -eq 1 ]; then
		COMPREPLY=( $(compgen -W "${options[@]}" -- $cur) )
	elif [ $COMP_CWORD -eq 2 ]; then
		case "$prev" in
			fail2ban)
				COMPREPLY=( $(compgen -W "unban" -- $cur) )
				;;
			logs)
				COMPREPLY=( $(compgen -W "-f" -- $cur) )
				;;
		esac
	fi
	return 0
}

complete -F _mailctl mailctl
