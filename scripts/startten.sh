#!/bin/bash

# file locations
ENV_PATH="/Users/dan/Code/python/env-pil"
FETCH_SCRIPT="/Users/dan/Code/python/dryad_utils/fetch_get_urls.py"
LOGS="/Users/dan/dryad_doi_lockup/reproducible_dev/logs/datadryad.org-access_log-2014-03-28-0800-1015-removestatic"

# Activate virtualenv
source "${ENV_PATH}/bin/activate"

# Start ten processes
for i in 1 2 3 4 5 6 7 8 9 10
do
  python "$FETCH_SCRIPT" "$LOGS" &
  sleep 5
done
