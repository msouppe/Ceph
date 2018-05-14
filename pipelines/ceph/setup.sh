#!/bin/bash
# [wf] setup infrastructure for test
set -e

if [ -n "$CI" ]; then
  # [wf] launch a "cluster" locally
  setup/single-node.sh
else
  # [wf] allocate nodes on CloudLab
  setup/cloudlab.sh
fi
