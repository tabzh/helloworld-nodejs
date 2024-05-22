#!/bin/bash

STEP_NAME=$1
echo "Evaluating step: $STEP_NAME"
echo "START FROM step: $START_FROM"

if [ "$START_FROM" != "none" ] && [ "$START_FROM" != "$STEP_NAME" ]; then
  echo "Skipping step: $STEP_NAME"
  exit 0
fi

echo "Executing step: $STEP_NAME"
shift
exec "$@"
