#!/bin/bash
# Simple script to compare if two branches have the same changes relative to master

# Configuration
BRANCH1="develop"
BRANCH2="develop-rebased-on-master"
# BRANCH2="develop-with-master-back-merged"
TARGET="master"

echo "Comparing $BRANCH1 and $BRANCH2 relative to $TARGET..."

# Create temp files
TEMP1=$(mktemp)
TEMP2=$(mktemp)

# Generate diffs and clean them in one step
git diff "$TARGET" "$BRANCH1" | grep -v "^index " | grep -v "^From " | grep -v "^Date: " >"$TEMP1"
git diff "$TARGET" "$BRANCH2" | grep -v "^index " | grep -v "^From " | grep -v "^Date: " >"$TEMP2"

# Compare the cleaned diffs
if diff -q "$TEMP1" "$TEMP2" >/dev/null; then
    echo "✅ IDENTICAL: Both branches have the same changes"
else
    echo "❌ DIFFERENT: Branches have different changes"
    diff --unified=1 "$TEMP1" "$TEMP2" | head -n 20
    echo "..."
fi

# Clean up
rm "$TEMP1" "$TEMP2"
