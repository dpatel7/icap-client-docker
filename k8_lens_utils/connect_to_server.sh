ICAP_SERVER=$1
LOCAL_PORT=$2

ssh -i packer.pem -L $LOCAL_PORT:127.0.0.1:6443 ubuntu@$1


