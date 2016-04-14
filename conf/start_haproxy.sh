#!/usr/bin/env bash

set -e
set -o pipefail   # don't ignore exit codes when piping output
set -o nounset    # fail on unset variables

echo "About to configure haproxy"
sed -i 's/$PORT/'${VCAP_APP_PORT}'/g' haproxy.cfg
echo "haproxy configure:"
cat haproxy.cfg
echo "About to start haproxy"
./haproxy -f haproxy.cfg -db
