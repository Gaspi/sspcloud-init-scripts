#!/bin/sh

sudo apt update -y
sudo apt install tree -y

sudo tee -a /etc/bash.bashrc <<EOT
# Project default values
export RAG_S3_BUCKET=projet-llm-insee-open-data
export RAG_EMB_MODEL=OrdalieTech/Solon-embeddings-large-0.1
export RAG_LLM_MODEL=mistralai/Mistral-7B-Instruct-v0.2
export RAG_EMB_DEVICE=cpu
EOT

# Replace default flake8 linter with project-preconfigured ruff
code-server --uninstall-extension ms-python.flake8
code-server --install-extension charliermarsh.ruff

# Install type checking extension
code-server --install-extension ms-python.mypy-type-checker

# Clone project
cd ~/work/
git clone https://github.com/InseeFrLab/llm-open-data-insee.git
cd llm-open-data-insee

# Move to branch
git checkout expl-gfy
git pull

# Install requirements and run linting on project
pip install -r requirements-dev.txt
mypy --install-types
pip install pre-commit
pre-commit install
pre-commit run --all-files

# Prepare
mc cp -r s3/projet-llm-insee-open-data/data/chroma_database/chroma_db/ ~/work/data/chroma_db
