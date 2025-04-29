module Fin where

open import Agda.Builtin.Nat

data Fin : Nat → Set where
  zero : ∀ {n}
    → Fin (suc n)
  suc : ∀ {n} → Fin n
    → Fin (suc n)
    
maximum : {n : Nat} → Fin (suc n)
maximum {zero} = zero
maximum {suc n} = suc maximum

lift : {n : Nat} → Fin n → Fin (suc n)
lift zero = zero
lift (suc k) = suc (lift k)

decrement : {n : Nat} → Fin n → Fin n
decrement zero = maximum
decrement (suc k) = lift k

data Maybe (A : Set) : Set where
  nothing : Maybe A
  just : A → Maybe A

increment-maybe : {n : Nat} → Fin n → Maybe (Fin n)
increment-maybe {suc zero} zero = nothing
increment-maybe {suc (suc _)} zero = just (suc zero)
increment-maybe (suc k) with increment-maybe k
... | nothing = nothing
... | just l = just (suc l)

increment : {n : Nat} → Fin (suc n) → Fin (suc n)
increment k with increment-maybe k
... | nothing = zero
... | just l = l
