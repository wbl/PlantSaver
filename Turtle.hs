module Turtle  where
import Graphics.Gloss.Data.Picture
data Op = Push |
         Pop |
         TurnLeft Float |
         TurnRight Float |
         Forward Float |
         Moveto Float Float |
         Nop
type Prog = [Op]
data Terapin = Terapin {x::Float, y::Float, angle::Float}
type State = [Terapin]
advance :: (State,[Picture])->Op->(State,[Picture])
advance ((g:gs), ps) op  = case op of
                                    Nop -> ((g:gs), ps)
                                    TurnLeft a -> ((g{angle=angle(g)+a}:gs),
                                                                           ps)
                                    TurnRight a -> ((g{angle=angle(g)-a}:gs), 
                                                                            ps)
                                    Forward n -> ((gnu:gs), pic:ps) where
                                        oldx = x(g)
                                        oldy = y(g)
                                        ang = angle(g)
                                        xprime = oldx+sin(pi/180*ang)*n
                                        yprime = oldy+cos(pi/180*ang)*n
                                        pic = Line[(oldx, oldy),(xprime, yprime)]
                                        gnu=g{x=xprime, y=yprime}
                                    Push -> (g:(g:gs), ps)
                                    Pop -> (gs, ps)

interp :: Prog->Picture
interp y= (\(_,x)->Pictures (reverse x)) $
       foldl advance (([Terapin{x= 0.0,y= 0.0, angle= 90.0}]), []) y