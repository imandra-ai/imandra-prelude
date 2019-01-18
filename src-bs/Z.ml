type t

external of_string : string -> t = "big-integer" [@@bs.module]
external of_int : int -> t = "big-integer" [@@bs.module]
external to_int : t -> int = "valueOf" [@@bs.send]
external to_float : t -> float = "valueOf" [@@bs.send]
external to_string : t -> string = "toString" [@@bs.send]
external lt : t -> t -> bool = "lt" [@@bs.send]
external gt : t -> t -> bool = "gt" [@@bs.send]
external leq : t -> t -> bool = "leq" [@@bs.send]
external geq : t -> t -> bool = "geq" [@@bs.send]
external zero : t = "zero" [@@bs.module "big-integer"]
external minus_one : t = "minusOne" [@@bs.module "big-integer"]
external one : t = "one" [@@bs.module "big-integer"]
external (+) : t -> t -> t = "add" [@@bs.send]
external (-) : t -> t -> t = "subtract" [@@bs.send]
external (~-) : t -> t = "negate" [@@bs.send]
external (~+) : t -> t = "%identity"
external ( * ) : t -> t -> t = "multiply" [@@bs.send]
external (=) : t -> t -> bool = "eq" [@@bs.send]

external (mod) : t -> t -> t = "mod" [@@bs.send]

type q_r = { quotient: t; remainder: t } [@@bs.deriving abstract]
external div_rem_ : t -> t -> q_r = "divmod" [@@bs.send]

external pred : t -> t = "prev" [@@bs.send]
external succ : t -> t = "next" [@@bs.send]

external add : t -> t -> t = "add" [@@bs.send]
external sub : t -> t -> t = "subtract" [@@bs.send]

external abs : t -> t = "abs" [@@bs.send]

external equal : t -> t -> bool = "eq" [@@bs.send]

let sign x =
  if x > zero then 1 else if x = zero then 0 else -1

let div_rem a b =
  let q_r = div_rem_ a b
  in ((q_r |. quotientGet), (q_r |. remainderGet))

external rem : t -> t -> t = "mod" [@@bs.send]
let div a b = fst (div_rem a b)

(* from Zarith/z.mlp *)
let ediv_rem a b =
  (* we have a = a * b + r, but [Big_int]'s remainder satisfies 0 <= r < |b|,
     while [Z]'s remainder satisfies -|b| < r < |b| and sign(r) = sign(a)
   *)
   let q,r = div_rem a b in
   if sign r >= 0 then (q,r) else
   if sign b >= 0 then (pred q, add r b)
   else (succ q, sub r b)

let fdiv a b = div a b

let cdiv a b =
  let (q,r) = div_rem a b in
  if r = zero then q else succ q

let ediv a b =
   if sign b >= 0 then fdiv a b else cdiv a b

let erem a b =
   let r = rem a b in
   if sign r >= 0 then r else add r (abs b)

let pp_print f x = Format.pp_print_string f (to_string x)

external min : t -> t -> t = "min" [@@bs.module "big-integer"]
external max : t -> t -> t = "max" [@@bs.module "big-integer"]
