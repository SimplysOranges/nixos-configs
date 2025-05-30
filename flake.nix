{
  description = "TestFirst";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = { self, nixpkgs }:
  let
    system = "x86_64-linux";

    pkgs = import nixpkgs {
      inherit system;

      config = {
       allowUnfree = true;



      };

    };

in
{

nixosConfigurations = {
 myNixos = nixpkgs.lib.nixosSystem {
   specialArgs = { inherit system; };

   modules = [
    ./nixos/configuration.nix
    
    ({ ... }: {
       services.fwupd.enable = true;
       boot.loader.efi.canTouchEfiVariables = true;

       programs.steam.enable = true;

       hardware.opengl = {
	enable = true;
       };

       programs.gamemode.enable = true;

       })




   ];
 };
};


};





}
