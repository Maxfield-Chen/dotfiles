
# Emacs setup notes

Had to use this repo to get a valid ELPA compatible emacs build

* https://launchpad.net/~kelleyk/+archive/ubuntu/emacs

On first run use --insecure since they suck at tls and signing keys

clone spacemacs into .emacs.d

## Layers
  * Haskell
  * autocomplete
  * syntax-checking
  * lsp
    * Configure lsp to use ghcide

## Configuration 
  Switch emacs.d to develop git branch
  install gnutls
    * https://github.com/syl20bnr/spacemacs/issues/12535
  Using HIE to provide an lsp server for the haskell mode editor integration.
  turned on line numbers
  changed to default full screen

## Environment setup
Nix for all the things
  * https://medium.com/purely-functional/nix-setup-for-haskell-with-ghcide-and-hlint-3e268343efed
  * http://magnus.therning.org/posts/2019-09-19-000-haskell--ghcide--and-spacemacs.html
  * https://blog.latukha.com/NixOS-HIE-Emacs/
lorri for direnv integration
  * https://github.com/target/lorri
