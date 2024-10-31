#!/bin/sh

sudo tee -a /etc/bash.bashrc <<EOT
# Project default values
export S3_BUCKET=projet-llm-insee-open-data
export EMB_MODEL=OrdalieTech/Solon-embeddings-large-0.1
export LLM_MODEL=mistralai/Mistral-7B-Instruct-v0.2
export EMB_DEVICE=cpu
EOT

# Replace default flake8 linter with project-preconfigured ruff
code-server --install-extension charliermarsh.ruff
code-server --disable-extensions ms-python.flake8

# Install type checking extension
code-server --install-extension ms-python.mypy-type-checker

cd ~/work/
git clone https://github.com/InseeFrLab/llm-open-data-insee.git
cd llm-open-data-insee
git checkout expl-gfy
git pull
pip install pre-commit
pre-commit install

pip install -r requirements-dev.txt

mc cp -r s3/projet-llm-insee-open-data/data/chroma_database/chroma_db/ ~/work/data/chroma_db
