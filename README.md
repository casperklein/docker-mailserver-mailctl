# mailctl

mailctl is a script to easily interact with [docker-mailserver](https://github.com/docker-mailserver/docker-mailserver/).

## Installation

1. Download `mailctl`

       curl -o mailctl https://raw.githubusercontent.com/casperklein/docker-mailserver-mailctl/master/mailctl

1. Make `mailctl` executable

       chmod a+x mailctl

1. Change setup variables to your needs in `mailctl`

   **Example**:

       DIR=/mail       # docker-compose directory
       CONTAINER=mail  # docker container name
       TIMEOUT=3600    # a lot of time for a graceful container stop

## Bash Completion

If the `bash-completion` package is installed, mailctl completion can be loaded automatically:

       curl -o /usr/share/bash-completion/completions/mailctl https://raw.githubusercontent.com/casperklein/docker-mailserver-mailctl/master/mailctl-completion.bash

Alternatively you can source the completion file:

1. Download:

       curl -o mailctl-completion.bash https://raw.githubusercontent.com/casperklein/docker-mailserver-mailctl/master/mailctl-completion.bash

2. Source `mailctl-completion.bash` in your `~/.bashrc`

       source /path/to/mailctl-completion.bash

## Usage

    mailctl status                           Show status
    mailctl config                           Show configuration
    mailctl start                            Start container
    mailctl stop                             Stop container
    mailctl restart                          Restart container
    mailctl setup                            Invoke 'setup.sh'
    mailctl queue                            Show mail queue
    mailctl flush                            Flush mail queue
    mailctl view   <queue id>                Show mail by queue id
    mailctl unhold <queue id> [<queue id>]   Release mail that was put "on hold" (marked with '!')
    mailctl unhold ALL                       Release all mails that were put "on hold" (marked with '!')
    mailctl delete <queue id> [<queue id>]   Delete mail from queue
    mailctl delete ALL                       Delete all mails from queue
    mailctl fail2ban [<ban|unban> <IP>]      Interact with fail2ban
    mailctl ports                            Show published ports
    mailctl postconf                         Show postfix configuration
    mailctl logs [-f]                        Show logs. Use -f to 'follow' the logs
    mailctl login                            Run container shell
    mailctl supervisor                       Interact with supervisorctl
    mailctl update-check                     Check for container package updates
    mailctl update-packages                  Update container packages
    mailctl versions                         Show versions

## Example

`mailctl status`

    Container:    Up 48 hours (healthy)

    Version:      12.0.0

    Fail2ban:     No IPs have been banned

    Packages:     All packages are up to date.

    Ports:        25/tcp -> 0.0.0.0:25
                  465/tcp -> 0.0.0.0:465
                  993/tcp -> 0.0.0.0:993
                  995/tcp -> 0.0.0.0:995

    Postfix:      Mail queue is empty

    Supervisor:   amavis                           RUNNING   pid 2999, uptime 17:32:37
                  cron                             RUNNING   pid 2913, uptime 2 days, 2:11:34
                  dovecot                          RUNNING   pid 2920, uptime 2 days, 2:11:34
                  fail2ban                         RUNNING   pid 2192, uptime 2 days, 2:11:34
                  mailserver                       RUNNING   pid 24,   uptime 2 days, 2:11:39
                  opendkim                         RUNNING   pid 2923, uptime 2 days, 2:11:34
                  opendmarc                        RUNNING   pid 2935, uptime 2 days, 2:11:33
                  postfix                          RUNNING   pid 2942, uptime 2 days, 2:11:33
                  rsyslog                          RUNNING   pid 2915, uptime 2 days, 2:11:36
                  changedetector                   RUNNING   pid 2916, uptime 2 days, 2:11:34
                  update-check                     RUNNING   pid 2917, uptime 2 days, 2:11:35
                  clamav                           STOPPED   Not started
                  fetchmail                        STOPPED   Not started
                  postgrey                         STOPPED   Not started
                  postsrsd                         STOPPED   Not started
                  saslauthd_ldap                   STOPPED   Not started
                  saslauthd_mysql                  STOPPED   Not started
                  saslauthd_pam                    STOPPED   Not started
                  saslauthd_rimap                  STOPPED   Not started
                  saslauthd_shadow                 STOPPED   Not started
