ICAP_SERVER=$1
RANDOM_PORT=$(head -200 /dev/urandom |cksum | cut -f1 -d " " | awk '{print $1%63000+2001}')

rm -rf $1
mkdir $1

echo
echo "***** For connecting local Lens App to remote K8s server *****"
echo
echo "1) Getting ~/.kube/config from ${ICAP_SERVER} icap server"
echo

scp -i packer.pem ubuntu@$1:./.kube/config $1/config

echo
echo "2) Change 6433 to local port ${RANDOM_PORT}"
echo

sed -i -e "s/6443/${RANDOM_PORT}/" $1/config

echo
echo "3) Creating ssh connection to server with port forwarding (local ${RANDOM_PORT} to remote 6443)"
echo

ssh -i packer.pem -L $RANDOM_PORT:127.0.0.1:6443 ubuntu@$1


