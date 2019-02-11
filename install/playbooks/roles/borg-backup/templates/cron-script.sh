#!/bin/dash

# Call the global script helper
{% if system.debug %}
/usr/local/sbin/backup --config '{{ location.name }}' --log-level DEBUG
{% else %}
/usr/local/sbin/backup --config '{{ location.name }}'
{% endif %}
