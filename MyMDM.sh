serverURL="localhost:8000"
BaseName=$(basename $HOME)

echo $BaseName
PublicIP=$(curl -s ipinfo.io/ip)

echo $PublicIP

function Startup () {
    # Function that will run on startup
    if [ -x "$(command -v curl)" ]; then
        echo 'Error: curl is not installed.' >&2
        exit 1
    fi
    if [ -x "$(command -v brew)" ]; then
        echo 'Error: brew is not installed.' >&2
        exit 1
    if [ -x "$(command -v jq)" ]; then
        echo 'Error: jq is not installed.' >&2
        brew install jq
    fi

    echo "Starting Up"
    Login=$(curl -sS  "$serverURL/Login?Username=$BaseName&Ip=$PublicIP")
    # {"Success":true,"Ip":"ip"}
    #echo $Login
    if jq -e '.Success' <<< "$Login" | grep -q "true"; then
        echo "Login Successful"
    else
        echo "Login Failed"
    fi

    # will set the status
    # http://localhost:8000/SetStatus?Username=test&Status=unknown
    Status=$(curl -sS  "$serverURL/SetStatus?Username=$BaseName&Status=test")
    if jq -e '.Success' <<< "$Status" | grep -q "true"; then
        echo "Status Set"
    else
        # {"Success": false, "Reason": "Username Not Found"}

        echo "Status Set Failed"
        # prints the reason
        echo $(jq '.Reason' <<< "$Status")
    fi
}



Startup

