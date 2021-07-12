open Core
open Notty

let default_bg = A.(bg black)
let selection_bg = A.(bg lightblack)

let text = A.(fg lightwhite ++ default_bg)
let ahead_gain = A.(A.(fg green ++ default_bg) ++ st bold)
let ahead_loss = A.(fg yellow ++ default_bg)
let behind_gain = A.(fg magenta ++ default_bg)
let behind_loss = A.(A.(fg red ++ default_bg)++ st bold)
let idle = A.(fg cyan ++ default_bg)
let label = A.(fg white ++ default_bg)

let color_of_hsl h s l =
  let hsl = Color.of_hsl h s l in
  let rgba = Color.to_rgba hsl in
  A.rgb_888 ~r:rgba.r ~g:rgba.g ~b:rgba.b

let rainbow () =
  let period = 3. in
  let h = Float.mod_float (Unix.gettimeofday ()) period /. period *. 360. in
  let rb = color_of_hsl h 1. 0.7 in
  A.(fg rb ++ default_bg ++ st bold)
;;
