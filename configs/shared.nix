{ pkgs, unstable, inputs, lib, ... }:
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
        #murex
        ####################

        #######Programming##########i
        ##C++#
        cmake
        gforth
        glibc
        gfortran14
        libclang
        lldb
        xorg.libX11
        ######

        cbqn-replxx
        #dotnet-sdk_8
        erlang_26
        factor-lang
        gleam
        #ghc

        ##GOLANG##
        air
        go_1_22
        golangci-lint
        gopls
        gotools
        hugo
        gnumake
        templ
        #########

        #hare
        #io
        (lib.hiPrio j)

       
        
        ##Janet
        #janet
        #jpm
        ##Janet

        jelly

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

        #mercury

        ##Ocaml
        #ocaml
        #opam
        ##Ocaml

        #perl
        php
        protobuf_25

        ##Python
        python311
        python311Packages.pip
        ruff-lsp
        python311Packages.python-lsp-server
        python311Packages.ipykernel
        ##

        qnial

        #racket
        #rakudo

        ##Nix
        nil
        nixpkgs-fmt
        ##Nix

        rustup
        tailwindcss
        wasmtime
        uiua
        #unison-ucm
        yaml-language-server

        zulu

        ##Zig
        #zig
        #zls
        ##Zig
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
          fontfor
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
          sqlite
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
