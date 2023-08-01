let comp () =
 print_string "0";
 print_string (perform E);
 print_string "3"
 
let () =
 match_with comp () {
 retc = Fun.id;
 effc = (fun eff ->
  match eff with
  | E -> Some (fun k ->
   print_string "1"; continue k "2"; print_string "4")
  | _ -> None);
 exnc = raise; }
