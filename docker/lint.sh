#!/usr/bin/env bash

set -euxo pipefail

echo "Running linters and formatters..."

isort democritus_stats/ tests/

black democritus_stats/ tests/

mypy democritus_stats/ tests/

pylint --fail-under 9 democritus_stats/*.py

flake8 democritus_stats/ tests/

bandit -r democritus_stats/

# we run black again at the end to undo any odd changes made by any of the linters above
black democritus_stats/ tests/
