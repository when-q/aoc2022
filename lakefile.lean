import Lake
open Lake DSL

package «aoc2022»{
  -- add package configuration options here
}

lean_lib aoc2022{
  -- add library configuration options here
  
}

@[default_target]
lean_exe «aoc» {
  root := `AOC
  supportInterpreter := true
}
require mathlib from git
  "https://github.com/leanprover-community/mathlib4.git"
