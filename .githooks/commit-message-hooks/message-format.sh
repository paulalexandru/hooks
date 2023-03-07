#!/bin/sh
# Default to check that commit message follows rules from contributing.md
set -e

MSG_FILE=$1
FILE_CONTENT="$(cat $MSG_FILE)"

# Regex variables
# Format: #123456 - Relevant commit message.
#         TP123456 - Relevant commit message.
#         US123456 - Relevant commit message.

COMMIT_MESSAGE_FORMAT='^((TP|#|US)[0-9]+).+$'
ERROR_MSG="Commit messages must be formatted like TPxxxx or USxxxxx or #xxxxxx"

branch=$(git symbolic-ref --short HEAD)

if [[ $branch == "master" ]]; then
  if [[ $FILE_CONTENT =~ $COMMIT_MESSAGE_FORMAT ]]; then
	  exit 0
  else
    echo "Bad commit message \"$FILE_CONTENT\""
	  echo $ERROR_MSG
    exit 1
  fi
  else
    exit 0
fi