export ICAP_SERVER=us.icap.glasswall-icap.com
export ICAP_PORT=1344

if [ -n "$1" ]; then export ICAP_SERVER=$1					; fi


time docker run --rm -v $PWD:/opt -it $EXTRA_GIT_OPTIONS     \
		c-icap-client 									     \
			-i $ICAP_SERVER 			                     \
			-p $ICAP_PORT 				                     \
