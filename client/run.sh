#!/bin/sh

supervisord 2> /dev/null

sudo -E -H -u www-data zsh -c "zsh"