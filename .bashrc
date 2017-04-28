## MongoDB bashrc

export BASH_CONFIG_HOME="$HOME/.config/bash"

## List of external bash setup files
sources=(
    "$BASH_CONFIG_HOME/compatability"
    "$BASH_CONFIG_HOME/colors"
    "$BASH_CONFIG_HOME/commands"
    "$BASH_CONFIG_HOME/local"
    "$BASH_CONFIG_HOME/git_completion_bash"
    "$BASH_CONFIG_HOME/interactive"
)


for rc in ${sources[@]}; do
    # Only source files if they exist on this system
    if [ -f "$rc" ]
    then
        source "$rc"
    fi
done
export LDFLAGS="-L/usr/local/opt/openssl/lib"
export CPPFLAGS="-I/usr/local/opt/openssl/include"
export PKG_CONFIG_PATH="/usr/local/opt/openssl/lib/pkgconfig"
qotd
