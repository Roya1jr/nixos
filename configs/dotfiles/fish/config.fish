if status is-interactive
    # Commands to run in interactive sessions can go here
    fastfetch
    ###Fish Settings###
    set fish_greeting

    ###Environment Variables###
    set -g -x PATH "$PATH:/lib"
    set -g -x PATH "$PATH:$HOME/go/bin"
    set -g -x PATH "$PATH:$HOME/.cargo/bin"
    ##Custom
    set -g -x ANDROID_HOME "$HOME/.config/android"
    set -g -x CHROME_EXECUTIBLE "/var/lib/flatpak/app/com.microsoft.Edge/current/active/export/bin/com.microsoft.Edge"
    ##########################

    #Zoxide
    zoxide init fish | source

    #Starship
    starship init fish | source

    #Ocaml
    source /home/princem/.opam/opam-init/init.fish >/dev/null 2>/dev/null; or true

    #Alias    
    alias grep rg
    alias cat bat
    alias ls "lsd --icon always"
    alias top htop
    alias vi hx
    alias git-local-clean "git branch --merged | egrep -v \"(^\\*|master|main|dev)\" | xargs git branch -d"


end
