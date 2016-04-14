#!/usr/bin/env bash
# bin/compile <build-dir> <cache-dir> <env-dir>


echo "About to configure haproxy"
pwd
sed -i "s/\$PORT /${PORT}/g" haproxy.cfg
echo "haproxy configure:"
cat haproxy.cfg
echo "About to start haproxy"
./haproxy -f haproxy.cfg -db
