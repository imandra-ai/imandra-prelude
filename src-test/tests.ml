let expect_z_eq a b =
  if (Z.(=) a b) then
    print_endline "pass"
  else
    print_endline (Printf.sprintf "fail: %s <> %s" (Z.to_string a) (Z.to_string b))

let run_test name f =
  print_endline (Printf.sprintf "%s:" name);
  f ()

let () =
  run_test "Z negative mod" (fun () ->
      expect_z_eq (Z.(mod) (Z.of_string "-10") (Z.of_string "3")) (Z.of_string "-1"));

  run_test "Int negative mod" (fun () ->
      expect_z_eq (Imandra_prelude.Int.(mod) (Z.of_string "-10") (Z.of_string "3")) (Z.of_string "2"));


