module Main where
import qualified Data.Map as Map
import Turtle
import Lindmayer
import Graphics.Gloss
koch = System (Symbol "F") (Map.fromList[(Symbol "F",
                                                    [Symbol "F",
                                                     Symbol "L",
                                                     Symbol "F",
                                                     Symbol "R",
                                                     Symbol "F",
                                                     Symbol "R",
                                                     Symbol "F",
                                                     Symbol "L",
                                                     Symbol "F"])])
       (Map.fromList[(Symbol "F", Forward 5), (Symbol "R", TurnRight 90),
                                             (Symbol "L", TurnLeft 90)])
gosper = System (Symbol "FL") (Map.fromList[
                                       ( Symbol "FL",
                                                     [ Symbol "FL",
                                                       Symbol "+",
                                                       Symbol "FR",
                                                       Symbol "+",
                                                       Symbol "+",
                                                       Symbol "FR",
                                                       Symbol "-",
                                                       Symbol "FL",
                                                       Symbol "-",
                                                       Symbol "-",
                                                       Symbol "FL",
                                                       Symbol "FL",
                                                       Symbol "-",
                                                       Symbol "FR",
                                                       Symbol "+"]),
                                       (Symbol "FR", 
                                                   [ Symbol "-",
                                                     Symbol "FL",
                                                     Symbol "+",
                                                     Symbol "FR",
                                                     Symbol "FR",
                                                     Symbol "+",
                                                     Symbol "+",
                                                     Symbol "FR",
                                                     Symbol "+",
                                                     Symbol "FL",
                                                     Symbol "-",
                                                     Symbol "-",
                                                     Symbol "FL",
                                                     Symbol "-",
                                                     Symbol "FR"])])
         (Map.fromList [(Symbol "FR", Forward 5), (Symbol "FL", Forward 5),
                                                 (Symbol "-", TurnLeft 60),
                                                 (Symbol "+", TurnRight 60)])
                                                         
fractfuncs = [ (\x->(Translate (-500)  (200)
                                   (fractal (min (floor(x/2)) 5) koch))),
               (\x->(fractal (min (floor(x/2)) 6) gosper))] 
main = animate (FullScreen (1000,1000)) white (fractfuncs !! 1)