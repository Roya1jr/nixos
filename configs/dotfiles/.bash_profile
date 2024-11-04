# Check if running in an interactive shell
export EDITOR='hx'
export VISUAL='hx'

export PATH="$PATH:/home/prince/.nix-profile/bin"
export PATH="$PATH:/nix/profile/bin"
export PATH="$PATH:/home/prince/.local/state/nix/profile/bin"
export PATH="$PATH:/nix/var/nix/profiles/default/bin"
export PATH="$PATH:/run/current-system/sw/bin"
export PATH="$PATH:/etc/profiles/per-user/prince/bin"
export PATH="$PATH:/home/prince/go/bin"
export PATH="$PATH:/home/prince/.cargo/bin"

if [[ $- == *i* ]]; then
    exec nu
fi
