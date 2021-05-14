# bashrc extra

# pyenv
# 必须手动写 .bashrc
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"

# direnv
# 必须手动写 .bashrc
eval "$(direnv hook bash)"

# sqlite3 update
export LD_LIBRARY_PATH="/usr/local/sqlite/lib"

# 兼容 s2i 环境变量定义
if [[ -f ~/.s2i/environment ]]; then
  echo "---> [!] apply s2i environment"
  source ~/.s2i/environment
fi
