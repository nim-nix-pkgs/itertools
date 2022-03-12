{
  description = ''Itertools for Nim'';

  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.ref   = "master";
  inputs.flakeNimbleLib.repo  = "nim-flakes-lib";
  inputs.flakeNimbleLib.type  = "github";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
  
  inputs."itertools-master".url = "path:./master";
  inputs."itertools-master".inputs.nixpkgs.follows = "nixpkgs";
  inputs."itertools-master".inputs.flakeNimbleLib.follows = "flakeNimbleLib";
  
  inputs."itertools-v0_1".url = "path:./v0_1";
  inputs."itertools-v0_1".inputs.nixpkgs.follows = "nixpkgs";
  inputs."itertools-v0_1".inputs.flakeNimbleLib.follows = "flakeNimbleLib";
  
  inputs."itertools-v0_1_1".url = "path:./v0_1_1";
  inputs."itertools-v0_1_1".inputs.nixpkgs.follows = "nixpkgs";
  inputs."itertools-v0_1_1".inputs.flakeNimbleLib.follows = "flakeNimbleLib";
  
  inputs."itertools-v0_2_0".url = "path:./v0_2_0";
  inputs."itertools-v0_2_0".inputs.nixpkgs.follows = "nixpkgs";
  inputs."itertools-v0_2_0".inputs.flakeNimbleLib.follows = "flakeNimbleLib";
  
  inputs."itertools-v0_2_1".url = "path:./v0_2_1";
  inputs."itertools-v0_2_1".inputs.nixpkgs.follows = "nixpkgs";
  inputs."itertools-v0_2_1".inputs.flakeNimbleLib.follows = "flakeNimbleLib";
  
  inputs."itertools-v0_2_2".url = "path:./v0_2_2";
  inputs."itertools-v0_2_2".inputs.nixpkgs.follows = "nixpkgs";
  inputs."itertools-v0_2_2".inputs.flakeNimbleLib.follows = "flakeNimbleLib";
  
  inputs."itertools-v0_3_0".url = "path:./v0_3_0";
  inputs."itertools-v0_3_0".inputs.nixpkgs.follows = "nixpkgs";
  inputs."itertools-v0_3_0".inputs.flakeNimbleLib.follows = "flakeNimbleLib";
  
  inputs."itertools-v0_3_1".url = "path:./v0_3_1";
  inputs."itertools-v0_3_1".inputs.nixpkgs.follows = "nixpkgs";
  inputs."itertools-v0_3_1".inputs.flakeNimbleLib.follows = "flakeNimbleLib";
  
  inputs."itertools-v0_4_0".url = "path:./v0_4_0";
  inputs."itertools-v0_4_0".inputs.nixpkgs.follows = "nixpkgs";
  inputs."itertools-v0_4_0".inputs.flakeNimbleLib.follows = "flakeNimbleLib";
  
  outputs = { self, nixpkgs, flakeNimbleLib, ...}@inputs:
  let 
    lib  = flakeNimbleLib.lib;
    args = ["self" "nixpkgs" "flakeNimbleLib"];
  in lib.mkProjectOutput {
    inherit self nixpkgs;
    meta = builtins.fromJSON (builtins.readFile ./meta.json);
    refs = builtins.removeAttrs inputs args;
  };
}