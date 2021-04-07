#!/bin/bash

# First tries to launch a new client frame. If the server is not up, then
# launches a regular emacs instance.

# If launching without a grafical environment, uses 'emacsclient -nw'
# instead of 'emacsclient -c'.

if [ -z "$DISPLAY" ]; then
  if ! emacsclient -nw "$@"; then
    emacs "$@"
  fi
else
  if ! emacsclient -c "$@"; then
    emacs "$@"
  fi
fi
