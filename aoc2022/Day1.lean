import Mathlib.Data.Array.Basic

def format (l : List Int) (i : Int) : List Int :=
match l with 
| [] => [i]
| (x :: xs) => 
  if  x != 0  then
    format xs (x + i)
  else
    (x + i) :: format xs 0

def getMax (l :List Int) (ans : Int): Int :=
  match l with
  | [] => ans
  | x :: xs => 
      if x > ans then 
        getMax xs x
      else 
        getMax xs ans
def getMaxThree (l :List Int) : Int := 
  let ans := (l.toArray.qsort (· > ·)).toList
  match ans with
  | a :: b :: c :: _ => a + b + c
  | _ => 0

def main  : IO UInt32 :=
do let input ← IO.FS.lines "Inputs/Day1.txt"

   IO.print $ (getMax (format (input.toList.map String.toInt!) 0 ) 0)
   IO.print "\n"
   IO.print $ (getMaxThree (format (input.toList.map String.toInt!) 0 ))
   IO.print "\n"

   return 0

#eval main
