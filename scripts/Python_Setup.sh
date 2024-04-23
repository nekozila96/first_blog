#!/bin/bash

sudo yum update
sudo yum -y install git gcc zlib-devel bzip2-devel readline-devel sqlite-devel openssl-devel

echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc
echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc
echo -e 'if command -v pyenv 1>/dev/null 2>&1; then\n  eval "$(pyenv init -)"\nfi' >> ~/.bashrc
exec "$SHELL"
pyenv --version
pyenv install 3.6.5
pyenv global 3.6.5
pyenv global
