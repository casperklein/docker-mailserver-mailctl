_mailctl() {
	local cur prev options
	cur=${COMP_WORDS[COMP_CWORD]}
	prev=${COMP_WORDS[COMP_CWORD-1]}
	options="config delete fail2ban flush login logs ports postconf queue restart setup start status stop supervisor update-check update-packages versions view"
	if [ $COMP_CWORD -eq 1 ]; then
		COMPREPLY=( $(compgen -W "${options[@]}" -- $cur) )
	elif [ $COMP_CWORD -eq 2 ]; then
		case "$prev" in
			fail2ban)
				COMPREPLY=( $(compgen -W "ban unban" -- $cur) )
				;;
			logs)
				COMPREPLY=( $(compgen -W "-f" -- $cur) )
				;;
		esac
	fi
	return 0
}

complete -F _mailctl mailctl
