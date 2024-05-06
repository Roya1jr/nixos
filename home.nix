{ pkgs, unstable,inputs,system, ... }:

let
    upkgs = with unstable; [
    ## Tools
    air
    biome
    go-swag
    helix
    jujutsu
    kakoune
    neofetch
    tailwindcss
    templ

    ## Db
    tigerbeetle

    ## Runtimes
    bun

    ## Languages
    cbqn-replxx
    factor-lang
    go_1_22
    hare
    jelly
    nim-unwrapped-2
    uiua
    unison-ucm
    zig


    ## LSP
    nimlsp
    nil
    nixpkgs-fmt
    vscode-langservers-extracted
    typescript
    nodePackages.typescript-language-server
    lua-language-server
    marksman
    yaml-language-server
    taplo
    zls

    ##Game engines
    raylib

    ##Services
    jellyfin
    jellyfin-web
    jellyfin-ffmpeg

    ## GUI
    heroic
    geany
    godot_4    
  ];
inherit system;

in

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home = {
    homeDirectory = "/home/prince";
    stateVersion = "23.11";
    username = "prince";
    packages = with pkgs; [
      # CLI Tools
      bat
      bash
      butane
      cmake
      cfssl
      coreutils-full
      darcs
      fd
      fish
      gnumake
      gnupatch
      gzip
      htop
      jq
      lazygit
      lsd
      mercurial
      mariadb
      neovim
      openssh
      openssl
      parallel
      ##Podman
      podman
      podman-compose
      podman-desktop
      ##
      ripgrep
      rsync
      sshs
      starship
      tealdeer
      traceroute
      tree-sitter
      unzip
      wget
      wl-clipboard
      yarn
      zip
      zoxide

      # Programming languages
      ghc
      gforth
      io
      
      ##Janet
      janet
      jpm
      ##Janet
      
      ##Kotlin
      kotlin
      kotlin-language-server
      ##Kotlin
      
      ##Lua
      lua
      luarocks
      ##Lua
      
      mercury
      
      ##Ocaml
      ocaml
      opam
      ##Ocaml
      
      perl
      
      ##Python
      python311
      python311Packages.pip
      python311Packages.ruff-lsp
      python311Packages.python-lsp-server
      ##Python
      
      racket
      rakudo
      rustup
      
      ##Java
      zulu
      ##Java
      
      # Runtimes
      nodejs_21
      wasmtime
    
      # Build Tools
      libclang
      gfortran
      git
      lldb
    
      #Fonts
      fantasque-sans-mono
      hack-font
      julia-mono
      redhat-official-fonts

      #LSP
      inputs.bqnlsp.packages.${system}.lsp 
     
      # GUI
      blender    
      dbeaver
      inkscape
      mpv
      vscode
      wezterm
    ] ++  upkgs;
  };

  home.file = {
    ".config/fish/config.fish".source = dotfiles/fish/config.fish;
    ".config/starship.toml".source = dotfiles/starship.toml;
    ".config/helix/languages.toml".source = dotfiles/helix/languages.toml;
    ".config/helix/config.toml".source = dotfiles/helix/config.toml;
    ".config/wezterm/wezterm.lua".source = dotfiles/wezterm/wezterm.lua;
  };

home.sessionVariables = {
    EDITOR = "hx";
  };
  
  ## Custom programs config
   programs.git = {
    enable = true;
    userName = "Prince Junior Mguni";
    userEmail = "prince.mguni@outlook.com";
    extraConfig = {
      init = {
        defaultBranch = "main";
      };
      safe = {
        directory = "/etc/nixos";
      };
    };
  };
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
