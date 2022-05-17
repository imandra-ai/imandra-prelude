let expect_z_eq a b =
  if Z.(a = b) then
    print_endline "pass"
  else
    print_endline (Printf.sprintf "fail: %s <> %s" (Z.to_string a) (Z.to_string b))

let expect_ x =
  if x then
    print_endline "pass"
  else
    print_endline "fail"

let run_test name f =
  print_endline (Printf.sprintf "%s:" name);
  f ()

let () =
  run_test "Z negative mod" (fun () ->
      expect_z_eq (Z.(mod) (Z.of_string "-10") (Z.of_string "3")) (Z.of_string "-1"));

  run_test "Int negative mod" (fun () ->
      expect_z_eq (Imandra_prelude.Int.(mod) (Z.of_string "-10") (Z.of_string "3")) (Z.of_string "2"));

  run_test "Poly gt" (fun () ->
      expect_ (Imandra_prelude.(>) (Z.of_string "2") (Z.of_string "0")));

  run_test "Poly lt" (fun () ->
      expect_ (Imandra_prelude.(<) (Z.of_string "0") (Z.of_string "2")));

  run_test "Equal" (fun () ->
      expect_ (Z.(equal) (Z.of_nativeint 3n) (Z.of_nativeint 3n))
    );

  (* this cant pass on bucklescript currently. in native ocaml, Zarith hooks
  into polymorphic equals to make this work, but bucklescript doesn't have
  similar hooks as far as we're aware currently *)

  (* run_test "Poly =" (fun () -> *)
  (*     expect_ (Imandra_prelude.(=) (Z.of_string "0") (Z.of_string "2"))) *)
