{
  description = ''Wrapper around the libpng library for png graphics'';

  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.ref   = "master";
  inputs.flakeNimbleLib.repo  = "nim-flakes-lib";
  inputs.flakeNimbleLib.type  = "github";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
  
  inputs.src-png-master.flake = false;
  inputs.src-png-master.owner = "barcharcraz";
  inputs.src-png-master.ref   = "master";
  inputs.src-png-master.repo  = "nimlibpng";
  inputs.src-png-master.type  = "github";
  
  outputs = { self, nixpkgs, flakeNimbleLib, ...}@deps:
  let 
    lib  = flakeNimbleLib.lib;
    args = ["self" "nixpkgs" "flakeNimbleLib" "src-png-master"];
  in lib.mkRefOutput {
    inherit self nixpkgs ;
    src  = deps."src-png-master";
    deps = builtins.removeAttrs deps args;
    meta = builtins.fromJSON (builtins.readFile ./meta.json);
  };
}