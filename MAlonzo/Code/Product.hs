{-# LANGUAGE EmptyDataDecls, EmptyCase, ExistentialQuantification,
             ScopedTypeVariables, NoMonomorphismRestriction, RankNTypes,
             PatternSynonyms #-}
module MAlonzo.Code.Product where

import MAlonzo.RTE (coe, erased, AgdaAny, addInt, subInt, mulInt,
                    quotInt, remInt, geqInt, ltInt, eqInt, eqFloat, add64, sub64,
                    mul64, quot64, rem64, lt64, eq64, word64FromNat, word64ToNat)
import qualified MAlonzo.RTE
import qualified Data.Text

name6 = "Product._×_"
d6 a0 a1 = ()
type T6 a0 a1 = (,) a0 a1
pattern C12 a0 a1 = (,) a0 a1
check12 :: forall xA. forall xB. xA -> xB -> T6 xA xB
check12 = (,)
cover6 :: (,) a1 a2 -> ()
cover6 x
  = case x of
      (,) _ _ -> ()
