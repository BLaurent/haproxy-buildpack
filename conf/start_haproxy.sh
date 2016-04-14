#!/usr/bin/env bash

set -e
set -o pipefail   # don't ignore exit codes when piping output
set -o nounset    # fail on unset variables
unset GIT_DIR     # Avoid GIT_DIR leak from previous build steps

echo "About to configure haproxy"
pwd
sed -i "s/\$PORT /${PORT}/g" haproxy.cfg
echo "haproxy configure:"
cat haproxy.cfg
echo "About to start haproxy"
./haproxy -f haproxy.cfg -db
