#!/bin/bash

commit_id=$(git rev-parse --short HEAD)
suffix=""

if git diff-index --quiet HEAD -- || git ls-files --others --error-unmatch . >/dev/null 2>&1; then
    suffix="-dirty"
fi

echo -n "$commit_id$suffix"