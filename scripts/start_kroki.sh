#!/bin/bash

coproc KROKI_SERV_INST { java -DKROKI_LISTEN=127.0.0.1:${MAIN_KROKI_PORT} -jar /usr/local/kroki/kroki-server.jar &> /tmp/kroki_server.log }

sleep 4



