(* forktest (C) 2008 Kim, Taegyoon *)

let myfork job1 job2 =
  if Unix.fork () = 0 then
    job1 ()
  else
    job2 ()

let rec do_parallel : (unit -> 'a) list -> 'a = fun jobs ->
  match jobs with
      [] -> ()
    | hd::tl -> myfork hd (fun () -> do_parallel tl)

let main () =
  (myfork
    (fun () -> print_string "child\n")
    (fun () -> print_string "parent\n"));
  (do_parallel [(fun () -> print_int 1);
		(fun () -> print_int 2);
		(fun () -> print_int 3)])

let _ = main ()
