#!/bin/bash

# Method 1: Check all subdirectories that are git repos
for repo in */; do
    repo="${repo%/}"
    if git -C "$repo" rev-parse --git-dir >/dev/null 2>&1; then
        echo "📁 $repo"
        git -C "$repo" switch main 2>/dev/null || echo "  ❌ Failed"
    fi
done