#!/usr/bin/env bash
./getlinks.js http://www.hkssf-hk.org.hk/hk/sec/events/ath.htm | grep -E '^(個人|團體|Day One Program|Day Two Program)' | sed 's#.*\(http.*pdf\)$#wget \1#' > raylex.sh
bash raylex.sh
