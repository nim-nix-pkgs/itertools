{
  description = ''Itertools for Nim'';

  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.ref   = "master";
  inputs.flakeNimbleLib.repo  = "nim-flakes-lib";
  inputs.flakeNimbleLib.type  = "github";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
  
  inputs.src-itertools-v0_2_1.flake = false;
  inputs.src-itertools-v0_2_1.owner = "narimiran";
  inputs.src-itertools-v0_2_1.ref   = "v0_2_1";
  inputs.src-itertools-v0_2_1.repo  = "itertools";
  inputs.src-itertools-v0_2_1.type  = "github";
  
  outputs = { self, nixpkgs, flakeNimbleLib, ...}@deps:
  let 
    lib  = flakeNimbleLib.lib;
    args = ["self" "nixpkgs" "flakeNimbleLib" "src-itertools-v0_2_1"];
  in lib.mkRefOutput {
    inherit self nixpkgs ;
    src  = deps."src-itertools-v0_2_1";
    deps = builtins.removeAttrs deps args;
    meta = builtins.fromJSON (builtins.readFile ./meta.json);
  };
}