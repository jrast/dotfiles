#!bash
if [ "$SSH_AUTH_SOCK" != "" ]; then
    echo "SSH-Agent allready running"
    return
fi
. .agent > /dev/null
ps -p $SSH_AGENT_PID | grep ssh-agent > /dev/null || {
    ssh-agent > .agent
    . .agent > /dev/null
}
