import Mathlib
def single_turn (part1: Bool) (p : Int × Int) : Int :=

  let o := p.fst
  let m := p.snd 

  match part1 with
  | true => -- part 1
      match m - o with
      | 1 | -2 => 6 + m
      | 0 => 3 + m
      | _ => m

  | false =>  -- part 2
      match m with
      | 1  => -- lose
          if o - 1 != 0 then o - 1 else 3
      | 2 => 3 + o
      | _ => 
          if (o + 1) == 4 then 7
          else o + 7

def parse_format : List String → List (List Int)
  | (x :: xs) => 
    let l := (x.splitOn " ")
    let x1 := (Int.ofNat l[0]!.back.toNat) - 'A'.toNat + 1
    let x2 := (Int.ofNat l[1]!.back.toNat) - 'X'.toNat + 1
    (x1 :: x2 :: []) :: parse_format xs
  | [] => []

def composed_parse (input : Array String) : List (Int × Int) :=
  let flist := (List.transpose (parse_format (input.toList)))
  List.zip flist[0]! flist[1]!

def day2: IO PUnit :=
do let input ← IO.FS.lines "Inputs/Day2.txt"
   IO.print $  ((composed_parse input).map (single_turn true)).foldr HAdd.hAdd 0
   IO.print "\n"
   IO.print $ ((composed_parse input).map (single_turn false)).foldr HAdd.hAdd 0
   IO.print "\n"

#eval day2
