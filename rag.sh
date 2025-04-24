#!/bin/sh

sudo apt update -y
sudo apt install tree -y

# Replace default flake8 linter with project-preconfigured ruff
code-server --uninstall-extension ms-python.flake8
code-server --install-extension charliermarsh.ruff

# Install type checking extension
code-server --install-extension ms-python.mypy-type-checker

# Install uv
curl -LsSf https://astral.sh/uv/install.sh | sh

# Clone project
cd ~/work/
git clone https://github.com/InseeFrLab/llm-open-data-insee.git
cd llm-open-data-insee

# Install project requirements
uv pip install -r pyproject.toml --system

# Install and run linting on project
uv pip install pre-commit --system
pre-commit install
pre-commit run --all-files
