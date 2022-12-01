import Lake
open Lake DSL

package «AdventOfCode»{
  -- add package configuration options here
}

lean_lib AdventOfCode{
  -- add library configuration options here
  
}

@[default_target]
lean_exe «aoc2022» {
  root := `AdventOfCode
  supportInterpreter := true
}
require mathlib from git
  "https://github.com/leanprover-community/mathlib4.git"
