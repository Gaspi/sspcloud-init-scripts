#!/bin/sh

sudo tee -a /etc/bash.bashrc <<EOT
# Project default values
export S3_BUCKET=projet-llm-insee-open-data
export EMB_MODEL_NAME=OrdalieTech/Solon-embeddings-large-0.1
export LLM_MODEL_NAME=mistralai/Mistral-7B-Instruct-v0.2
EOT

code-server --install-extension ms-python.mypy-type-checker

cd ~/work/
git clone https://github.com/InseeFrLab/llm-open-data-insee.git
cd llm-open-data-insee
git checkout update-app
git pull
pip install pre-commit
pre-commit install

pip install -r requirements-dev.txt

mc cp -r s3/projet-llm-insee-open-data/data/chroma_database/chroma_db/ ~/work/llm-open-data-insee/data/chroma_db
