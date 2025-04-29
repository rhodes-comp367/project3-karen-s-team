{-# LANGUAGE EmptyDataDecls, EmptyCase, ExistentialQuantification,
             ScopedTypeVariables, NoMonomorphismRestriction, RankNTypes,
             PatternSynonyms #-}
module MAlonzo.Code.Fin where

import MAlonzo.RTE (coe, erased, AgdaAny, addInt, subInt, mulInt,
                    quotInt, remInt, geqInt, ltInt, eqInt, eqFloat, add64, sub64,
                    mul64, quot64, rem64, lt64, eq64, word64FromNat, word64ToNat)
import qualified MAlonzo.RTE
import qualified Data.Text

name2 = "Fin.Fin"
d2 a0 = ()
data T2 = C6 | C10 T2
name14 = "Fin.maximum"
d14 :: Integer -> T2
d14 v0
  = case coe v0 of
      0 -> coe C6
      _ -> let v1 = subInt (coe v0) (coe (1 :: Integer)) in
           coe C10 (d14 (coe v1))
name20 = "Fin.lift"
d20 :: Integer -> T2 -> T2
d20 v0 v1 = du20 v1
du20 :: T2 -> T2
du20 v0 = coe v0
name26 = "Fin.decrement"
d26 :: Integer -> T2 -> T2
d26 v0 v1
  = case coe v1 of
      C6
        -> let v3 = subInt (coe v0) (coe (1 :: Integer)) in
           coe d14 (coe v3)
      C10 v3 -> coe v3
      _ -> MAlonzo.RTE.mazUnreachableError
name32 = "Fin.Maybe"
d32 a0 = ()
data T32 = C36 | C38 AgdaAny
name42 = "Fin.increment-maybe"
d42 :: Integer -> T2 -> T32
d42 v0 v1
  = case coe v1 of
      C6
        -> case coe v0 of
             1 -> coe C36
             _ -> coe C38 (coe C10 (coe C6))
      C10 v3
        -> let v4 = subInt (coe v0) (coe (1 :: Integer)) in
           let v5 = d42 (coe v4) (coe v3) in
           case coe v5 of
             C36 -> coe v5
             C38 v6 -> coe C38 (coe C10 v6)
             _ -> MAlonzo.RTE.mazUnreachableError
      _ -> MAlonzo.RTE.mazUnreachableError
name58 = "Fin.increment"
d58 :: Integer -> T2 -> T2
d58 v0 v1
  = let v2
          = d42 (coe addInt (coe (1 :: Integer)) (coe v0)) (coe v1) in
    case coe v2 of
      C36 -> coe C6
      C38 v3 -> coe v3
      _ -> MAlonzo.RTE.mazUnreachableError
