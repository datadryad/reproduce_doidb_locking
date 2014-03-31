# Scripts to reproduce dryad's doi.db locking issue

This directory contains scripts that have been able to reproduce the doi.db locking issue on dev.datadryad.org.

Requires dryad-dev running with the [signal-doi-lock](https://github.com/datadryad/dryad-repo/commit/c92151823bcaa271d2ec7b630ed08b36680920d9) branch.

Open two terminal windows, and run these commands in each

1. `scripts/watch.sh`
2. `scripts/startten.sh`

When the `watch.sh` script stops displaying `OK`, the bug has been reproduced.  In three consecutive tests on 2014-03-31 (Apple MacBook Pro Retina 15"), this took about 12 minutes to occur.

To stop the process, run `scripts/kill.sh`.

## watch.sh

This script attempts to GET `/doidb-lock` on dev.datadryad.org every 5 seconds, with a timeout of 3 seconds.  If this operation fails, it means the doi.db file could be locked for writing.

## startten.sh

This script spawns 10 processes that attempt to fetch a list of URLs from dev.datadryad.org.  The processes are python scripts in [dryad_utils](https://github.com/datadryad/dryad_utils). The list of URLs was extracted from apache log files between 8:00 and 10:15 on www.datadryad.org on 2014-03-28.

## Summary

Triggering the issue on dev seems to be a matter of a sustained load on the system accessing the doi.db file.  I'm confident that no single request is triggering this issue, but have been able to reliably reproduce the bug in 12 minutes with this script.

