declare_syntax_cat compClause
syntax "for " term " in " term : compClause
syntax "if " term : compClause
syntax "Δ" compClause : compClause

syntax "[" term " | " compClause,* "]" : term

def List.diag (xss : List (List α)) : List α :=
  match xss with
  | [] => []
  | []::_ => []
  | (x::_)::xss => x :: List.diag (List.map (· |>.tailD []) xss)
termination_by _ => xss.length

macro_rules
  | `([$t:term |]) => `([$t])
  | `([$t:term | for $x in $xs]) => `(List.map (λ $x => $t) $xs)
  | `([$t:term | if $x]) => `(if $x then [$t] else [])
  | `([$t:term | Δ $c, $cs,*]) => `(List.diag [[$t | $cs,*] | $c]) -- warning, inefficient
  | `([$t:term | $c, $cs,*]) => `(List.join [[$t | $cs,*] | $c])
def List.prod (xs : List α) (ys : List β) : List (α × β) := [(x, y) | for x in xs, for y in ys]


#eval [x + 1 | for x in [1, 2, 3]]
