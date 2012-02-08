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
                                                     
main = animate (FullScreen (1000,1000)) white
       (\x->(Translate (-500)  (200) (fractal (min (floor(x/2)) 5) koch)))