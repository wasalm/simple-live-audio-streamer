#!/bin/bash
chmod 600 ./portmap/wasalm.first.pem
ssh -i ./portmap/wasalm.first.pem wasalm.first@wasalm-34538.portmap.io -N -R 34538:localhost:8888

#"-o", "UserKnownHostsFile=/dev/null", // dont use default hosts file
#"-o", "StrictHostKeyChecking=no", // disable hosts checking
#BatchMode yes