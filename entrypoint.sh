#!/bin/sh
exec /sbin/tini -- mkdocs serve "--no-strict" "--dev-addr=0.0.0.0:8000" 