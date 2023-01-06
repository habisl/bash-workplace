function vault_otp() {

    VAULT_ADDR="http://vault.local:8200"
    SSH_MOUNT="ssh"
    SSH_ROLE="otp"
    ANSIBLE_INVENTORY=${ANSIBLE_INVENTORY:-/full/path/to/hosts.ini}
    REMOTE_USER="ubuntu"

    if [ -z "$VAULT_TOKEN" ]; then
        echo "missing vault token!"
        return
    fi
    HOSTNAME=$1
    if [ -n "$2" ]; then
        REMOTE_USER="$2"
    fi
    if [ -z "$VAULT_TOKEN" ]; then
        echo "missing vault token!"
        return
    fi

    IP=$(ansible-inventory -i "$ANSIBLE_INVENTORY" --host "$HOSTNAME" 2>/dev/null | jq -r '.ansible_host')

    if [ -z "$IP" ]; then
        IP=$(ssh -G "$HOSTNAME" | awk '$1 == "hostname" p{ print $2 }')
    fi
    CONFIGURED_USER=$(ssh -G "$HOSTNAME" | awk '$1 == "user" p{ print $2 }')
    if [ -n "$CONFIGURED_USER" ]; then
      REMOTE_USER="$CONFIGURED_USER"
    fi
    if [ -z "$IP" ]; then
        IP=$HOSTNAME
    fi

    VALIDATE=$(dig +short "$IP")
    if [ -n "$VALIDATE" ]; then
        IP=$VALIDATE
    fi
    OTP=$( curl \
            --header "X-Vault-Token: $VAULT_TOKEN" \
            --request POST \
            --data "{ \"username\": \"$REMOTE_USER\", \"ip\": \"${IP}\" }" \
            $VAULT_ADDR/v1/$SSH_MOUNT/creds/$SSH_ROLE | jq -r '.data.key')

    echo $OTP

}
