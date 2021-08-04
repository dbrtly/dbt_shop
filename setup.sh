#!/bin/bash

### developer setup

# install vscode
# install pyenv
# brew install pyenv
# brew install pyenv-virtualenv
# echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.zshrc
# echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.zshrc
# echo -e 'if command -v pyenv 1>/dev/null 2>&1; then\n  eval "$(pyenv init -)"\nfi' >> ~/.zshrc

# pyenv install 3.9.6
# pyenv global 3.9.6
# pyenv virtualenv 3.9.6 dbt_shop
# pyenv local 3.9.6/envs/dbt_shop && pyenv activate 3.9.6/envs/dbt_shop 
# pip install -r requirements.txt

export DBT_MODE=dev
export DBT_PROFILES_DIR=${PWD}
export DBT_METHOD=oauth
export DBT_PROJECT=daniel-bartley-sandbox 
export DBT_PRIORITY=interactive

# create and activate python virtual environment when deployed
python3.9 -m venv .venv
source ./.venv/bin/activate
pip install --upgrade pip

# install requirements
pip install requirements.txt

if [ ${DBT_MODE}=dev ]
then
  # authenicate with google cloud for oauth
  echo 'ensure google cloud sdk is installed'
  echo 'see https://cloud.google.com/sdk/downloads'

  gcloud auth application-default login \
    --scopes=https://www.googleapis.com/auth/bigquery,\
  https://www.googleapis.com/auth/drive.readonly,\
  https://www.googleapis.com/auth/iam.test
fi

dbt seed
dbt deps
dbt compile
# validate source freshness
dbt source snapshot-freshness
# validate exposure dependencies
# dbt test --models +exposure:* 
dbt run
