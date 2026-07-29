import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringMassTransferFoundationCanonicalLaneLean

structure MassTransferCoefficientPackage {C : ConvectiveMassTransferPackage} where
  filmThickness : Type u
  massTransferCoefficient : Type v
  filmTheoryRelation : Prop
  penetrationTheoryRelation : Prop
  surfaceRenewalRelation : Prop

structure MassTransferCoefficientEvidence {C : ConvectiveMassTransferPackage}
    (M : MassTransferCoefficientPackage C) where
  filmTheoryRelationClosed : M.filmTheoryRelation
  penetrationTheoryRelationClosed : M.penetrationTheoryRelation
  surfaceRenewalRelationClosed : M.surfaceRenewalRelation

def MassTransferCoefficientClosed {C : ConvectiveMassTransferPackage}
    (M : MassTransferCoefficientPackage C) : Prop :=
  M.filmTheoryRelation ∧ M.penetrationTheoryRelation ∧ M.surfaceRenewalRelation

theorem mass_transfer_coefficient_closed_from_evidence
    {C : ConvectiveMassTransferPackage} (M : MassTransferCoefficientPackage C)
    (E : MassTransferCoefficientEvidence M) : MassTransferCoefficientClosed M := by
  exact And.intro E.filmTheoryRelationClosed (And.intro E.penetrationTheoryRelationClosed E.surfaceRenewalRelationClosed)

end ChemicalEngineeringMassTransferFoundationCanonicalLaneLean
end HautevilleHouse
