# mailctl

mailctl is a script to easily interact with [docker-mailserver](https://github.com/tomav/docker-mailserver/).

## Installation:

1. Download `mailctl`

       curl -o mailctl https://raw.githubusercontent.com/casperklein/docker-mailserver-mailctl/master/mailctl

1. Make `mailctl` executable

       chmod a+x mailctl

1. Change setup variables to your needs in `mailctl`

   Example:

       DIR=/mail       # docker-compose directory
       CONTAINER=mail  # docker container name
       TIMEOUT=3600    # a lot of time for a graceful container stop

## Bash Completion:

1. Download `mailctl-completion.bash`

       curl -o mailctl-completion.bash https://raw.githubusercontent.com/casperklein/docker-mailserver-mailctl/master/mailctl-completion.bash

2. Source `mailctl-completion.bash` in your `.bashrc`

       source /path/to/mailctl-completion.bash

## Usage:

    mailctl status                           Show status
    mailctl start                            Start container
    mailctl stop                             Stop container
    mailctl restart                          Restart container
    mailctl setup                            Invoke 'setup.sh'
    mailctl queue                            Show mail queue
    mailctl flush                            Flush mail queue
    mailctl view   <queue id>                Show mail by queue id
    mailctl delete <queue id> [<queue id>]   Delete mail by queue id
    mailctl delete ALL                       Delete all queued mails
    mailctl fail2ban [<unban> <ip-address>]  Interact with fail2ban
    mailctl ports                            Show published ports
    mailctl postconf                         Show postfix configuration
    mailctl logs [-f]                        Show logs. Use -f to 'follow' the logs
    mailctl login                            Run container shell
    mailctl update-check                     Check for container package updates
    mailctl update-packages                  Update container packages

## Example:

`mailctl status`

    Container:    Up 4 hours
    Fail2ban:     No IPs have been banned
    Postfix:      Mail queue is empty
    Ports:        25 465 993 995
    Packages:     All packages are up to date.
