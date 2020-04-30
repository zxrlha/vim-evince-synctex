#!/usr/bin/env bash

d=$(dirname $(readlink -f $0))

if ! ps aux | grep evince_backward_search | grep $2 ; then
  $d/evince_backward_search "$2" "gvim --servername $1 --remote-silent '+%l<Enter>' %f" &

  evince "$2"

  kill %1
fi

