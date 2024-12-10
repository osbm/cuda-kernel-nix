{
  description = "cuda kernel compilation with nix";

  nixConfig = {
    extra-substituters = [
      "https://nix-community.cachix.org"
    ];
    extra-trusted-public-keys = [
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
    ];
  };

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
  };
  outputs = {
    self,
    nixpkgs,
    ...
  }: let
    system = "x86_64-linux";
    pkgs = import nixpkgs {
      inherit system;
      config.allowUnfree = true;
      config.cudaSupport = true;
      config.nvidia.acceptLicense = true;
    };
  in {
    packages."${system}" = {
      # just one main.cu file for now
      # compile it and place it to $out/bin/cuda-kernel
      cuda-kernel = pkgs.stdenv.mkDerivation {
        name = "cuda-kernel";
        src = ./.;
        buildInputs = with pkgs; [
          cudatoolkit
          cudaPackages.cuda_cudart
          linuxPackages.nvidia_x11
        ];
        LD_LIBRARY_PATH = "${pkgs.linuxPackages.nvidia_x11}/lib";
        buildPhase = ''
          nvcc -o main main.cu
          mkdir -p $out/bin
          mv main $out/bin/cuda-kernel
        '';
      };
      default = self.packages."${system}".cuda-kernel;
    };
  };
}
