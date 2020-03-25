# get the IP from a given hostname (domain)
hostname2ip() {
	ping -c 1 "$1" | egrep -m1 -o '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}'
}

# Find real from shortened url
unshorten_url() {
	curl -sIL $1 | sed -n 's/location: *//p'
}

#------------------------------------------------------------------------------#

# get PID from a tcp PORT number
function pid_from_port() {
	if [ "$1" ]; then
		# list all process related to the given port
		# lsof -P | grep ':$1' | awk '{print $2}'
		lsof -n -iTCP:$1 -sTCP:LISTEN -n -l -P | grep 'LISTEN' | awk '{print $2}'
	else
		echo "no port defined"
	fi
}

# kill process related to a given port
function freeport() {
	if [ "$1" ]; then
		pid_from_port $1 | xargs kill -9
	else
		echo "no port defined"
	fi
}
