#!/usr/bin/env bash
ps aux | grep lock.sh | grep -v grep | awk '{print $2}' | xargs kill -9
