{ pkgs, unstable, inputs, system, ... }:
{
  services.printing.enable = true;
  services.openssh.enable = true;
  networking.hostName = "nixos";
  networking.networkmanager.enable = true;
  time.timeZone = "Africa/Johannesburg";
  i18n.defaultLocale = "en_ZA.UTF-8";
  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  virtualisation.containers.enable = true;
  users = {
    mutableUsers = true;
    users = {
      prince = {
        shell = pkgs.fish;
        description = "Me";
        isNormalUser = true;
        extraGroups = [
          "wheel"
          "networkmanager"
        ];
      };
    };
  };

  programs = {
    fish = {
      enable = true;
    };
    nix-ld.enable = true;
  };
  home-manager.users.prince =
    { system, ... }:
    let
      upkgs = with unstable; [
        #######CLI##########
        murex
        ####################

        #######Programming##########
        ##C++
        cmake
        gforth
        glibc
        gfortran
        libclang
        lldb
        ##

        cbqn-replxx
        erlang_26
        factor-lang
        gleam

        ##GOLANG
        air
        go_1_22
        golangci-lint
        gopls
        gotools
        hugo
        gnumake
        templ
        ##GOLANG

        ##JS
        biome
        bun
        emmet-language-server
        nodejs_22
        nodePackages.typescript-language-server
        typescript
        vscode-langservers-extracted
        ##JS

        ##Lua
        lua
        luarocks
        lua-language-server
        ##Lua

        php
        protobuf_25

        ##Python
        python311
        python311Packages.pip
        ruff-lsp
        python311Packages.python-lsp-server
        ##

        qnial

        ##Nix
        nil
        nixpkgs-fmt
        ##Nix

        rustup
        tailwindcss

        wasmtime
        uiua
        yaml-language-server


        ###Future
        #io
        #ghc
        #hare

        ##Janet
        #janet
        #jpm
        ##Janet

        #jelly
        #racket
        #rakudo

        ##Ocaml
        #ocaml
        #opam
        ##Ocaml

        #perl
        #mercury

        ##Zig
        #zig
        #zls
        ##Zig

        #unison-ucm
        ###Future

        ##########################

        #######LSP##########
        dockerfile-language-server-nodejs
        inputs.bqnlsp.packages.${"x86_64-linux"}.lsp
        taplo
        marksman
        ####################

        #######Prog Tools##########
        helix

        ##Podman
        buildah
        podman
        podman-compose
        podman-desktop
        skopeo
        ##

        tree-sitter
        tigerbeetle
        ##########################

        #######Fonts##########
        fantasque-sans-mono
        hack-font
        julia-mono
        redhat-official-fonts
        ####################

      ];
    in
    {
      home = {
        packages = with pkgs;[
          #######CLI##########
          bat
          bash
          coreutils-full
          fastfetch
          fd
          git
          gzip
          htop
          jq
          lsd
          lsof
          openssh
          openssl
          parallel
          ripgrep
          rsync
          sshs
          starship
          tealdeer
          traceroute
          unzip
          wget
          wl-clipboard
          zip
          zoxide
          ######################
        ] ++ upkgs;
      };

      home.file = {
        ".config/fish/config.fish".source = ./dotfiles/fish/config.fish;
        ".config/starship.toml".source = ./dotfiles/starship.toml;
        ".config/helix/languages.toml".source = ./dotfiles/helix/languages.toml;
        ".config/helix/config.toml".source = ./dotfiles/helix/config.toml;
        ".config/wezterm/wezterm.lua".source = ./dotfiles/wezterm/wezterm.lua;
      };
      home.sessionVariables = {
        EDITOR = "hx";
        SHELL = "fish";
      };
    };

}
