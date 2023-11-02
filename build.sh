#!/usr/bin/bash

bsc -sim -u -g $2 $1
bsc -sim -keep-fires -e $2 -o $3 
