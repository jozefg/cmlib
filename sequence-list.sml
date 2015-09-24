structure ListSequence
   :>
   sig
      include SEQUENCE
              where type 'a seq = 'a list
   end
   =
struct
   exception NYI (* not yet implemented *)

   type 'a seq = 'a list

   datatype 'a treeview =
      EMPTY
    | ELT of 'a
    | NODE of ('a seq * 'a seq)

   fun showt l =
      (case l of
          [] => EMPTY
        | [x] =>
             ELT x
        | h :: t =>
             NODE ([h], t))

   fun hidet t =
      (case t of
          EMPTY =>
             []
        | ELT x =>
             [x]
        | NODE (l1, l2) =>
             l1 @ l2)

   datatype 'a listview =
      NIL
    | CONS of ('a * 'a seq)

   fun showl l =
      (case l of
          [] => NIL
        | h :: t =>
             CONS (h, t))

   fun hidel l =
      (case l of
          NIL => []
        | CONS (h, t) =>
             h :: t)

   type 'a ord = 'a * 'a -> order

   fun empty () = []

   fun singleton x = [x]

   val length = List.length
   fun nth l i = List.nth (l, i)
   val map = List.map
   fun fromList l = l
   val append = op @
   fun toList l = l
   val cons = op ::
   val fold = List.foldl
   val foldl = List.foldl
   val foldr = List.foldr

   fun iter f b s = foldl (fn (x, y) => f (y, x)) b s
   fun tabulate f i = List.tabulate (i, f)
   val collate = List.collate
   fun map2 f xs ys = ListPair.map f (xs, ys)
   val reduce = List.foldl
   fun scan _ _ _ = raise NYI
   val filter = List.filter
   fun foldlh _ _ _ = raise NYI
   fun iterh _ _ _ = raise NYI
   val flatten = List.concat
   fun partition _ _ = raise NYI
   fun inject _ _ = raise NYI
   val take = List.take
   val drop = List.drop
   fun rake _ _ = raise NYI
   fun subseq _ _ = raise NYI

   fun splitMid ([], _) = NONE
     | splitMid (xs, i) =
       let
         val left = List.take (xs, i)
         val middle :: right = List.drop (xs, i div 2)
       in
         SOME (left, middle, right)
       end

   fun sort _ _ = raise NYI
   fun merge _ _ = raise NYI
   fun collect _ _ = raise NYI
   fun toString f [] = "[]"
     | toString f (x :: xs) =
       "[" ^ List.foldl (fn (x, s) => s ^ ", " ^ f x) (f x) xs ^ "]"
   fun tokens _ _ = raise NYI
   fun fields _ _ = raise NYI
   fun showti _ _ = raise NYI
   fun hidet _ = raise NYI

end
