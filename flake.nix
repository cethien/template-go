{
  outputs = { self, nixpkgs }: 
  let 
    system = "x86_64-linux";
    pkgs = import nixpkgs { inherit system; };
  in 
  {
    devShells.x86_64-linux.default = pkgs.mkShell {
      buildInputs = with pkgs; [
        gnumake
        go
        gopls

        bun
      ];

      shellHook = ''
        if [ ! -f .envrc ]; then
          echo "use flake" >> .envrc && direnv allow          
        fi
        
        make
      '';
    };
  };

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };
}
