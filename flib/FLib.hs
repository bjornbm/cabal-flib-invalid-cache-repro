module FLib where

import Lib

bar :: IO ()
bar = print foo

foreign export ccall bar :: IO ()
