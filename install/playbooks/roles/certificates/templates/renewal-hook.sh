#!/bin/dash

set -e

echo "Calling renewal hook: Start"

for fqdn in $RENEWED_DOMAINS; do

    domain=$(hostname -d)
    sub=$(echo $fqdn | sed "s/\\.${domain}//")
    echo "Domain $fqdn renewed (sub=$sub)"

    case $sub in

        # Calendar server (davical)
        caldav|carddav)
	    echo "Reloading calendar server"
	    systemctl status davical >/dev/null 2>&1 || continue
            systemctl restart davical
            systemctl restart nginx
            ;;

        # Restart the MTA server
        smtp)
	    echo "Reloading Postfix MTA"
            systemctl restart postfix
            ;;

        # Restart the MDA server
        imap|pop3)
	    echo "Reloading Dovecot MDA"
            systemctl restart dovecot
            ;;

        # Default nginx site
        www|$domain)
	    echo "Reloading main web site"
            systemctl restart nginx
            ;;

        # Auto-discovery for Outlook
        autodiscover)
	    echo "Reloading main web site"
            systemctl restart nginx
            ;;


        # Webmail site
        webmail)
	    echo "Reloading webmail site"
            systemctl restart nginx
            ;;

        # rspamd site
        rspamd)
	    # Exit if rspamd server is not running
	    systemctl status rspamd >/dev/null 2>&1 || continue
	    echo "Reloading rspamd web interface"
            systemctl restart rspamd
            ;;


    esac
done

echo "Calling renewal hook: End"
