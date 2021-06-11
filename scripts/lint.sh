#!/bin/bash
set -euxo pipefail

poetry run cruft check
poetry run mypy -p isort
poetry run black --target-version py36 --check .
poetry run isort --profile hug --check --diff isort/ tests/
poetry run isort --profile hug --check --diff example_isort_formatting_plugin/
poetry run flake8 isort/ tests/
poetry run safety check -i 39462 -i 40291
poetry run bandit -r isort/ -x isort/_vendored
