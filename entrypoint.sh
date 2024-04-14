#!/bin/sh
sed -i 's/strict: true/#strict: true/g' /docs/mkdocs.yml
exec /sbin/tini -- mkdocs serve "--dev-addr=0.0.0.0:8000"