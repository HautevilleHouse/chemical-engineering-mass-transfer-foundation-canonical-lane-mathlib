import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringMassTransferFoundationCanonicalLaneLean

structure FicksLawDiffusionPackage where
  diffusionCoefficient : Type
  concentrationGradient : Type
  molarFlux : Type
  fickFirstLawValid : Prop
  fickSecondLawValid : Prop
  firstLawClosed : fickFirstLawValid
  secondLawClosed : fickSecondLawValid

structure FicksLawDiffusionEvidence (F : FicksLawDiffusionPackage) where
  firstLawClosed : F.fickFirstLawValid
  secondLawClosed : F.fickSecondLawValid

def FicksLawDiffusionClosed (F : FicksLawDiffusionPackage) : Prop :=
  F.fickFirstLawValid ∧ F.fickSecondLawValid

theorem ficks_law_diffusion_closed_from_evidence (F : FicksLawDiffusionPackage)
    (E : FicksLawDiffusionEvidence F) : FicksLawDiffusionClosed F := by
  exact And.intro E.firstLawClosed E.secondLawClosed

end ChemicalEngineeringMassTransferFoundationCanonicalLaneLean
end HautevilleHouse