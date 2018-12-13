type t

external of_string : string -> t = "big-rational" [@@bs.module]
external of_bigint : Z.t -> t = "big-rational" [@@bs.module]
external of_float : float -> t = "big-rational" [@@bs.module]
external to_float : t -> float = "valueOf" [@@bs.send]
external to_string : t -> string = "toString" [@@bs.send]

external lt : t -> t -> bool = "lt" [@@bs.send]
external leq : t -> t -> bool = "leq" [@@bs.send]
external gt : t -> t -> bool = "gt" [@@bs.send]
external geq : t -> t -> bool = "geq" [@@bs.send]
let min a b = if lt a b then a else b
let max a b = if gt a b then a else b

external (+) : t -> t -> t = "add" [@@bs.send]
external (-) : t -> t -> t = "subtract" [@@bs.send]
external neg : t -> t = "neg" [@@bs.send]
external ( * ) : t -> t -> t = "multiply" [@@bs.send]
external (/) : t -> t -> t = "divide" [@@bs.send]

let pp_print f x = Format.pp_print_string f (to_string x)
