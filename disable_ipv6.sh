#!/usr/bin/env bash

SYSCTL_CONF_FILE=/etc/sysctl.d/60-ipv6-disable.conf

[ ! -e "${SYSCTL_CONF_FILE}" ] && sudo tee "${SYSCTL_CONF_FILE}" <<"EOF" >/dev/null
net.ipv6.conf.all.disable_ipv6=1
net.ipv6.conf.default.disable_ipv6=1
net.ipv6.conf.lo.disable_ipv6=1
EOF

sudo systemctl restart procps

RC_LOCAL_FILE=/etc/rc.local

if [ ! -e "${RC_LOCAL_FILE}" ]; then

    sudo tee "${RC_LOCAL_FILE}" <<"EOF" >/dev/null
#!/usr/bin/env bash
systemctl restart procps
exit 0
EOF

fi

sudo chmod 755 "${RC_LOCAL_FILE}"

exit 0
