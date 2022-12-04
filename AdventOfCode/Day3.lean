import Mathlib
import AdventOfCode.Utils.macro

#eval [(x, y) | for x in [1,2,3], for y in [3,1,4], if x != y]
-- [(1, 3), (1, 4), (2, 3), (2, 1), (2, 4), (3, 1), (3, 4)]
def score: Char → Int
| x =>
  if x.toNat >= 97 then
    x.toUpper.toNat - 64
  else
    x.toLower.toNat - 70

def single_str (x : String) : List Char × List Char :=
  let l := List.splitAt (x.data.length/2) x.data
  match l with
  | (x, y) => 
    ((x.toArray.qsort (· < ·)).toList, (y.toArray.qsort (· < ·)).toList)

def format : List String → List (List Char × List Char)
  | [] => []
  | x :: xs =>
    single_str x :: format xs

def single_match (x : List Char) (y : List Char): Int :=
  match y with
  | [] => 0
  | y :: ys => 
    if x.elem y then
       score y
    else
       single_match x ys
      
def part1_sol : List (List Char × List Char) → Int
| [] => 0
| (x, y) :: xs => (single_match x y) + (part1_sol xs)

--- part 2
def part2_format : List String → List (List Char)
| [] => []
| x :: xs => x.data :: part2_format xs

def part2_grouping (x : List Char)(y : List Char)(z : List Char) :=
  match x with
  | [] => 0
  | k :: ks =>
    if y.elem k ∧ z.elem k then
      score k
    else
      part2_grouping ks y z


def part2_sol : List (List Char) → Int 
| x :: y :: z :: xs => part2_grouping x y z + part2_sol xs
| _ => 0



def day3: IO PUnit :=
do let input ← IO.FS.lines "Inputs/Day3.txt"
   IO.print $ (input.toList |> format |> part1_sol)
   IO.print "\n"
   IO.print $ (part2_sol (input.toList |> part2_format ))
   IO.print "\n"
#eval day3
