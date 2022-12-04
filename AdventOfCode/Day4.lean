import Mathlib
import AdventOfCode.Utils.macro

def part1_solution : List (List (ℕ × ℕ)) → ℕ
| [(x, y), (z, w)] :: xs =>
  if (x ≤ z ∧ y ≥ w) ∨ (z ≤ x ∧ w ≥ y) then
    1 + part1_solution xs
  else
    part1_solution xs
| _ => 0
def part2_solution : List (List (ℕ × ℕ)) → ℕ
| [(x, y), (z, w)] :: xs =>
  if y ≥ w ∧ Int.ofNat w - x ≥ 0 
  ∨  w ≥ y ∧ Int.ofNat y - z ≥ 0 then
      1 + part2_solution xs
  else
    part2_solution xs
| _ => 0
def pair_format : List (List ℕ) → List (ℕ × ℕ)
| [x, y] :: xs => (x, y) :: pair_format xs
| _ => []

def format : List String → List (List (ℕ × ℕ))
| [] => []
| x :: xs => 
  let p := pair_format [((k.splitOn "-").map String.toNat!) | for k in x.splitOn "," ]
  p :: format xs
     
def day4: IO PUnit :=
do let input ← IO.FS.lines "Inputs/Day4.txt"
   IO.print $ input.toList |> format |> part1_solution
   IO.print "\n"
   IO.print $ input.toList |> format |> part2_solution
   IO.print "\n"

#eval day4
