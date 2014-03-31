#!/bin/bash

ps -ef | grep fetch_get_urls | grep -v grep | awk '{print $2}' | xargs kill
