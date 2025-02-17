_mailctl() {
	local cur prev args

	cur=${COMP_WORDS[COMP_CWORD]}
	prev=${COMP_WORDS[COMP_CWORD-1]}

	if (( COMP_CWORD == 1 )); then
		args="config delete fail2ban flush login logs ports postconf processes queue restart setup start status stop supervisor unhold update-check update-packages versions view"
		COMPREPLY=( $(compgen -W "$args" -- $cur) )

	elif (( COMP_CWORD == 2 )); then
		case "$prev" in
			delete)
				COMPREPLY=( $(compgen -W "ALL" -- "$cur") )
				;;
			fail2ban)
				COMPREPLY=( $(compgen -W "ban unban log" -- "$cur") )
				;;
			logs)
				COMPREPLY=( $(compgen -W "-f" -- "$cur") )
				;;
			unhold)
				COMPREPLY=( $(compgen -W "ALL" -- "$cur") )
				;;
		esac
	fi
	return 0
}

complete -F _mailctl mailctl
