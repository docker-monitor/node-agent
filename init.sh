#!/bin/bash

#Get host info
export HOST_NAME=$(hostname)
export HOST_IP_ADRESS=$(hostname -i | awk '{print $1}')

# define send request body.
BODY1='{"address":"'$HOST_NAME'","id":"","name":"'$PROJECT_NAME'","port":13004,"tags":[]}'
BODY1_LEN=$( busybox echo -n ${BODY1} | wc -c )
#csadviser
BODY2='{"address":"'$HOST_NAME'","id":"","name":"'$PROJECT_NAME'","port":13005,"tags":[]}'
BODY2_LEN=$( busybox echo -n ${BODY2} | wc -c )

echo $API_HOST
# send a post request to consul api server.
echo -ne "POST /api/service/register HTTP/1.0\r\nHost: ${HOST_IP_ADRESS}\r\nContent-Type: application/json;charset=utf-8\r\nContent-Length: ${BODY1_LEN}\r\n\r\n${BODY1}" | nc -i 3 $API_HOST 13010

#register csadviser service
echo -ne "POST /api/service/register HTTP/1.0\r\nHost: ${HOST_IP_ADRESS}\r\nContent-Type: application/json;charset=utf-8\r\nContent-Length: ${BODY2_LEN}\r\n\r\n${BODY2}" | nc -i 3 $API_HOST 13010
