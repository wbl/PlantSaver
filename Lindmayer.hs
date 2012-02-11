module Lindmayer where --add in restrictions later
import qualified Data.Map as Map
import Turtle --we are going all the way to graphics
import Graphics.Gloss
data Symbol = Symbol String
              deriving (Eq, Ord,Show)
type Rules = Map.Map Symbol [Symbol]
type Interp = Map.Map Symbol Op
data System = System Symbol Rules Interp
expand :: Rules->Symbol->[Symbol]
expand m x=Map.findWithDefault [x] x m
fractgen :: Rules->[Symbol]->[Symbol]
fractgen m frac = (concat . map (\x-> expand m x)) frac
iter :: Int->(a->a)->(a->a)
iter 0 f = (\x->x)
iter n f = f . (iter (n-1) f)
fractal ::Int->System->Picture
fractal n (System start rule vals) = interp (map (\x->vals Map.! x)
                                                     ((iter n
                                                                    (fractgen rule))
                                                     [start]))
