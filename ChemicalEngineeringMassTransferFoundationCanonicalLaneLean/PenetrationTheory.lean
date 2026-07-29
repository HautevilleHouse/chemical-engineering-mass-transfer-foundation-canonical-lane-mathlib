import HautevilleHouse.ChemicalEngineeringMassTransferFoundationCanonicalLaneLean.FickDiffusionPDE

namespace HautevilleHouse
namespace ChemicalEngineeringMassTransferFoundationCanonicalLaneLean

structure PenetrationTheoryPackage {F : FickDiffusionPDEPackage} where
  contactTime : Prop
  penetrationDepth : Prop
  unsteadyStateDiffusion : Prop
  averageFlux : Prop

structure PenetrationTheoryEvidence {F : FickDiffusionPDEPackage}
    (P : PenetrationTheoryPackage F) where
  contactTimeClosed : P.contactTime
  penetrationDepthClosed : P.penetrationDepth
  unsteadyStateDiffusionClosed : P.unsteadyStateDiffusion
  averageFluxClosed : P.averageFlux

def PenetrationTheoryClosed {F : FickDiffusionPDEPackage}
    (P : PenetrationTheoryPackage F) : Prop :=
  P.contactTime ∧ P.penetrationDepth ∧
  P.unsteadyStateDiffusion ∧ P.averageFlux

theorem penetration_theory_closed_from_evidence
    {F : FickDiffusionPDEPackage} (P : PenetrationTheoryPackage F)
    (E : PenetrationTheoryEvidence P) : PenetrationTheoryClosed P := by
  exact And.intro E.contactTimeClosed
    (And.intro E.penetrationDepthClosed
      (And.intro E.unsteadyStateDiffusionClosed E.averageFluxClosed))

end ChemicalEngineeringMassTransferFoundationCanonicalLaneLean
end HautevilleHouse
