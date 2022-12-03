declare_syntax_cat compClause
syntax "for " term " in " term : compClause
syntax "if " term : compClause
syntax " ∈ " term : compClause
syntax "[" term " | " compClause,* "]" : term


macro_rules
  | `([$t:term |]) => `([$t])
  | `([$t:term | for $x in $xs]) => `(List.map $xs  (λ $x => $t))
  | `([$t:term | if $x]) => `(if $x then [$t] else [])
  | `([$t:term | $c, $cs,*]) => `(List.join [[$t | $cs,*] | $c])
