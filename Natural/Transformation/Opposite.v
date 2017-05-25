Set Warnings "-notation-overridden".

Require Import Category.Lib.
Require Export Category.Theory.Natural.Transformation.
Require Export Category.Construction.Opposite.
Require Export Category.Functor.Opposite.

Generalizable All Variables.
Set Primitive Projections.
Set Universe Polymorphism.
Unset Transparent Obligations.

Definition Opposite_Transform `{F : C ⟶ D} {G : C ⟶ D} `(N : F ⟹ G) :
  G^op ⟹ F^op :=
  @Build_Transform (C^op) (D^op) (G^op) (F^op) N
    (λ (X Y : (C ^op)%category) (f : X ~{C^op}~> Y),
      @naturality_sym C D F G N Y X f)
    (λ (X Y : (C ^op)%category) (f : X ~{C^op}~> Y),
      @naturality C D F G N Y X f).

Notation "N ^op" := (@Opposite_Transform _ _ _ _ N)
  (at level 7, format "N ^op") : transform_scope.

Corollary Opposite_Transform_invol `{F : C ⟶ D} {G : C ⟶ D} `(N : F ⟹ G) :
  (N^op)^op = N.
Proof. reflexivity. Qed.
