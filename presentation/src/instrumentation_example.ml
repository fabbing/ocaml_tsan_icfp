let r = ref 0 in

fun () ->
  r := 10;
  let x = !r in
  g x
