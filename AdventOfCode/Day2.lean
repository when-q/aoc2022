import Mathlib.Data.Array.Basic
def single (p : Int × Int) : Int :=
  let o := p.fst - 'A'.toNat + 1
  let m := p.snd - 'X'.toNat + 1

  match m - o with
  | 1 | -2 => 6 + m
  | 0 => 3 + m
  | _ => m

-- Part 2
def new_strat_single (p : Int × Int) : Int :=
  let o := p.fst - 'A'.toNat + 1
  let m := p.snd - 'X'.toNat + 1 -- lose, draw, win

  match m with
  | 1  => -- lose
    if o - 1 != 0 then o - 1 else 3
  | 2 => 3 + o
  | _ => 
    if (o + 1) == 4 then 7
    else o + 1 + 6

def parse_format : List String → List (List String)
  | (x :: xs) => (x.splitOn " ") :: parse_format xs
  | [] => []

def composed_parse (input : Array String) : List (String × String) :=
  let flist := (List.transpose (parse_format (input.toList)))
  List.zip flist[0]! flist[1]!

def score (f : (Int × Int) → Int)( l : List (String × String))  :=
  match l with
  | [] => 0
  | (x, y) :: xs => 
    let p := (Int.ofNat x.back.toNat, Int.ofNat y.back.toNat)
    f p + score f xs

def main  : IO UInt32 :=
do let input ← IO.FS.lines "Inputs/Day2.txt"
   IO.print $ score single (composed_parse input)
   IO.print "\n"
   IO.print $ score new_strat_single (composed_parse input)
   IO.print "\n"
   return 0

#eval main
