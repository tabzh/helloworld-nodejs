#!/bin/bash

STEP_NAME=$1
echo "Evaluating step: $STEP_NAME"

# Load the START_FROM variable
if [ -f /workspace/env_vars.txt ]; then
  . /workspace/env_vars.txt
else
  START_FROM="none"
fi

if [ "$START_FROM" != "none" ] && [ "$START_FROM" != "$STEP_NAME" ] && [ "$STEP_NAME" != "check_commit_message" ]; then
  echo "Skipping step: $STEP_NAME"
  exit 0
fi

echo "Executing step: $STEP_NAME"
shift
exec "$@"